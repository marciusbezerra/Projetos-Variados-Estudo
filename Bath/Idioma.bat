@echo off
echo Verificando se o sistema est� em portugu�s
echo.
vol > tmpvol.tmp
find "volume" tmpvol.tmp /i > nul
if errorlevel 0 goto outro
echo O sistema est� em portugu�s
goto fim
:outro
echo O sistema n�o est� em portugu�s
:fim
del tmpvol.tmp

