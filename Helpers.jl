module Helper
    # include("Steps.jl")
    include("Constants.jl")

    # Dairesel şekilde random sayıları listeden getirir.
    # PARAMS
    #   sira:
    # RETURN
    #   random: random listesinden sıradaki değer
    function randomSayiGetir(sira)
        if RANDOMITERASYONU == 12
            RANDOMITERASYONU = 1
            return Constants.RANDOMLAR[1]
        end
        RANDOMITERASYONU = RANDOMITERASYONU + 1
        return Constants.RANDOMLAR[sira]
    end

    # Gelen birey çantaya sığıyor mu?
    # PARAMS
    #   gelenBirey: 1001100111
    # RETURN
    #   toplam: gelen bireyin değeri(value)
    function bireyAgirlikKontrolu(gelenBirey) # 01110011
        toplam = 0 # bireyin ağırlığı
        for iterator = 1:length(Constant.w)
            if gelenBirey[iterator] == 1
                toplam = toplam + Constant.w[iterator]
            end
        end
        return toplam
    end

    # oran hesaplar
    # min + rand()*(max-min)
    function oranHesapla(populasyon)
        r = rand()
        z= round( 1 + (r * (populasyon - 1)))
        return trunc(Int,z)
    end


end
