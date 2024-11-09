call :srvdel winws1
goto :eof

:srvdel
net stop %1
sc delete %1
