module Step
    include("Constants.jl")
    include("Helpers.jl")

    # ilk populasyon olusturulmasi
    function Initialise()
        birey = []
        bireyler = []

        while length(bireyler) < Constant.POPULASYONBOYUTU
            for i = length(Constant.w)
                if Helper.randomSayiGetir() >= Constant.BASLANGICOLASILIGI
                    birey.append(1)
                else
                    birey.append(0)
                end
            end
            bireyler.append(birey)
            birey = []
        end
        return bireyler
    end

    # Ebeveyn statusune yukselecek bireyler
    function parentSelect(bireyler)
        ebeveynler = []
        for xx = 1:Constant.EBEBEYNSAYISI
            ind = Helper.oranHesapla(length(bireyler))
            ebeveynler.append(bireyler[ind])
        end
        return ebeveynler
    end

    # sadece cocuklari dondur
    function recombineAndMutate(parents)
        tempParents = []

        while len(parents) > 0
            print("\nApplying Crossover")

            c1 = []
            c2 = []

            p1 = parents.pop()
            p2 = parents.pop()

            oran = Helper.oranHesapla(len(p1))

            # guzel yazdirma
            ff111 = ""
            for ix in p1
                ff111 = ff111 + str(ix)
            end
            ff222 = ""
            for ix in p2
                ff222 = ff222 + str(ix)
            end
            # guzel yazdirma sonu

            print("Parents:", ff111, ",", ff222, " at point ", oran)

            for iterator = 1:oran
                c1.append(p1[iterator])
                c2.append(p2[iterator])
            end

            for iterator = oran: length(p1)
                c2.append(p1[iterator])
                c1.append(p2[iterator])
            end

            # guzel yazdirma
            ff11 = ""
            for ix in c1
                ff11 = ff11 + str(ix)
            end
            ff22 = ""
            for ix in c2
                ff22 = ff22 + str(ix)
            end
            # guzel yazdirma sonu

            print("Offsprings:", ff11, ",", ff22)

            mutasyonlucocuk1 = Mutation(c1)
            mutasyonlucocuk2 = Mutation(c2)

            # guzel yazdirma
            ff1 = ""
            for ix in mutasyonlucocuk1
                ff1 = ff1 + str(ix)
            end
            ff2 = ""
            for ix in mutasyonlucocuk2
                ff2 = ff2 + str(ix)
            end
            # guzel yazdirma sonu

            print("Mutated offsprings:", ff1, ",", ff2)

            tempParents.append(mutasyonlucocuk1)
            tempParents.append(mutasyonlucocuk2)
        return tempParents
    end

    function Mutation(cocuk)
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

        allPopulation = Helper.populasyonDict(nonCheckPopulation)

        allPopulationx = sorted(allPopulation, key=lambda, tup: tup[1])

        for i = 1:Constant.POPULASYONBOYUTU
            at = allPopulationx.pop()[0]

            yen = []
            for x = 1:length(at)
                yen.append(at[x])
            end
            yeniAdaylar.append(yen)
        end
        return yeniAdaylar
        end
    end
end
