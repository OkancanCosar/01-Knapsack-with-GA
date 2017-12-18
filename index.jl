module index
    include("Constants.jl")
    include("Steps.jl")
    include("Helpers.jl")

    function main()
        ilkPopulasyon = Step.Initialise() # Baslangıc populasyonunu rastgele olustur (INITIALISE)

        for iterasyon = 1:Constant.ITERASYONSAYISI # Bitis kosulu saglanana kadar TEKRARLA(REPEAT)
            println("Generation: ", iterasyon)

            parents = Step.parentSelect(ilkPopulasyon) # Ebeveynleri sec (PARENT SELECT)

            # Ebeveynleri caprazla (RECOMBINE) ve yavruları mutasyona tabi tut (MUTATE)
            # (Offsprings(Cocuklar), parents)
            (yeniAdaylar, ebeveynler) = Step.recombineAndMutate(parents)

            # İki diziyi birleştirir. Değerlerini hesaplayıp dictionary yapar.
            # sort'laryıp ilk 50 yi döndürür
            yeniPopulasyon = Step.survivalSelect(yeniAdaylar, ebeveynler)

        end
    end

    main()

    #
    # olusturulmusBireyler = bireyleriOlustur()
    #
    # Evaluate(olusturulmusBireyler)
    #
    # pranents = parentSelect(BIREYLER)
    #
    #
    # # C aprazlama islemini temsil eder. Tek noktalı caprazlama uygulanır. 5 elemanlı
    # # bir birey icin 0.2 caprazlama noktası ikinci elemandan itibaren caprazlamayı gerektirir.
    # Cocuklar = Recombine(pranents)
    #
    #
    #
    # for x = 1:length(Cocuklar)
    #     push!(BIREYLER, Cocuklar[x])
    # end #append!(BIREYLER, Cocuklar)
    #
    # println(length(BIREYLER))
    #
    # degisken = []
    # for d = 1:length(BIREYLER)
    #     push!(degisken, bireyKontrol(BIREYLER[d]))
    # end
    #
    # println(length(BIREYLER))
    #
    # yourdic = Dict(zip(BIREYLER, degisken))
    # println(length(BIREYLER))
    #
    # println((yourdic))
end
