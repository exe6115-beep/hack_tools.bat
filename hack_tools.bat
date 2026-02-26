@echo off
chcp 65001 >nul
color a
:MENU
cls
echo By 00exe
title TOOLS
echo.
echo.
echo					████████  ██████   ██████  ██      ███████ 
echo					   ██    ██    ██ ██    ██ ██      ██      
echo					   ██    ██    ██ ██    ██ ██      ███████ 
echo					   ██    ██    ██ ██    ██ ██           ██ 
echo					   ██     ██████   ██████  ███████ ███████                                                                         						                           
echo.
echo.


echo 1 - NETWORK FINDER(ADMIN)
echo 2 - YOUR NETWORK(ADMIN)
echo 3 - YOUR ADRESS IP
echo 4 - NETWORK INFORMATION USED(NO ADMIN)
echo 5 - FILE DELETER
echo 6 - FILE COPY
echo 7 - NETWORK FINDER(NO ADMIN)
echo 8 - REMOTE DESKTOP(WARNING!!!!)
echo 9 - REMOTE DESTKOP HELP
echo 10 - CMDKEY HELP
echo 11 - LAN DEBUG
echo 12 - YOUR IP
echo 13 - IP NAME FINDER
echo 14 - CMD REMOTE
echo 15 - CMD REMOTE PRO
echo 16 - ADMIN FIREWALL
echo 17 - ADRESS SCAN
set /p i=Your choose:

if "%i%"=="1" goto FIND
if "%i%"=="2" goto YFIND
if "%i%"=="3" goto ipconfig
if "%i%"=="4" goto faces
if "%i%"=="5" goto del
if "%i%"=="6" goto copy
if "%i%"=="7" goto aFIND
if "%i%"=="8" goto mstsc
if "%i%"=="9" goto mstsc?
if "%i%"=="10" goto cmdkey?
if "%i%"=="11" goto LAN
if "%i%"=="12" goto IP
if "%i%"=="13" goto ipn
if "%i%"=="14" goto cmdr
if "%i%"=="15" goto cmdrp
if "%i%"=="16" goto fad
if "%i%"=="17" goto arp
goto MENU

:FIND
echo adress:
set /p address=
netsh wlan show interface | find "%address%"
pause
goto MENU

:YFIND
echo ssid:
echo.
netsh wlan show interface
pause
goto MENU

:ipconfig
echo ur ip here:
echo.
ipconfig
pause
goto MENU

:faces
echo adress:
echo.
netsh wlan show interfaces
pause
goto MENU

:del
echo Enter the name and extension of the file to be deleted, for example, x.txt.
set /p file=
echo.
for /f "delims=" %%i in ('dir /b /s "%file%"') do (
    echo %%i
del %%i
)
pause
goto MENU

:copy Enter the name and extension of the file to be copyed, for example, x.txt.
echo 
set /p file=
echo copy adress
set /p targ=
echo.
for /f "delims=" %%i in ('dir /b /s "%file%"') do (
    echo %%i
    copy "%%i" "%targ%"
)
pause
goto MENU

:aFIND
echo adress:
set /p address=
netsh wlan show interfaces | find "%address%"
pause
goto MENU

:mstsc
echo pc name here
set /p pc=
mstsc /v:"%pc%"
pause
goto MENU

:mstsc?
mstsc /?
pause
goto MENU


:cmdkey?
cmdkey
start cmd
pause
goto MENU

:LAN
netstat -n
pause
goto MENU

:IP
curl ip.sb
pause
goto MENU

:ipn
set /p ip=write here ip adress: 
ping -a -n 1 %ip% | find "Pinging"
pause
goto MENU

:cmdr
cls
echo === CMD REMOTE (PsExec) ===
echo.
echo if you using this you need to go website(https://learn.microsoft.com/tr-tr/sysinternals/downloads/psexec)and download the PStools
echo IP Adress here(e.g. 192.168.1.50):
set /p target_ip=
echo Host Name (e.g. Administrator):
set /p pc_user=
echo password (If it has not password press enter only):
set /p pc_pass=
echo.
echo Access trying
psexec \\%target_ip% -u %pc_user% -p "%pc_pass%" cmd
pause
goto MENU

:fad
cls
echo === FIREWALL ===
echo.
echo If you accept this others host has no firewall!
echo Are you sure? [Y/N]
set /p onay=
if /i "%onay%"=="N" goto MENU
if /i "%onay%"=="Y" (
    netsh advfirewall set allprofiles state off
    echo.
    echo [!] Firewall access accepted
) else (
    echo acess denied
)
pause
goto MENU

:arp
arp -a
pause
goto MENU

:scanner
cls
echo === PORT & NETWORK SCANNER ===
echo.
set /p net_prefix=Enter IP Network (e.g., 192.168.1): 
set /p target_port=Enter Port to Scan (e.g., 3389): 
echo Scanning network... This may take a while.
echo.

powershell -Command "1..254 | ForEach-Object { $ip = '%net_prefix%.' + $_; if (Test-NetConnection -ComputerName $ip -Port %target_port% -WarningAction SilentlyContinue -InformationLevel Quiet) { Write-Host '[+] Found: ' $ip -ForegroundColor Green } }"

echo.
echo Scan completed.
pause
goto MENU
