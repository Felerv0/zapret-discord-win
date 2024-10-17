@echo off
chcp 65001 >nul

set WINWS=%~dp0winws\

start "zapret: general" /min "%WINWS%winws.exe" --wf-tcp=80,443 --wf-udp=443,50000-50100 ^
--filter-udp=443 --hostlist="list-main.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%WINWS%quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-50100 --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=6 --dpi-desync-fake-quic="%WINWS%quic_initial_www_google_com.bin" --new ^
--filter-tcp=80 --hostlist="list-main.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-l3=ipv4 --filter-tcp=443 --dpi-desync=syndata