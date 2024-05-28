from http.server import HTTPServer, BaseHTTPRequestHandler
import threading
import time

class Serv(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            self.path = "/index.html"
            self.send_response(200)
            self.send_header('Content-type', 'text/html; charset=utf-8')
        if self.path == '/ads.json':
            with open('ads.json', 'rb') as file:
                self.send_response(200)
                self.send_header('Content-type', 'application/json')
        try:
            file_to_open = open(self.path[1:]).read()
        except:
            file_to_open = "File not found"
            self.send_response(404)
        self.end_headers()
        self.wfile.write(bytes(file_to_open, "utf-8"))

def restart_server():
    global httpd
    print("Rebooting the server...")
    httpd.shutdown()
    httpd.server_close()
    httpd = HTTPServer(("", 80), Serv)
    threading.Thread(target=httpd.serve_forever).start()
    threading.Timer(12 * 3600, restart_server).start()

httpd = HTTPServer(("", 80), Serv)
threading.Thread(target=httpd.serve_forever).start()

threading.Timer(12 * 3600, restart_server).start()

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    httpd.shutdown()
    httpd.server_close()
