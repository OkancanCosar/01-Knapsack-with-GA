module index
    include("Constants.jl")
    include("Steps.jl")
    include("Helpers.jl")

    populasyon = []


    function at(xxxxxxxxxxxx, it)
        println("Populasyon: ")

        for i = 1:length(xxxxxxxxxxxx)
            println(xxxxxxxxxxxx[i], ", ", Helper.bireyDegerKontrolu(xxxxxxxxxxxx[i]))
        end

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

        for iterasyon = 0:Constant.ITERASYONSAYISI # Bitis kosulu saglanana kadar TEKRARLA(REPEAT)
            println("Generation: ", iterasyon)
            if iterasyon == 0
                populasyon = Step.Initialise() # Baslangıc populasyonunu rastgele olustur (INITIALISE)
                populasyon = at(populasyon, iterasyon)
            else
                populasyon = at(populasyon, iterasyon)
            end
        end
    end



    main()




end
