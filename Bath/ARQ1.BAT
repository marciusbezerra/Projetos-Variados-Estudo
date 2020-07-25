@echo off
echo ****************************************************************
echo                     EXEMPLOS DE ARQUIVOS .BAT
echo ****************************************************************
echo
echo Chamando outro arquivo:
choice Ao tÇrmino, deseja sair?
if errorlevel 2 goto volta
c:\windows\command\bootdisk
:volta
call c:\windows\command\bootdisk
echo
echo Pergunta padr∆o:
choice Responda sim ou n∆o
echo Pergunta com cochetes e opá‰es:
choice /c:vpd Reponda Visual Basic, Pascal ou Delphi
echo Pergunta sem cochetes o opá‰es:
choice /c:vpd /n Reponda [V]isual Basic, [P]ascal ou [D]elphi?
echo Pergunta de 5 segundos o padr∆o Ç Visual Basic:
choice /c:vpd /n /t:v,5 Reponda [V]isual Basic, [P]ascal ou [D]elphi? 
