@echo off

echo Letras verdes ...
echo Pressione F2 para Dir /S ...
echo Opcao do config.sys escolhida: %config%
prompt $e[0;60;"Dir /s /b /p";13p:$e[0;32;40m$p$g

mode con codepage prepare=((850) C:\WINDOWS\COMMAND\ega.cpi)
mode con codepage select=850
keyb br,,C:\WINDOWS\COMMAND\Keybrd2.sys
doskey /INSERT f=format a:
doskey fq=format a: /q
verify on

