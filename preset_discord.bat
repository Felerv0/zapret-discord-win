@echo off
chcp 65001 >nul

set WINWS=%~dp0winws\

start "zapret: discord" /min "%WINWS%winws.exe" --wf-l3=ipv4 ^
--wf-tcp=443 --wf-udp=443,50000-65535 --filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-cutoff=d4 --dpi-desync-repeats=6 --dpi-desync-any-protocol --new ^
--filter-udp=443 --hostlist="%~dp0list-discord.txt" --dpi-desync=fake --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xA1B2FFDD --dpi-desync-fake-quic="%WINWS%quic_initial_www_google_com.bin" --new ^
--filter-tcp=443 --hostlist="%~dp0list-discord.txt" --dpi-desync=fake,split2 --dpi-desync-fooling=badseq --dpi-desync-autottl=2 --dpi-desync-fake-tls="%WINWS%tls_clienthello_www_google_com.bin"