import Helper
import Constant

ths = open("out.txt", "a")


# ilk populasyon olusturulmasi
def Initialise():
    birey = []
    bireyler = []

    while len(bireyler) < Constant.POPULASYONBOYUTU:
        for i in range(len(Constant.w)):
            if Helper.randomSayiGetir() >= Constant.BASLANGICOLASILIGI:
                birey.append(1)
            else:
                birey.append(0)
        bireyler.append(birey)
        birey = []
    return bireyler


# Ebeveyn statusune yukselecek bireyler
def parentSelect(bireyler):
    ebeveynler = []
    for xx in range(Constant.EBEBEYNSAYISI):
        ind = Helper.oranHesapla(len(bireyler))
        ebeveynler.append(bireyler[ind])
    return ebeveynler


# sadece cocuklari dondur
def recombineAndMutate(parents):
    tempParents = []

    while len(parents) > 0:
        print("Applying Crossover")

        c1 = []
        c2 = []

        p1 = parents.pop()
        p2 = parents.pop()

        oran = Helper.oranHesapla(len(p1))

        print("Parents:", p1, ",", p2, " at point ", oran)

        for iterator in range(oran):
            c1.append(p1[iterator])
            c2.append(p2[iterator])

        for iterator in range(oran, len(p1)):
            c2.append(p1[iterator])
            c1.append(p2[iterator])

        print("Offsprings:", c1, ",", c2)

        mutasyonlucocuk1 = Mutation(c1)
        mutasyonlucocuk2 = Mutation(c2)

        print("Mutated offsprings:", mutasyonlucocuk1, ",", mutasyonlucocuk2)

        tempParents.append(mutasyonlucocuk1)
        tempParents.append(mutasyonlucocuk2)
    return tempParents


def Mutation(cocuk):
    for iterasyon in range(len(cocuk)):
        if Constant.MUTASYONOLASILIGI > Helper.randomSayiGetir():
            if cocuk[iterasyon] == 0:
                cocuk[iterasyon] = 1
            else:
                cocuk[iterasyon] = 0
    return cocuk


def survivalSelect(nonCheckPopulation):
    yeniAdaylar = []

    allPopulation = Helper.populasyonDict(nonCheckPopulation)

    allPopulationx = sorted(allPopulation, key=lambda tup: tup[1])

    for i in range(Constant.POPULASYONBOYUTU):
        at = allPopulationx.pop()[0]

        yen = []
        for x in range(len(at)):
            yen.append(at[x])

        yeniAdaylar.append(yen)

    return yeniAdaylar
