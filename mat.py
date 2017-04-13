"""
This module is the Matplotlib server, Python side. It sits around waiting for Python code to come over the port, executes it, and returns
the result to the sender wrapped up in JSON.
"""
import matplotlib.pyplot as plt
import os
import socket
import sys

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = "localhost"#socket.gethostname()
port = int(sys.argv[1])
s.bind((host, port))
s.listen(1)

client, _addr = s.accept()
while True:
    to_evaluate = client.recv(4096).decode("ascii")
    try:
        val = eval(to_evaluate)
        # TODO: return val as {:ok, json}
        json = str(val)
        client.send((json + os.linesep).encode("ascii"))
    except Exception as e:
        # TODO: return the exception as {:error, exception_info}
        print("Syntax error or something.")
        pass

