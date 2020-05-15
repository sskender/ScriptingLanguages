import sys
datoteka = sys.argv[1]

dat = open(datoteka , 'r')

sadrzaj = dat.readlines()

for i in range(len(sadrzaj)):
    sadrzaj[i] = sadrzaj[i].split(' ')
    for j in range(len(sadrzaj[i])):
        sadrzaj[i][j] = sadrzaj[i][j].replace('\n', '')
        sadrzaj[i][j] = float(sadrzaj[i][j])
    sadrzaj[i].sort()

print("Hyp", end='')
for i in range(10, 100, 10): print ("#Q{}".format(i),end='')
print()

for i in range(len(sadrzaj)):
    pomocni = []
    for j in range(1, 10):
        index = len(sadrzaj[i])*(j/10)
        index = int(index)
        pomocni.append(sadrzaj[i][index-1])
    print("%03d"%(i+1),end='')
    for j in range(len(pomocni)):
        print("#{}".format(pomocni[j]),end='')
    print()