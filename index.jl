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
            else
                populasyon = Calculate(populasyon)
            end
        end
    end

    # main()

    function workingOnIt()
        # for O = 0:20
        #     print( Helper.oranHesapla(10), " | ")
        # end

        populasyonx = Step.Initialise();
        # for i=1:length(populasyonx)
        #     println(populasyonx[i])
        # end
        # println(length(populasyonx))
        # println(typeof(populasyonx))

        a = Step.parentSelect(populasyonx)
        # for i=1:length(a)
        #     println(a[i])
        # end
        # println(length(a))
        # println(typeof(a))

        cocuklar = Step.recombineAndMutate(a)
        # for i=1:length(cocuklar)
        #     println(cocuklar[i])
        # end
        # println(length(cocuklar))
        # println(typeof(cocuklar))

        as = vcat(cocuklar, populasyonx)

        populasyonlarx = Step.survivalSelect(as)
         # v = [(1, "c"), (3, "a"), (2, "b")]; sort!(v, by = x -> x[1]);
         # println(v)
        # for i=1:length(populasyonlarx)
        #     println(populasyonlarx[i])
        # end
        # println(length(populasyonlarx))
        # println(typeof(populasyonlarx))


    end

    workingOnIt()



end
