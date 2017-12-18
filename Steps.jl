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
            ind = Helper.oranHesapla(populasyon)
            push!(PARENTS, BIREYLER[ind])
        end
        return PARENTS
    end

    # Recombine: Caprazlama islemini temsil eder. Tek noktalı caprazlama uygulanır. 5 elemanlı
    # bir birey icin 0.2 caprazlama noktası ikinci elemandan itibaren caprazlamayı gerektirir.
    function recombineAndMutate(parents)
        cocuklar = [] # Yeni oluşan offspringler
        tempParents = []

        while length(parents) > 0
            println("Applying Crossover")
            c1 = []
            c2 = []

            p1 = pop!(parents)
            push!(tempParents, p1)
            p2 = pop!(parents)
            push!(tempParents, p2)

            oran = Helper.oranHesapla(10)

            print("Parents: ", p1, ",", p2, " at point ", oran)

            for iterator = 1 : oran - 1
                push!(c1, p1[iterator])
                push!(c2, p2[iterator])
            end
            for iterator = oran : 10
                push!(c2, p1[iterator])
                push!(c1, p2[iterator])
            end

            println("\nOffsprings: ", c1, ",", c2)

            mutasyonluCocuk1 = Mutation(c1)
            mutasyonluCocuk2 = Mutation(c2)

            println("Mutated offsprings: ", mutasyonluCocuk1, " , ", mutasyonluCocuk2, "\n")
            push!(cocuklar, mutasyonluCocuk1)
            push!(cocuklar, mutasyonluCocuk2)
        end
        return cocuklar, tempParents
    end

    # Mutation: Bireyler uzerinde bit cevirme(bit flipping) mutasyonu uygulanır. Bakılan bit
    # icin uretilen rastgele deger mutasyon oranından kucukse o bit tersine cevrilir.
    function Mutation(cocuk)
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

    # Survival Select: Hayatta kalanların secilmesini temsil eder. Populasyon sayısı(µ)’nın
    # sabit kalması istendigi icin yeni uretilen yavrular(λ) populasyona eklenir ve tum populasyondan
    # en iyi µ tanesi secilir.
    function survivalSelect(offsprings, parents)    
        # iki diziyi birleştir
        # değerlerini hesaplayıp dictionary yap
        # sort la
        # ilk 50 yi döndür




    end

end
