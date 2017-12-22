# OKANCAN COSAR
# 12253018

dataList = []
rastgeleListe = []

# data = open("../test1.txt", "r") # =>       18.863 + 18.183 + 17.413 + 17.032 + 188.442
# data = open("../test2.txt", "r") # =>       18.189 + 17.961 + 17.044 + 16.771 + 17.927
# data = open("../test3.txt", "r") # =>       7.855 + 8.102 + 7.44 + 7.327 + 8.138
data = open("../test4.txt", "r") # =>       0.619 + 0.598 + 0.582 + 0.824 + 0.623


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
