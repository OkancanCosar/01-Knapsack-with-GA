dataList = []
rastgeleListe = []
data = open("test.txt", "r")
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






# POPULASYONBOYUTU = 50
# EBEBEYNSAYISI = 30
# MUTASYONOLASILIGI = 0.15
# BASLANGICOLASILIGI = 0.5
# ITERASYONSAYISI = 20
# CANTABOYUTU = 165
# w = [23, 31, 29, 44, 53, 38, 63, 85, 89, 82]
# v = [92, 57, 49, 68, 60, 43, 67, 84, 87, 72]  # size:10
# RANDOMLAR = [0.5, 0.9, 0.1, 0.2, 0.7, 0.6, 0.4, 0.3, 0.6, 0.8, 0.1]  # size:11
# RANDOMITERASYONU = -1


def artir():
    global RANDOMITERASYONU

    RANDOMITERASYONU = RANDOMITERASYONU + 1
    return RANDOMITERASYONU


def birle():
    global RANDOMITERASYONU

    RANDOMITERASYONU = 0
    return RANDOMITERASYONU
