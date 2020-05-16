import sys

def hausdorff(data):
    result = []
    for i in range(1, 10):
        Q = round((i / 10) * len(data))
        result.append(data[Q-1]) # eg 40th element is 39th in list ???
    return result

def main():
    h_file = open(sys.argv[1], "r")
    hypothesis = h_file.readlines()
    h_file.close()

    print("Hyp#{}".format("#".join(["Q"+str(i*10) for i in range(1, 10)])))
    for i in range(len(hypothesis)):
        h = hypothesis[i]
        result = hausdorff(sorted([float(i) for i in h.strip().split(" ")]))
        print("{}#{}".format(str(i+1).rjust(3,"0"), "#".join([str(r) for r in result])))

if __name__ == "__main__":
    main()
