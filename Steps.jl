module Step
    include("Constants.jl")
    include("Helpers.jl")
    using DataStructures

    # ilk populasyon olusturulmasi(bireyler)
    function Initialise()
        birey = []
        bireyler = []

        while length(bireyler) < Constant.POPULASYONBOYUTU
            for i = 1:length(Constant.w)
                if Helper.randomSayiGetir() >= Constant.BASLANGICOLASILIGI
                    push!(birey, 1)
                else
                    push!(birey, 0)
                end
            end
            push!(bireyler ,birey)
            birey = []
        end
        return bireyler
    end

    # Ebeveyn statusune yukselecek bireyler
    function parentSelect(bireyler)
        ebeveynler = []
        for xx = 1:Constant.EBEBEYNSAYISI
            ind = Helper.oranHesapla(length(bireyler))
            push!(ebeveynler, bireyler[ind])
        end
        return ebeveynler
    end

    # bireyleri çaprazlayip mutate ettikten sonra oluşan çocukları döndürür
    function recombineAndMutate(parents)
        cocuklr = []

        while length(parents) > 0
            # println("\nApplying Crossover...")

            c1 = []
            c2 = []

            p1 = pop!(parents)
            p2 = pop!(parents)

            oran = Helper.oranHesapla(length(p1))

            # println("Parents: ", p1, ",", p2, " at point ", oran)

            for iterator = 1:oran - 1
                push!(c1, p1[iterator])
                push!(c2, p2[iterator])
            end

            for iterator = oran:length(p1)
                push!(c2, p1[iterator])
                push!(c1, p2[iterator])
            end

            # println("Offsprings: ", c1, ",", c2)

            mutasyonlucocuk1 = MutationForKids(c1)
            mutasyonlucocuk2 = MutationForKids(c2)

            # println("Mutated offsprings: ", mutasyonlucocuk1, ",", mutasyonlucocuk2)

            push!(cocuklr, mutasyonlucocuk1)
            push!(cocuklr, mutasyonlucocuk2)
        end
        return cocuklr
    end

    function MutationForKids(cocuk)
        for iterasyon = 1:length(cocuk)
            if Constant.MUTASYONOLASILIGI > Helper.randomSayiGetir()
                if cocuk[iterasyon] == 0
                    cocuk[iterasyon] = 1
                else
                    cocuk[iterasyon] = 0
                end
            end
        end
        return cocuk
    end

    function survivalSelect(nonCheckPopulation)
        yeniAdaylar = []
        println(length(nonCheckPopulation))


        allPopulation = Helper.populasyonDict(nonCheckPopulation)
        for i=1:2
            println(allPopulation[1])
        end
        println(length(allPopulation))
        println(typeof(allPopulation))

# https://www.google.com.tr/search?q=julia+append+to+tuple&oq=julia+append+to+tuple&aqs=chrome..69i57.13173j0j1&sourceid=chrome&ie=UTF-8


        # allPopulationx = sort!(collect(allPopulation), by=x->x[2])
        # allPopulationx = sort(collect(zip(values(dictionary1),keys(dictionary2))))
        # for i = 1:length(allPopulationx)
        #     print(allPopulationx[i])
        # end
        # println(length(allPopulationx))
        # println(typeof(allPopulationx))


        # for i = 1:Constant.POPULASYONBOYUTU
        #     at = allPopulationx.pop()[0]
        #
        #     yen = []
        #     for x = 1:length(at)
        #         yen.append(at[x])
        #     end
        #     yeniAdaylar.append(yen)
        # end
        return yeniAdaylar
    end
end
