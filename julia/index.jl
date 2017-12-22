module index
    include("Constants.jl")
    include("Steps.jl")
    include("Helpers.jl")

    populasyon = []

    function Calculate(populasyonlar)
        # for i in Helper.populasyonDict(populasyonlar)
        #     println(i)
        # end

        # Ebeveynleri sec (PARENT SELECT)
        parents = Step.parentSelect(populasyonlar)

        # Ebeveynleri caprazla (RECOMBINE) ve yavrulari mutasyona tabi tut (MUTATE)
        # (Offsprings(Cocuklar))
        cocuklar = Step.recombineAndMutate(parents)

        # Degerlerini hesaplayip dictionary yapar.
        # sort'laryip ilk 50 yi dondurur
        populasyonlarx = Step.survivalSelect(vcat(cocuklar , populasyonlar))
        return populasyonlarx
    end

    function main()
        global populasyon

        # dosya okuma ve imputları ayarlama
        Constant.initialInputs()

        # Bitis kosulu saglanana kadar TEKRARLA(REPEAT)
        for iterasyon = 1:Constant.ITERASYONSAYISI
            # print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Generation: ", iterasyon, " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

            if iterasyon == 1
                # Baslangic populasyonunu rastgele olustur (INITIALISE)
                populasyon = Step.Initialise()
                populasyon = Calculate(populasyon)
            elseif iterasyon == Constant.ITERASYONSAYISI
                # print("\nFinal Population:\n")
                # for i in Helper.populasyonDict(populasyon)
                #     println(i)
                # end
            else
                populasyon = Calculate(populasyon)
            end
        end
    end

        a = now()
        main()
        b = now()
        println(b - a)

end
