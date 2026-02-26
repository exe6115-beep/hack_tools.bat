@echo off
chcp 65001 >nul
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] ERROR: Administrative privileges required.
    echo [!] Please right-click and 'Run as Administrator'.
    pause
    exit
)

color a
title hack_tools By 00exe
cls
echo [ LOADING SYSTEM MODULES... ]
powershell -Command "0..15 | ForEach-Object { Write-Host '#' -NoNewline -ForegroundColor Green; Start-Sleep -Milliseconds 40 }"
echo.
echo [ ACCESS GRANTED ]
timeout /t 1 >nul
:MENU
cls
mode con: cols=100 lines=30
echo By 00exe
echo.
echo.
echo          ████████  ██████   ██████  ██      ███████ 
echo             ██     ██    ██ ██    ██ ██      ██      
echo             ██     ██    ██ ██    ██ ██      ███████ 
echo             ██     ██    ██ ██    ██ ██           ██ 
echo             ██      ██████   ██████  ███████ ███████ 
echo.
echo ==========================================================================================
echo  1 - NETWORK FINDER (ADMIN)           10 - CMDKEY HELP
echo  2 - YOUR NETWORK (ADMIN)             11 - LAN DEBUG
echo  3 - SHOW LOCAL IP                    12 - SHOW PUBLIC IP
echo  4 - NETWORK INTERFACE INFO           13 - HOSTNAME BY IP (Reverse DNS)
echo  5 - FILE DELETER                     14 - REMOTE CMD (PsExec)
echo  6 - FILE COPY                        15 - CMD REMOTE PRO
echo  7 - NETWORK FINDER (USER)            16 - FIREWALL CONTROLLER (ADMIN)
echo  8 - REMOTE DESKTOP (MSTSC)           17 - ARP ADDRESS SCAN
echo  9 - REMOTE DESKTOP HELP              18 - PORT SCANNER (PowerShell)
echo  19 - LOG CLEAR
echo ==========================================================================================
echo.
set /p i=Select an option:

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
if "%i%"=="18" goto scan
if "%i%"=="19" goto log
goto MENU

:FIND
echo Target SSID/Address:
set /p address=
netsh wlan show interface | find "%address%"
pause
goto MENU

:YFIND
echo Listing local wireless interfaces...
echo.
netsh wlan show interface
pause
goto MENU

:ipconfig
echo Displaying IP configuration...
echo.
ipconfig
pause
goto MENU

:faces
echo Displaying all network interfaces...
echo.
netsh wlan show interfaces
pause
goto MENU

:del
echo Enter file name and extension to delete (e.g., secret.txt):
set /p file=
echo.
for /f "delims=" %%i in ('dir /b /s "%file%"') do (
    echo Deleting: %%i
    del "%%i"
)
pause
goto MENU

:copy
echo Enter file name and extension to copy:
set /p file=
echo Enter destination path:
set /p targ=
echo.
for /f "delims=" %%i in ('dir /b /s "%file%"') do (
    echo Copying: %%i
    copy "%%i" "%targ%"
)
pause
goto MENU

:aFIND
echo Enter target address:
set /p address=
netsh wlan show interfaces | find "%address%"
pause
goto MENU

:mstsc
echo Enter remote PC Name or IP:
set /p pc=
mstsc /v:"%pc%"
pause
goto MENU

:mstsc?
mstsc /?
pause
goto MENU

:cmdkey?
echo Running cmdkey...
cmdkey /list
pause
goto MENU

:LAN
echo Checking active connections...
netstat -n
pause
goto MENU

:IP
echo Fetching Public IP...
curl ip.sb
echo.
pause
goto MENU

:ipn
set /p ip=Enter IP address to resolve: 
ping -a -n 1 %ip% | find "Pinging"
pause
goto MENU

:cmdr
cls
echo === REMOTE CMD (PsExec Required) ===
echo.
echo Download PsTools if not installed.
echo Target IP:
set /p target_ip=
echo Username (e.g., Administrator):
set /p pc_user=
echo Password (Leave blank if none):
set /p pc_pass=
echo.
echo Attempting connection...
psexec \\%target_ip% -u %pc_user% -p "%pc_pass%" cmd
pause
goto MENU

:fad
cls
echo === FIREWALL CONTROLLER ===
echo.
echo WARNING: Disabling firewall makes the system vulnerable!
echo Confirm action? [Y/N]
set /p onay=
if /i "%onay%"=="N" (
    netsh advfirewall set allprofiles state on
    echo Firewall is now ENABLED.
)
if /i "%onay%"=="Y" (
    netsh advfirewall set allprofiles state off
    echo [!] Firewall is now DISABLED.
)
pause
goto MENU

:arp
echo Scanning ARP table...
arp -a
pause
goto MENU

:scan
cls
echo === NETWORK PORT SCANNER ===
echo.
set /p net_prefix=Enter IP Network (e.g., 192.168.1): 
set /p target_port=Enter Port to Scan (e.g., 3389): 
echo.
echo Scanning... Results will be saved to port_scan_log.txt
echo.
powershell -Command "Get-Date | Out-File -FilePath .\scan_results.txt -Append"
powershell -Command "1..254 | ForEach-Object { $ip = '%net_prefix%.' + $_; if (Test-NetConnection -ComputerName $ip -Port %target_port% -WarningAction SilentlyContinue -InformationLevel Quiet) { $found = '[+] Found: ' + $ip; Write-Host $found -ForegroundColor Green; $found | Out-File -FilePath .\port_scan_log.txt -Append } }"
echo.
echo Scan complete. Check port_scan_log.txt for logs.
pause
goto MENU

:log
if exist port_scan_log.txt (
    del port_scan_log.txt
    echo [!] Logs have been wiped.
) else (
    echo [?] No logs found to delete.
)
pause
goto MENU
