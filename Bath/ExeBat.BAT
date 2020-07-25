@echo off
cls
echo Por Marcius Carneiro Bezerra
echo Este programa executa todos os arquivos bat de um diret¢rio
echo . 
if "%1"=="" goto QualAjuda
if "%1"=="/?" goto Ajuda
for %%D in (%1\*.bat) do call %%D


goto Fim

goto Fim

:QualAjuda
echo .
echo Para obter ajuda digite
echo .
echo exebat /?
echo .
goto Fim

:Ajuda
echo .
echo Ajuda:
echo .
echo A sisaxe ‚ exebat [Diret¢rio]
echo .
echo Vocˆ pode digitar . para usar o diret¢rio atual
echo e tamb‚m pode usar .. para o diret¢rio anterior ao atual
echo .
echo exemplo exebat c: (nÆo digite a barra no final)
echo .
goto Fim

:Fim
