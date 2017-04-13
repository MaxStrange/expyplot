"""
This module is the Matplotlib server, Python side. It sits around waiting for Python code to come over the port, executes it, and returns
the result to the sender wrapped up in JSON.
"""
import matplotlib.pyplot as plt
import os
import socket
import sys
import traceback

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = "localhost"#socket.gethostname()
port = int(sys.argv[1])
s.bind((host, port))
s.listen(1)

client, _addr = s.accept()
while True:
    to_evaluate = client.recv(4096).decode("ascii")
    try:
        # TODO: This should buffer the code it is given and only evaluate it
        #       After it gets a special signal to evaluate it.
        #       That will allow for larger code strings - such as when you have
        #       a million numbers that you want to graph.
        statements = to_evaluate.split("\n")
        for stat in statements:
            if stat.strip():
                print("Going to execute", stat.strip())
                val = eval(stat.strip())
                print("Evaluated, and got back:", val)
                # TODO: return val as {:ok, json}
                json = str(val)
                client.send((json + os.linesep).encode("ascii"))
    except Exception as e:
        # TODO: return the exception as {:error, exception_info}
        print("Syntax error or something:", to_evaluate)
        traceback.print_exc()

