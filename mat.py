"""
This module is the Matplotlib server, Python side. It sits around waiting for Python code to come over the port, executes it, and returns
the result to the sender wrapped up in JSON.
"""
import matplotlib.pyplot as plt
import os
import socket
import sys
import traceback

signal = "$<>;;<>%"

def accumulate(client):
    accumulated = ""
    while True:
        got = client.recv(4096).decode("ascii")
        print("Received:", got)
        accumulated += got
        if accumulated.endswith(signal):
            break
    print("Accumulated before strip:", accumulated)
    accumulated = accumulated.rstrip(signal)
    print("Accumulated after strip:", accumulated)
    return accumulated

def try_evaluate(to_evaluate):
    try:
        print("Going to execute:", to_evaluate)
        val = eval(to_evaluate.strip())
        print("Success, got back:", val)
        return val
    except Exception as e:
        print("Exception:", e)
        traceback.print_exc()
        return str(e)

def send_to_caller(result):
    to_send = (result + os.linesep).encode("ascii")
    client.send(to_send)

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = "localhost"#socket.gethostname()
port = int(sys.argv[1])
s.bind((host, port))
s.listen(1)

client, _addr = s.accept()
while True:
    to_evaluate = accumulate(client)
    for stat in to_evaluate.split(os.linesep):
        if stat.strip().rstrip(signal).strip():
            result = try_evaluate(stat)
            send_to_caller(str(result))

