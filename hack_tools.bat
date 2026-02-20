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
set /p i=Seciminiz:

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
