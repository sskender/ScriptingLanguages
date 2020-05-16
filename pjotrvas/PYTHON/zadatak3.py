import os
import re
import sys

datoteke = os.listdir(".")
ocjene = {}
student = []
vjezbe = []


for i in range(len(datoteke)):
    if re.match('studenti*', datoteke[i]):
        studentiDat = open(datoteke[i], 'r')
        studenti = studentiDat.readlines()
        for i in range(len(studenti)):
            student.append(studenti[i].split(' '))

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
            #if (vjezba, jmbag) in ocjene:
                #exit("Vec postoji zapis o studentu {} u vjezbi {}!".format(jmbag, vjezba))
            ocjene[(vjezba, jmbag)] = (ocjena)


print("JMBAG\t\tPrezime, Ime\t", end='')
for vjezba in vjezbe:
    print("L%d\t"%vjezba, end='')
print()

for student in student:
    print("{}\t{},{}".format(student[0], student[1], student[2].strip()), end='\t')
    for ocjena in sorted(ocjene):
        if ocjena[1] == student[0]:
            print("%.1f"%ocjene[ocjena], end='\t')
    print()
#print(student)
#print(ocjene)
#print(vjezbe)