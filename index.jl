module index
    include("Constants.jl")
    include("Steps.jl")
    include("Helpers.jl")

    populasyon = []


    function Calculate(populasyonlar)
        for i in Helper.populasyonDict(populasyonlar)

            # guzel yazdirma
            ff = ""
            for ix in i[0]
                ff = ff + str(ix)
            end
            print("(", ff, "),", i[1])
            # guzel yazdirma sonu
        end

        # Ebeveynleri sec (PARENT SELECT)
        parents = Step.parentSelect(populasyonlar)

        # Ebeveynleri caprazla (RECOMBINE) ve yavrulari mutasyona tabi tut (MUTATE)
        # (Offsprings(Cocuklar))
        cocuklar = Step.recombineAndMutate(parents)

        # Degerlerini hesaplayip dictionary yapar.
        # sort'laryip ilk 50 yi dondurur
        populasyonlarx = Step.survivalSelect(cocuklar + populasyonlar)
        return populasyonlarx
    end

    function main()
        global populasyon

        # Bitis kosulu saglanana kadar TEKRARLA(REPEAT)
        for iterasyon = 1:Constant.ITERASYONSAYISI
            print("\n\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Generation: ", iterasyon, " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")

            if iterasyon == 0
                # Baslangic populasyonunu rastgele olustur (INITIALISE)
                populasyon = Step.Initialise()
                populasyon = Calculate(populasyon)
            elseif iterasyon == 20
                print("\n\nFinal Population:")

                # guzel yazdirma
                ff = ""
                for ix in Helper.populasyonDict(populasyon)
                    ff = ff + str(ix) + "\n"
                end
                print(ff)
                # guzel yazdirma sonu
            else
                populasyon = Calculate(populasyon)
            end
        end
    end

    main()

end
