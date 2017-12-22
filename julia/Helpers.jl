module Helper
    # include("Steps.jl") # gülümse
    include("Constants.jl")
    Constant.initialInputs()

    # Dairesel sekilde random sayilari listeden getirir.
    # PARAMS
    #   sira:
    # RETURN
    #   (float)random: random listesinden siradaki deger
    function randomSayiGetir()
        if Constant.RANDOMITERASYONU == 11
            Constant.birle()
            return Constant.RANDOMLAR[Constant.RANDOMITERASYONU]
        end
        Constant.artir()
        return Constant.RANDOMLAR[Constant.RANDOMITERASYONU]
    end

    # Gelen birey cantaya sigiyor mu?
    # PARAMS
    #   (array)gelenBirey: [1,0,0,1,1,0,0,1,1,1]
    # RETURN
    #   Taşınabilecek bi bireyse True döner
    function bireyAgirlikKontrolu(gelenBirey)
        toplam = 0
        for iterator = 1:length(Constant.w)
            if gelenBirey[iterator] == 1
                toplam = toplam + Constant.w[iterator]
            end
        end
        if toplam > Constant.CANTABOYUTU
            return false
        else
            return true
        end
    end

    # Gelen bireyin degeri
    # PARAMS
    #   gelenBirey: [1,0,0,1,1,0,0,1,1,1]
    # RETURN
    #   (int)toplam: gelen bireyin degeri(value)
    function bireyDegerKontrolu(gelenBireyx)
        toplamx = 0
        if bireyAgirlikKontrolu(gelenBireyx)
            for iterators = 1:length(Constant.w)
                if gelenBireyx[iterators] == 1
                    toplamx = toplamx + Constant.v[iterators]
                end
            end
            return toplamx
        else
            return 0
        end
    end

    # oran hesaplar
    # min + (rand()*(max-min))
    function oranHesapla(populasyonSayisi)
        return trunc(Int, (1 + (randomSayiGetir() * (populasyonSayisi - 1))))
    end

    # Verilen arraydeki bireylerin valuelerini hesaplayip SORT'LU dictionary olarak dondurur.
    # PARAMS
    #   populasyon(array): Donusturulecek array
    # RETURN
    #   returnStatement: ["0010100111", 547], ["0010100111", 547].... tipinde dictionary olumus hali.
    function populasyonDict(populasyon)
        temmm = []
        for keyPerson in populasyon
            push!(temmm, (keyPerson, bireyDegerKontrolu(keyPerson)))
        end
        return sort!(collect(temmm), by=x->x[2], rev=true)
    end

end
