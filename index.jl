module index
    include("Constants.jl")
    include("Steps.jl")
    include("Helpers.jl")

    populasyon = []

    function Calculate(populasyonlar)
        
        for i = 1:length(populasyonlar)
            println(populasyonlar[i], ", ", Helper.bireyDegerKontrolu(populasyonlar[i]))
        end

        # Ebeveynleri sec (PARENT SELECT)
        parents = Step.parentSelect(populasyonlar)

        # Ebeveynleri caprazla (RECOMBINE) ve yavruları mutasyona tabi tut (MUTATE)
        # (Offsprings(Cocuklar), parents)
        (yeniAdaylar, ebeveynler) = Step.recombineAndMutate(parents)

        # İki diziyi birleştirir. Değerlerini hesaplayıp dictionary yapar.
        # sort'laryıp ilk 50 yi döndürür
        populasyonlar = Step.survivalSelect(yeniAdaylar, ebeveynler)

        return populasyonlar
    end


    function main()
        global populasyon

        for iterasyon = 0:Constant.ITERASYONSAYISI # Bitis kosulu saglanana kadar TEKRARLA(REPEAT)
            println("Generation: ", iterasyon)
            if iterasyon == 0
                populasyon = Step.Initialise() # Baslangıc populasyonunu rastgele olustur (INITIALISE)
                populasyon = Calculate(populasyon)
            else
                populasyon = Calculate(populasyon)
            end
        end
    end

    main()

end
