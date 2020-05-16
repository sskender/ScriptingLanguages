import os
import re
import sys

datoteke = os.listdir(".")
ocjene = {}
student = []

for i in range(len(datoteke)):
    if re.match('Lab*', datoteke[i]):
        vjezba = datoteke[i].split('_')[1:-1]
        vjezba = float(vjezba[0])
        dat = open(datoteke[i], 'r')
        sadrzaj = dat.readlines()
        for zapis in sadrzaj:
            zapisi = zapis.split(',')
            jmbag = zapisi[0].split(' ')[0]
            ocjena = zapisi[0].split(' ')[1]
            ocjena = float(ocjena)
            ocjene[jmbag] = (ocjena, vjezba)            
    elif re.match('studenti*', datoteke[i]):
        studentiDat = open(datoteke[i], 'r')
        studenti = studentiDat.readlines()
        for i in range(len(studenti)):
            student.append(studenti[i].split(' '))
