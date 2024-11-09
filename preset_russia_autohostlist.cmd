SET WINWSPATH=%~dp0\zapret-winws\

set ARGS=--wf-tcp=80,443 --wf-udp=443,50000-50099 ^
--filter-udp=50000-50099 --ipset="%WINWSPATH%ipset-discord.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-any-protocol --dpi-desync-cutoff=n2 --new ^
--filter-udp=50000-50099 --new ^
--filter-udp=443 --hostlist="%WINWSPATH%list-youtube.txt" --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic="%WINWSPATH%quic_initial_www_google_com.bin" --new ^
--filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=11 --new ^
--filter-tcp=80 --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --hostlist-auto="%WINWSPATH%autohostlist.txt" --new ^
--filter-tcp=443 --hostlist="%WINWSPATH%list-youtube.txt" --dpi-desync=fake,split2 --dpi-desync-repeats=11 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%WINWSPATH%tls_clienthello_www_google_com.bin" --new ^
--dpi-desync=fake,disorder2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --hostlist-auto="%WINWSPATH%autohostlist.txt"

start "zapret: http,https,quic" /min "%WINWSPATH%winws.exe" %ARGS%
