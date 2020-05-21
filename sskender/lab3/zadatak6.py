import sys

try:
    log_file = sys.argv[1]
except Exception as e:
    exit("Krivi broj argumenata!")

log_file_open = open(log_file, "r")
log_data = log_file_open.readlines()
log_file_open.close()

user_bytes = dict()

for line in log_data:
    line_data = line.split(" ")
    ip_address = line_data[0]
    ip_bytes = line_data[-1].strip()
    if "-" in ip_bytes:
        ip_bytes = 0
    else:
        ip_bytes = int(ip_bytes)

    user_bytes[ip_address] = user_bytes.get(ip_address, 0) + ip_bytes


sorted_user_bytes = {k:v for k, v in sorted(user_bytes.items(), key=lambda t: t[1], reverse=True)}

for ip in sorted_user_bytes:
    print("%s : %s" % (ip, sorted_user_bytes[ip]))
