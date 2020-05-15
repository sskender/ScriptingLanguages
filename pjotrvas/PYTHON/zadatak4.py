import urllib.request
import sys
import re

webstranica = sys.argv[1]
stranica = urllib.request.urlopen(webstranica)
mybytes = stranica.read()
mystr = mybytes.decode("utf8")
print(mystr)

linkovi=re.findall("href=[\"'][^\"']+[\"']", mystr)
print("\n\nLINKOVI: {}, stranica: {}\n".format(len(linkovi), webstranica))
for i in range(len(linkovi)):
    linkovi[i] = linkovi[i].split("=")[1][1:-1]
    print("\t%s"% linkovi[i])
print()

hostovi={}
for link in linkovi:
    if re.match("https?://[^/]+", link):
        host = link.split("/")[2]
        hostovi[host] = hostovi.get(host, 0) + 1
print("\n\nHOSTOVI: na stranici: {}\n".format(webstranica))
for host in hostovi:
    print("\tHost: {} ima {} referenci".format(host, hostovi[host]))

mailovi=re.findall("[\w]+[._-][\w]+@[\w]+\.[\w]+", mystr)
print("\n\nMAILOVI: {}, stranica: {}\n".format(len(mailovi), webstranica))
for mail in mailovi: print("\t%s"% mail)

slike=re.findall(r'<img.*?src="(.*?)"[^\>]+>', mystr)
print("\n\nSLIKE: {}, stranica: {}".format(len(slike), webstranica))
