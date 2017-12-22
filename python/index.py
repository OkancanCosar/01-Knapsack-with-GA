# OKANCAN COSAR
# 12253018

import Helper
import Constant
import Step
import sys

populasyon = []


def Calculate(populasyonlar):
    # for i in Helper.populasyonDict(populasyonlar):
        # # guzel yazdirma
        # ff = ""
        # for ix in i[0]:
        #     ff = ff + str(ix)
        # print("(", ff, "),", i[1])
        # # guzel yazdirma sonu


    # Ebeveynleri sec (PARENT SELECT)
    parents = Step.parentSelect(populasyonlar)

    # Ebeveynleri caprazla (RECOMBINE) ve yavrulari mutasyona tabi tut (MUTATE)
    # (Offsprings(Cocuklar))
    cocuklar = Step.recombineAndMutate(parents)

    # Degerlerini hesaplayip dictionary yapar.
    # sort'laryip ilk 50 yi dondurur
    populasyonlarx = Step.survivalSelect(cocuklar + populasyonlar)

    return populasyonlarx


def main():
    global populasyon

    # Bitis kosulu saglanana kadar TEKRARLA(REPEAT)
    for iterasyon in range(Constant.ITERASYONSAYISI):
        # print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Generation: " + str(iterasyon) + " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")

        if iterasyon == 0:
            # Baslangic populasyonunu rastgele olustur (INITIALISE)
            populasyon = Step.Initialise()
            populasyon = Calculate(populasyon)
        # elif iterasyon == Constant.ITERASYONSAYISI-1:
            # print("\n\nFinal Population:")

            # # guzel yazdirma
            # ff = ""
            # for ix in Helper.populasyonDict(populasyon):
            #     ff = ff + str(ix) + "\n"
            # print(ff)
            # # guzel yazdirma sonu

        else:
            populasyon = Calculate(populasyon)

from datetime import datetime
if __name__ == '__main__':
    # f = open("out.txt", "w")
    # sys.stdout = f
    a = datetime.now().microsecond * 0.001
    main()
    b = datetime.now().microsecond * 0.001
    print(b - a)
