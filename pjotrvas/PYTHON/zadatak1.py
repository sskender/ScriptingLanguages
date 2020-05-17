import sys

def ucitajMatricu(retci):
    matrica = {}
    povratna = []
    for i in range(len(retci)):
        if i == 0:
            povratna.append(int(retci[i].split(' ')[0]))
            povratna.append(int(retci[i].split(' ')[1]))
        else:
            redak = retci[i].split(' ')
            key = (int(redak[0]), int(redak[1]))
            value = float(redak[2].strip())
            matrica[key] = value
    povratna.append(matrica)
    return povratna 

def pomnoziMatrice(prvaMatrica, drugaMatrica):
    umnozakMatrica = {}
    for i in range(1, prvaMatrica[0]+1):
        for j in range(1, drugaMatrica[1]+1):
            umnozakMatrica[(i, j)] = 0
            for k in range(1, prvaMatrica[1]+1):
                umnozakMatrica[(i, j)] += float(prvaMatrica[2].get((i, k), 0) * drugaMatrica[2].get((k, j), 0))
            if (umnozakMatrica[(i, j)] == 0):
                del umnozakMatrica[(i, j)]
    return [prvaMatrica[0], drugaMatrica[1], umnozakMatrica]


datotekaCitaj = sys.argv[1]
datotekaPisi = sys.argv[2]

dat = open(datotekaCitaj , 'r')
izlaznaDatoteka = open(datotekaPisi, "w")

podaciMatrica = dat.readlines()

prvaMatrica = []
drugaMatrica = []
umnozak = []

retci = []
index = 1

for i in range(len(podaciMatrica)):
    if podaciMatrica[i] == "\n" and index == 1:
        prvaMatrica = ucitajMatricu(retci)
        index += 1
        retci[:] = []
    elif i == (len(podaciMatrica)-1) and index == 2 :
        retci.append(podaciMatrica[i])
        drugaMatrica = ucitajMatricu(retci)
    elif podaciMatrica[i] != "\n":
        retci.append(podaciMatrica[i])

if prvaMatrica[1] != drugaMatrica[0]:
    exit("Matrice nije moguce pomnoziti")
else:
    umnozak = pomnoziMatrice(prvaMatrica, drugaMatrica)

print("{} {}".format(umnozak[0], umnozak[1]))
izlaznaDatoteka.write("{} {}".format(umnozak[0], umnozak[1]))

for key in umnozak[2]:
    print("{} {} {}".format(key[0], key[1], umnozak[2].get(key)))
    izlaznaDatoteka.write("\n{} {} {}".format(key[0], key[1], umnozak[2].get(key)))

    