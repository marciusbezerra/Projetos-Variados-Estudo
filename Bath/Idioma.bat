@echo off
echo Verificando se o sistema est† em portuguàs
echo.
vol > tmpvol.tmp
find "volume" tmpvol.tmp /i > nul
if errorlevel 0 goto outro
echo O sistema est† em portuguàs
goto fim
:outro
echo O sistema n∆o est† em portuguàs
:fim
del tmpvol.tmp

