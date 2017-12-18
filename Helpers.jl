module Helper
    # include("Steps.jl") # gülümse
    include("Constants.jl")

    # Dairesel şekilde random sayıları listeden getirir.
    # PARAMS
    #   sira:
    # RETURN
    #   random: random listesinden sıradaki değer
    function randomSayiGetir() # Helper.randomSayiGetir(Constant.RANDOMITERASYONU)
        if Constant.RANDOMITERASYONU == 11
            Constant.birle()
            return Constant.RANDOMLAR[1]
        end
        Constant.artir()
        return Constant.RANDOMLAR[Constant.RANDOMITERASYONU]
    end

    # Gelen birey çantaya sığıyor mu?
    # PARAMS
    #   gelenBirey: 1001100111
    # RETURN
    #   toplam: gelen bireyin çantadaki ağırlıgı(weight)
    function bireyAgirlikKontrolu(gelenBirey) # 01110011
        toplam = 0 # bireyin ağırlığı
        for iterator = 1:length(Constant.w)
            if gelenBirey[iterator] == 1
                toplam = toplam + Constant.w[iterator]
            end
        end
        if toplam > Constant.CANTABOYUTU
            return "0"
        else
            return toplam
        end
    end

    # Gelen bireyin değeri
    # PARAMS
    #   gelenBirey: 1001100111
    # RETURN
    #   toplam: gelen bireyin değeri(value)
    function bireyDegerKontrolu(gelenBirey) # 01110011
        toplam = 0 # bireyin ağırlığı

        if bireyAgirlikKontrolu(gelenBirey) != "0"
            for iterator = 1:length(Constant.w)
                if gelenBirey[iterator] == 1
                    toplam = toplam + Constant.v[iterator]
                end
            end
            return toplam
        else
            return 0
        end
    end

    # oran hesaplar
    # min + rand()*(max-min)
    function oranHesapla(populasyon)
        r = rand()
        z = round( 1 + (r * (populasyon - 1)))
        return trunc(Int, z)
    end

    # Verilen arraydeki bireylerin valuelerini hesaplayıp dictionary olarak döndürür.
    # PARAMS
    #   populasyon(array): Dönüştürülecek array
    # RETURN
    #   returnStatement: ["0010100111", 547], ["0010100111", 547].... tipinde dictionary olumus hali.
    function populasyonDict(populasyon)
        returnStatement = Dict()

        for b = 1:length(populasyon)
            returnStatement[populasyon[b]] = bireyDegerKontrolu(populasyon[b])
        end
        return returnStatement
    end

end
