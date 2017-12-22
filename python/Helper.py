# OKANCAN COSAR
# 12253018

import Constant

# Dairesel sekilde random sayilari listeden getirir.
# PARAMS
#   sira:
# RETURN
#   (float)random: random listesinden siradaki deger
def randomSayiGetir():
    if Constant.RANDOMITERASYONU == 10:
        Constant.birle()
        return Constant.RANDOMLAR[Constant.RANDOMITERASYONU]
    Constant.artir()
    return Constant.RANDOMLAR[Constant.RANDOMITERASYONU]


# Gelen birey cantaya sigiyor mu?
# PARAMS
#   (array)gelenBirey: [1,0,0,1,1,0,0,1,1,1]
# RETURN
#   (int)toplam: gelen bireyin cantadaki agirligi(weight)
def bireyAgirlikKontrolu(gelenBirey):
    toplam = 0
    for iterator in range(len(Constant.w)):


        if gelenBirey[iterator] == 1:
            toplam = toplam + Constant.w[iterator]

    if toplam > Constant.CANTABOYUTU:
        return False
    else:
        return True


# Gelen bireyin degeri
# PARAMS
#   gelenBirey: [1,0,0,1,1,0,0,1,1,1]
# RETURN
#   (int)toplam: gelen bireyin degeri(value)
def bireyDegerKontrolu(gelenBireyx):
    toplamx = 0

    if bireyAgirlikKontrolu(gelenBireyx):
        for iterators in range(len(Constant.w)):

            if gelenBireyx[iterators] == 1:
                toplamx = toplamx + Constant.v[iterators]
        return toplamx
    else:
        return 0


# oran hesaplar
# min + (rand()*(max-min))
def oranHesapla(populasyonSayisi):
    return int(1 + (randomSayiGetir() * (populasyonSayisi - 1)))


# Verilen arraydeki bireylerin valuelerini hesaplayip dictionary olarak dondurur.
# PARAMS
#   populasyon(array): Donusturulecek array
# RETURN
#   returnStatement: ["0010100111", 547], ["0010100111", 547].... tipinde dictionary olumus hali.
def populasyonDict(populasyon):
    temmm = list()

    for b in range(len(populasyon)):
        str1 = []
        for i in populasyon[b]:
            str1.append(int(i))
        temmm.append((str1, bireyDegerKontrolu(populasyon[b])))
    return temmm
