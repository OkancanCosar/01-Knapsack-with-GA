# OKANCAN COSAR
# 12253018

dataList = []
rastgeleListe = []

data = open("../test1.txt", "r")
# data = open("../test2.txt", "r")
# data = open("../test3.txt", "r")
# data = open("../test4.txt", "r")


for dt in data.read().split('\n'):
    dataList.append(dt.split(','))

POPULASYONBOYUTU = int(dataList[1][0])
EBEBEYNSAYISI = int(dataList[2][0])
MUTASYONOLASILIGI = float(dataList[3][0])
BASLANGICOLASILIGI = 0.5
ITERASYONSAYISI = int(dataList[4][0]) + 1
CANTABOYUTU = int(dataList[5][0])
w = list(map(int, dataList[6]))
v = list(map(int, dataList[7]))
RANDOMLAR = list(map(float, dataList[0]))
RANDOMITERASYONU = -1


def artir():
    global RANDOMITERASYONU

    RANDOMITERASYONU = RANDOMITERASYONU + 1
    return RANDOMITERASYONU


def birle():
    global RANDOMITERASYONU

    RANDOMITERASYONU = 0
    return RANDOMITERASYONU
