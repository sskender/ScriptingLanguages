import sys

def restore_matrix(matrix):
    matrix_map = dict()
    matrix = matrix.split("\n")
    (m, n) = matrix[0].split(" ")
    for row in matrix[1:]:
        (x, y, value) = row.split(" ")
        matrix_map[(int(x), int(y))] = float(value)
    return (int(m), int(n), matrix_map)

def save_matrix(file_out, matrix):
    matrix_out_file = open(file_out, "w")
    w = "{} {}\n".format(matrix[0], matrix[1])
    print(w, end="")
    matrix_out_file.write(w)
    for i in matrix[2]:
        w = "{} {} {}\n".format(i[0], i[1], matrix[2][i])
        print(w, end="")
        matrix_out_file.write(w)
    matrix_out_file.close()

def multiply(m1, m2):
    if (m1[1] != m2[0]):
        print("Can't multiply: [{},{}] [{},{}]".format(m1[0], m1[1], m2[0], m2[1]))
        sys.exit(1)
    m_result = dict()
    for i in range(1, m1[0]+1):
        for j in range(1, m2[1]+1):
            m_result[(i, j)] = 0
            for k in range(1, m1[1]+1):
                m_result[(i, j)] += float(m1[2].get((i, k), 0) * m2[2].get((k, j), 0))
            if (m_result[(i, j)] == 0):
                del m_result[(i, j)]
    return (m1[0], m2[1], m_result)

def main():
    matrix_in_file = open(sys.argv[1], "r")
    matrix_split = matrix_in_file.read().split("\n\n")
    matrix_in_file.close()

    m1 = restore_matrix(matrix_split[0])
    m2 = restore_matrix(matrix_split[1])

    m_result = multiply(m1, m2)
    save_matrix(sys.argv[2], m_result)

if __name__ == "__main__":
    main()
