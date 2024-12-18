SET WINWSPATH=%~dp0\zapret-winws\

set ARGS=--wf-tcp=80,443 --wf-udp=443,50000-65535 ^
--filter-udp=443 --hostlist-auto="%WINWSPATH%autohostlist.txt" --dpi-desync=fake,disorder2 --dpi-desync-cutoff=d4 --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%WINWSPATH%quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d4 --dpi-desync-fake-quic="%WINWSPATH%quic_initial_www_google_com.bin" --new ^
--filter-tcp=80 --hostlist-auto="%WINWSPATH%autohostlist.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=443 --hostlist-auto="%WINWSPATH%autohostlist.txt" --dpi-desync=fake,disorder2 --dpi-desync-autottl=1 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%WINWSPATH%tls_clienthello_www_google_com.bin"

start "zapret: http,https,quic" /min "%WINWSPATH%winws.exe" %ARGS%
