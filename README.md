# [ [English](#english) | [Türkçe](#türkçe) ]

---

<a name="english"></a>

🛠️ 00exe Hack Tools (v4.0 Platinum Edition)
A professional-grade CLI suite combining Windows system administration, network exploitation, and remote deployment tools. Version 4.0 introduces advanced C2 (Command & Control) bot integration and administrative security bypasses.

🚀 New Features (v4.0)
🤖 Virtual Botnet: Remote deployment of custom payloads (like c2bot.exe) using PsExec with stealth (-d) mode.

🔓 Admin Share & UAC Bypass: One-click activation of ADMIN$ shares and LocalAccountTokenFilterPolicy for seamless remote access.

🛡️ Enhanced Firewall Control: Full control over all network profiles (Public/Private/Domain).

⚡ RDP Kill & Remote Fix: Terminate active RDP sessions or remotely enable RDP via Registry (Option 16 & 20).

🔍 Advanced Port Scanner: Multi-threaded PowerShell scanning with automated logging to port_scan_log.txt.

🛠️ Requirements
Administrator Privileges: REQUIRED. The script checks for admin rights at startup.

PsExec (Sysinternals): Essential for remote deployment. Add it to your PATH or provide the path within the script.

Python (Optional): Required only if you are compiling your own c2bot.exe with PyArmor.

📖 How to Use
Right-click hack_tools.bat and "Run as Administrator".

Setup Access (22): Use the "Admin Share" option on the target (if accessible) to prepare it for remote commands.

Deploy (21): Use the "Virtual Botnet" option to push your compiled bot to the target network.

<a name="türkçe"></a>

🛠️ 00exe Hack Tools (v4.0 Platinum Sürümü)
Windows sistem yönetimi, ağ sızma testleri ve uzak dağıtım araçlarını birleştiren profesyonel bir CLI paketi. v4.0 sürümü, gelişmiş C2 bot entegrasyonu ve yönetici güvenlik atlatmalarını (bypass) içerir.

🚀 Yeni Özellikler (v4.0)
🤖 Sanal Botnet: Özel dosyalarınızı (c2bot.exe vb.) PsExec kullanarak hedef makinelere gizli modda (-d) otomatik yükleme ve çalıştırma.

🔓 Admin Paylaşımı ve UAC Atlatma: Uzaktan erişim kısıtlamalarını kaldırmak için ADMIN$ paylaşımlarını ve LocalAccountTokenFilterPolicy kaydını tek tıkla aktif etme.

🛡️ Gelişmiş Firewall Yönetimi: Tüm ağ profillerini (Ortak/Özel/Etki Alanı) tam denetleme.

⚡ RDP Kill ve Uzak Onarım: Aktif RDP oturumlarını sonlandırma veya Registry üzerinden uzaktan RDP protokolünü aktif etme.

🔍 PowerShell Port Tarayıcı: port_scan_log.txt dosyasına otomatik kayıt yapan, PowerShell tabanlı hızlı tarama.

🛠️ Gereksinimler
Yönetici İzni: ZORUNLUDUR. Script açılışta admin yetkisi kontrolü yapar.

PsExec (Sysinternals): Uzak dağıtım için gereklidir. PATH'e eklenmeli veya script içinden yolu gösterilmelidir.

Python (İsteğe Bağlı): Sadece kendi c2bot.exe dosyanızı PyArmor ile derlemek isterseniz gereklidir.

📖 Kullanım
hack_tools.bat dosyasına sağ tıklayıp "Yönetici Olarak Çalıştır" deyin.

Erişim Hazırlığı (22): Hedef makinede uzaktan komut çalıştırmayı engelleyen kısıtlamaları "Admin Share" seçeneği ile kaldırın.

Dağıtım (21): Derlediğiniz botu ağdaki hedef cihazlara göndermek için "Virtual Botnet" seçeneğini kullanın.

⚠️ Disclaimer / Uyarı
This tool is strictly for educational purposes and authorized penetration testing. / Bu araç yalnızca eğitim amaçlıdır ve sadece izinli olduğunuz ağlarda sızma testi için kullanılmalıdır.
