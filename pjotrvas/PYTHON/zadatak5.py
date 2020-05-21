import sys, re

JEDAN = 1

if len(sys.argv) > JEDAN:
    html_files = sys.argv[1:]
else:
    exit("POGRESKA: Nedovoljan broj argumenata.")

data_hash = {}

for html_file in html_files:
    html_open = open(html_file, "r")
    html_data = html_open.readlines()
    html_open.close()

    for data in html_data:
        data_tag = re.findall("<[\w]+", data)
        if len(data_tag) > 0:
            for tag in data_tag:
                tag = tag.replace("<", "")
                tag = tag.lower()
                if tag in data_hash:
                    data_hash[tag] = data_hash[tag] + 1
                else:
                    data_hash[tag] = 1

print("Statistika tagova:\nTag             Broj ponavljanja\n================================")

for data in data_hash:
    print("{:<9s} {:>22d}".format(data, data_hash[data]))

