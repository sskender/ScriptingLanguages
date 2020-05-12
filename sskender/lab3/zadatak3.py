import os, re, sys

students_map = dict()       # jmbag => (surname, name)
lab_jmbag_score = dict()    # lab => {jmbag => total}

def print_scores():
    print("JMBAG\t\tPrezime, Ime\t\t{}".format(" ".join(["L" + str(int(i)) + " " for i in lab_jmbag_score])))
    for jmbag in students_map:
        print("{}\t{}, {}\t\t{}".format(jmbag, students_map[jmbag][0], students_map[jmbag][1], " ".join([str(lab_jmbag_score[lab][jmbag]) if jmbag in lab_jmbag_score[lab] else "0.0" for lab in lab_jmbag_score])))

def process_lab_group(lab, lab_group_data):
    for row in lab_group_data:
        (jmbag, score) = row.strip().split(" ")
        if lab not in lab_jmbag_score:
            lab_jmbag_score[lab] = {jmbag : score}
        elif jmbag not in lab_jmbag_score[lab]:
            lab_jmbag_score[lab][jmbag] = score
        else:
            print("Duplicate error: %s" % jmbag)
            print_scores()
            sys.exit(1)

def main():
    # load students
    students_file = open("studenti.txt", "r")
    students_rows = students_file.readlines()
    students_file.close()

    for s in students_rows:
        (jmbag, last_name, first_name) = s.strip().split(" ")
        students_map[jmbag] = (last_name, first_name)

    # process labs
    for lab_group in os.listdir("."):
        if re.match("Lab_[0-9]+_g[0-9]+.txt", lab_group):
            lab_group_file = open(lab_group, "r")
            process_lab_group(lab_group.split("_")[1], lab_group_file.readlines())
            lab_group_file.close()

    # print results
    print_scores()

if __name__ == "__main__":
    main()