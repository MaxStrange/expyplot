"""
This module is the Matplotlib server, Python side. It sits around waiting for Python code to come over the port, executes it, and returns
the result to the sender wrapped up in JSON.
"""
import matplotlib.pyplot as plt
import os
import socket
import sys

#####################################EXAMPLE##########################################
#s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#host = socket.gethostname()
#port = 9998
#s.connect((host, port))
#print("Connected to:", host, port)
#s.send(("plt.hist([10, 20, 30])" + os.linesep).encode("ascii"))
#print("Sent message.")
#val = s.recv(1024).decode("ascii")
#s.close()
#print(val)
#
#noret = eval(val)
#plt.show()
#####################################END EXAMPLE#####################################

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = socket.gethostname()
port = sys.argv[1]
s.connect((host, port))

while True:
    to_evaluate = s.recv(4096).decode("ascii")
    try:
        val = eval(to_evaluate)
        # TODO: return val as {:ok, json}
        json = str(val)
        s.send((json + os.linesep).encode("ascii"))
    except Exception as e:
        # TODO: return the exception as {:error, exception_info}
        pass

