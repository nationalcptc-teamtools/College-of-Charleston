#!/usr/bin/python3
import socket
ports = []
numports = 0
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.settimeout(1)
host = input("Enter the host: ")
maxport = int(input("Enter the max port to scan: "))
for i in range(1, maxport + 1):
    ports.append(i)
def portScanner():
    for port in ports:
        if s.connect_ex((host, port)):
            print("Port " + str(port) + " is closed")
        else:
            print("Port " + str(port) + " is open")
        s.close()
portScanner()
