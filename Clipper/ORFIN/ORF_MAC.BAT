@echo off
REM - programa para preparar a execu‡„o/grava‡„o de tutorial
REM - (apaga *.DB*, *.NTX, *.SYS e consultas gravadas)
echo 
echo                       A T E N € Ž O !
echo Os arquivos de dados do sistema "ORCAMENTO DE FINAIS DE SEMANA" ser„o
echo eliminados para execu‡„o da macro. Se desejar cancelar esta opera‡„o
echo pressione CTRL-C AGORA!
PAUSE >NUL
if exist CATS.DB* DEL CATS.DB*
if exist CAT*..PRG DEL CAT*.NTX
if exist DB*.CAT DEL DB*.CAT
if exist SUBCATS.DB* DEL SUBCATS.DB*
if exist SUB*..PRG DEL SUB*.NTX
if exist DB*.SUB DEL DB*.SUB
if exist PRODUTOS.DB* DEL PRODUTOS.DB*
if exist PRO*..PRG DEL PRO*.NTX
if exist DB*.PRO DEL DB*.PRO
if exist METAS.DB* DEL METAS.DB*
if exist MET*..PRG DEL MET*.NTX
if exist DB*.MET DEL DB*.MET
if exist GASTOS.DB* DEL GASTOS.DB*
if exist GAS*..PRG DEL GAS*.NTX
if exist DB*.GAS DEL DB*.GAS
if exist ORFPW.SYS ATTRIB ORFPW.SYS -R
if exist ORF_*.SYS DEL ORF_*.SYS
