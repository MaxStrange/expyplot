"""
This module is the Matplotlib server, Python side. It sits around waiting for Python code to come over the port, executes it, and returns
the result to the sender wrapped up in JSON.
"""
import numpy as np
import os
import socket
import sys
import traceback

import matplotlib
if "SSH_CONNECTION" in os.environ:
    matplotlib.use("agg")
    import matplotlib.pyplot as plt
else:
    import matplotlib.pyplot as plt
    try:
        plt.switch_backend("Qt5Agg")
    except Exception:
        print("This library works best with Qt5Agg as the back end. Please consider installing PyQt5.", file=sys.stderr)

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

def stringify(result):
    if isinstance(result, np.ndarray):
        return np.array_str(result) + signal
    else:
        return str(result) + signal

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = "localhost"
port = int(sys.argv[1])
s.bind((host, port))
s.listen(1)

client, _addr = s.accept()
while True:
    to_evaluate = accumulate(client)
    for stat in to_evaluate.split(os.linesep):
        if stat.strip().rstrip(signal).strip():
            result = try_evaluate(stat)
            result = stringify(result)
            print("Sending back:", result)
            send_to_caller(result)

