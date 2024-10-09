@echo off
chcp 65001 >nul

set WINWS=%~dp0winws\

start "zapret: discord and websites" /min "%WINWS%winws.exe" ^
--wf-l3=ipv4 --wf-tcp=443 --wf-udp=1-65535 --filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-cutoff=d4 --dpi-desync-repeats=6 --dpi-desync-any-protocol --new ^
--dpi-desync=fake,split2 --dpi-desync-fooling=badseq --dpi-desync-fake-tls="%WINWS%tls_clienthello_www_google_com.bin"