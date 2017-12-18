module index
    include("Constants.jl")
    include("Steps.jl")
    include("Helpers.jl")

    function main()
        populasyon = Step.Initialise() # Baslangıc populasyonunu rastgele olustur (INITIALISE)

        for iterasyon = 1:Constant.ITERASYONSAYISI # Bitis kosulu saglanana kadar TEKRARLA(REPEAT)
            println("Generation: ", iterasyon)
            println("Populasyon: ", Helper.populasyonDict(populasyon))

            parents = Step.parentSelect(populasyon) # Ebeveynleri sec (PARENT SELECT)

            # Ebeveynleri caprazla (RECOMBINE) ve yavruları mutasyona tabi tut (MUTATE)
            # (Offsprings(Cocuklar), parents)
            (yeniAdaylar, ebeveynler) = Step.recombineAndMutate(parents)

            # İki diziyi birleştirir. Değerlerini hesaplayıp dictionary yapar.
            # sort'laryıp ilk 50 yi döndürür
            populasyon = Step.survivalSelect(yeniAdaylar, ebeveynler)

        end
    end

    main()
end
