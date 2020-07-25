@echo off
:Comeco
cls
echo *****************************************************
echo *                                                   *
echo * T R A B A L H A N D O    C O M    A N S I . S Y S *
echo *                                                   *
echo *****************************************************
echo Por Marcius C. Bezerra
echo.
echo Este programa s¢ funciona com a linha:
echo device=c:\Windows\Command\ansi.sys
echo no config.sys.
echo .
echo O que vocˆ deseja fazer?
echo .
echo      1. Limpar a tela
echo      2. Mudar a cor da tela
echo      3. Por o cursor no meio da tela
echo      4. Transformar o A (a mai£sculo) no
echo         comando dir
echo .
echo      0. Sair
echo .
choice /C:01234 /N Qual a sua op‡Æo?
if errorlevel 5 goto A_Dir
if errorlevel 4 goto Cursor
if errorlevel 3 goto CorTela
if errorlevel 2 goto LimpTela
if errorlevel 1 goto fim

:LimpTela
echo [2J
goto fim

:CorTela
echo [1;44m
CLS
echo [1;28H OUTRAS CORES SÇO:
echo [3;28H 0 - Nomal
echo [4;28H 1 - Alta intensidade
echo [5;28H 2 - Intensidade normal
echo [6;28H 4 - Azul
echo [7;28H 7 - Video inverso
echo [8;28H 8 - Texto invis¡vel
echo [9;28H 30 - preto
echo [10;28H 31 - Foreground vermelho
echo [11;28H 32 - Foreground verde
echo [12;28H 33 - Foreground amarelo
echo [13;28H 34 - Foreground azul
echo [14;28H 36 - Foreground ciano
echo [15;28H 37 - Foreground branco
echo [16;28H 40 - Background preto
echo [17;28H 41 - Background vermelho
echo [18;28H 42 - Background verde
echo [19;28H 43 - Background amarelo
echo [20;28H 44 - Background azul
echo [21;28H 45 - Background magenta
echo [22;28H 46 - Background ciano
echo [23;28H 47 - Background branco
goto fim

:Cursor
cls
echo [12;38H Meio
goto fim

:A_Dir
echo [97;"Dir";13p
goto fim

:fim
echo [24;01H
choice Finalizar o programa 
if errorlevel 2 goto Comeco
echo [0;40m
cls
