module index
    include("Constants.jl")
    include("Steps.jl")
    include("Helpers.jl")

    populasyon = []


    function at(xxxxxxxxxxxx, it)
        # println("Populasyon: ", Helper.populasyonDict(xxxxxxxxxxxx))
        println(it, ".iterasyon. Eleman say: ", length(Helper.populasyonDict(xxxxxxxxxxxx)))
        # for i in Helper.populasyonDict(xxxxxxxxxxxx)
        #     println(i, " \n")
        # end

        parents = Step.parentSelect(xxxxxxxxxxxx) # Ebeveynleri sec (PARENT SELECT)

        # Ebeveynleri caprazla (RECOMBINE) ve yavruları mutasyona tabi tut (MUTATE)
        # (Offsprings(Cocuklar), parents)
        (yeniAdaylar, ebeveynler) = Step.recombineAndMutate(parents)

        # İki diziyi birleştirir. Değerlerini hesaplayıp dictionary yapar.
        # sort'laryıp ilk 50 yi döndürür
        xxxxxxxxxxxx = Step.survivalSelect(yeniAdaylar, ebeveynler)
        return xxxxxxxxxxxx
    end


    function main()
        global populasyon

        populasyon1 = Step.Initialise()
        populasyon2 = at(populasyon1, 1)
        populasyon3 = at(populasyon2, 2)
        populasyon4 = at(populasyon3, 3)

        # for iterasyon = 0:Constant.ITERASYONSAYISI # Bitis kosulu saglanana kadar TEKRARLA(REPEAT)
        #     println("Generation: ", iterasyon)
        #     if iterasyon == 0
        #         populasyon = Step.Initialise() # Baslangıc populasyonunu rastgele olustur (INITIALISE)
        #         populasyon = at(populasyon)
        #     else
        #         populasyon = at(populasyon)
        #     end
        # end
    end



    main()
end
