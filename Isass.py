import socketserver
import socks
import threading

# CONFIG
TOR_PROXY = ("127.0.0.1", 9050)  # Tor
TARGET_ONION = "your-tor-server.onion"  
TARGET_PORT = 80  # onion port

class RequestHandler(socketserver.BaseRequestHandler):
    def handle(self):
        data = self.request.recv(8192)

        # Tor connection via SOCKS5
        s = socks.socksocket()
        s.set_proxy(socks.SOCKS5, TOR_PROXY[0], TOR_PROXY[1])
        s.connect((TARGET_ONION, TARGET_PORT))
        s.sendall(data)

        while True:
            reply = s.recv(8192)
            if not reply:
                break
            self.request.sendall(reply)

        s.close()

def start_proxy():
    with socketserver.ThreadingTCPServer(("127.0.0.1", 5633), RequestHandler) as server:
        print("[+] Mirror http://127.0.0.1:5633")
        server.serve_forever()

if __name__ == "__main__":
    threading.Thread(target=start_proxy).start()
