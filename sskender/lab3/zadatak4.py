import urllib.request
import re, sys

def main():
    url = sys.argv[1]
    html = urllib.request.urlopen(url).read().decode("utf8")
    print(html)

    links = re.findall("href=[\"'][^\"']+[\"']", html)
    for i in range(len(links)):
        links[i] = links[i].split("=")[1][1:-1]
        print("LINK: %s" % links[i])

    hosts = dict()
    for link in links:
        if re.match("https?://[^/]+", link):
            host = link.split("/")[2]
            hosts[host] =  hosts.get(host, 0) + 1
    for host in hosts: print("HOST: {} => {}".format(host, hosts[host]))

    emails = re.findall("[\w]+[._-][\w]+@[\w]+\.[\w]+", html)
    for email in emails: print("EMAIL: %s" % email)

    images = re.findall("<img .*src=[\"'][^\"']+[\"'][^>]+>", html)
    print("IMAGES: {}".format(len(images)))

if __name__ == "__main__":
    main()
