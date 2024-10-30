@echo off
chcp 65001 >nul
:: 65001 - UTF-8
echo Kizil bypass от Кизила Ананасовича.
echo Перед включением удостоверьтесь что на машине выключены другие фиксаторы и подменьщики портов
echo VPN/WARP/GOODBYE DPI/WIRESHARK с записью - всё это ломает Kizil bypass
echo после этого нажмите любую кнопку.
pause


cd /d "%~dp0"

set BIN=%~dp0bin\

start "KIZIL BYPASS" /min "%BIN%winws.exe" --wf-tcp=80,443 --wf-udp=443,50000-65535 ^
--filter-udp=443 --hostlist="list-general.txt" --dpi-desync=fake,disorder2 --dpi-desync-cutoff=d4 --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-tcp=80 --hostlist="list-general.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=443 --hostlist="list-general.txt" --dpi-desync=fake,disorder2 --dpi-desync-autottl=1 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin"
set BIN=%~dp0bin\
set ARGS=--wf-tcp=443 --wf-udp=443,50000-65535 ^