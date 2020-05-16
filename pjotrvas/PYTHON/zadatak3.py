import os, re, sys

datoteke = os.listdir(".")

ocjene = {}
student = []
vjezbe = []

for i in range(len(datoteke)):
    if re.match('Lab*', datoteke[i]):
        vjezba = datoteke[i].split('_')[1:-1]
        vjezba = int(vjezba[0])
        if vjezba not in vjezbe:
            vjezbe.append(vjezba)
        dat = open(datoteke[i], 'r')
        sadrzaj = dat.readlines()
        for zapis in sadrzaj:
            zapisi = zapis.split(',')
            jmbag = zapisi[0].split(' ')[0]
            ocjena = zapisi[0].split(' ')[1]
            ocjena = float(ocjena)
            if (vjezba, jmbag) in ocjene:
                exit("Vec postoji zapis o studentu {} u vjezbi {}!".format(jmbag, vjezba))
            ocjene[(vjezba, jmbag)] = ocjena
    elif re.match('studenti*', datoteke[i]):
        studentiDat = open(datoteke[i], 'r')
        studenti = studentiDat.readlines()
        for i in range(len(studenti)):
            student.append(studenti[i].split(' '))

print("JMBAG\t\tPrezime, Ime\t", end='')
vjezbe.sort()
for vjezba in vjezbe:
    print("L%d\t"%vjezba, end='')
print()

for studentJedan in student:
    print("{}\t{}, {}".format(studentJedan[0], studentJedan[1], studentJedan[2].strip()), end='\t')
    for vjezba in vjezbe:
        kljuc = (vjezba, studentJedan[0])
        if kljuc in ocjene:
            print("%.1f"%ocjene[kljuc], end='\t')
        else:
            print ("0.0", end='\t')
    print()