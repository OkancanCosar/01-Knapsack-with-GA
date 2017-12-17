module Step
    include("Constants.jl")
    include("Helpers.jl")

    # Initialise: Popülasyonu ilk degerlendirme islemidir. Istenen populasyon boyutuna gore
    # yeni bireyler olusturur. Her bir birey bit dizisi seklinde temsi edilir.(9 elemanlı canta icin
    # ’100111010’ gibi). Bit dizisinin uzunlugu cantaya alınabilecek eleman sayısına esittir ve 0
    # degeri ilgili elemanın cantaya alınmayacagını, 1 degeri ise elemanın alınacagını belirtir. Yeni
    # bir birey olustururken her bir bit icin rastgele bir deger uretilir. Bitin degeri rastgele deger
    # 0.5’den kucukse 0 aksi takdirde 1 olacaktır
    function Initialise()
        birey = []
        bireyler = []
        while length(bireyler) < Constant.POPULASYONBOYUTU
            for i = 1:10
                tempRand = rand()
                if  tempRand >= Constant.BASLANGICOLASILIGI
                    push!(birey, 1)
                else
                    push!(birey, 0)
                end
            end
            if Helper.bireyAgirlikKontrolu(birey) < Constant.CANTABOYUTU
                push!(bireyler, birey)
            end
            birey=[] # temizle bireyi
         end
         println("Populasyon: ", bireyler)
         return bireyler
    end

    # Degerlendirme islemidir. Eger elemanlar cantaya sıgıyorsa degerlendirme sonucu
    # toplam tutar, sıgmıyorsa sıfır(0) olacaktır. Derste kullanılan degerlendirme yontemi
    # daha farklıdır.
    function Evaluate(bireys)
        for birey in bireys
            if bireyKontrol(birey) < CANTABOYUTU
                push!(BIREYLER, birey)
            end
        end
    end

    # Parent Select: Ebeveyn secimini temsil eder. Uretilen rastgele degere gore ebeveynler
    # secilir. Secme islemi sırasında populasyon boyutu 5 ise [0, 0.2] birinci, (0.2, 0.4] ikinci, (0.4,
    # 0.6] ucuncu, (0.6, 0.8] dorduncu, (0.8, 1] besinci ebeveyni temsil eder. Secilecek ebeveyn
    # sayısı 2’den fazla ise 2 ebeveyn secilip caprazlama ve mutasyon islemleri yapılır, kalan sayıda
    # ebeveyn 2’ser 2’ser secilerek aynı islemlere tabi tutulur. Ornegin populasyon boyutu 7 ise
    # ve 4 ebeveyn secilecekse once 2 ebeveyn secilir, caprazlama ve mutasyon uygulanır sonra
    # 2 ebeveyn daha secilerek caprazlama ve mutasyon uygulanır. Sonucta yavrularla(offspring)
    # birlikte populasyonda 11 birey olur.
    function parentSelect(BIREYLER)
        populasyon = length(BIREYLER)
        parentSayisi = 0
        PARENTS = []

        if isodd(populasyon)
            parentSayisi = populasyon - 1
        else
            parentSayisi = populasyon
        end

        for xx = 1:parentSayisi
            ind = oranHesapla(populasyon)
            println("index: ",ind)
            push!(PARENTS, BIREYLER[ind])
        end
        return PARENTS
    end




    # Recombine: Caprazlama islemini temsil eder. Tek noktalı caprazlama uygulanır. 5 elemanlı
    # bir birey icin 0.2 caprazlama noktası ikinci elemandan itibaren caprazlamayı gerektirir.
    function Recombine(parents)
        yeniCocuklar = []
        while length(parents) > 0
            p1 = pop!(parents)
            p2 = pop!(parents)

            println("parent1=> ", p1)
            println("parent2=> ", p2)
            c1 = []
            c2 = []

            # 11 1011101000  Ç! => 11 1000100010
            # 10 1000100010  Ç2 => 10 1011101000
            oran = Helper.oranHesapla(10)

            println("ORAN::::::::: ", oran)

            for asdasfas = 1 : oran - 1
                push!(c1, p1[asdasfas])
                push!(c2, p2[asdasfas])
            end

            for hh = oran : 10
                push!(c2, p1[hh])
                push!(c1, p2[hh])
            end

            println("çocuk1=> ", c1)
            println("çocuk2=> ", c2)

            println("-----------------------------------------------")
            println("============MUTASYON============")

            push!(yeniCocuklar, Mutasyon(c1))
            push!(yeniCocuklar, Mutasyon(c2))

            println("-----------------------------------------------")
        end
        return yeniCocuklar
    end

    # Mutasyon: Bireyler uzerinde bit cevirme(bit flipping) mutasyonu uygulanır. Bakılan bit
    # icin uretilen rastgele deger mutasyon oranından kucukse o bit tersine cevrilir.
    function Mutasyon(cocuk)
        for iterasyon = 1:length(cocuk)
            tempRand = rand()
            if Constant.MUTASYONOLASILIGI > tempRand
                if cocuk[iterasyon] == 0
                    cocuk[iterasyon] = 1
                else
                    cocuk[iterasyon] = 0
                end
            end
        end
        return cocuk
    end


end
