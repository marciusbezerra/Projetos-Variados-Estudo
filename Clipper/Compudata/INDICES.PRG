mIND:=savescreen(08,00,16,79)
set cursor off
@ 09,16 clear to 15,65
close all
quadro(09,16,15,65)
BOXSHADOW(09,16,15,65)
SETCOLOR([n/r])
@ 09,25 say [´ Organizando Arquivos de Dados Ã]

SELE 1
use clientes
QUADRO(11,20,13,61)
SETCOLOR([W+/BG+])
tone(1000,1) ; tone(100,1)
@ 12,21 say replic([°],40)
@ 10,17 say padc("[CLIENTES.DBF]",48)
INDEX ON CODIGO tag CODIGO eval{||IND()} to XCODCLI
INDEX ON NOME tag NOME eval{||IND()} to XNOMECLI


SELE 2
use BANCOS
QUADRO(11,20,13,61)
SETCOLOR([W+/BG+])
tone(1000,1) ; tone(100,1)
@ 12,21 say replic([°],40)
@ 10,17 say padc("[BANCOS.DBF]",48)
INDEX ON CODIGO tag CODIGO eval{||IND()} to XCODBAN


SELE 3
use VENDEDOR
QUADRO(11,20,13,61)
SETCOLOR([W+/BG+])
tone(1000,1) ; tone(100,1)
@ 12,21 say replic([°],40)
@ 10,17 say padc("[VENDEDOR.DBF]",48)
INDEX ON CODIGO tag CODIGO eval{||IND()} to XCODVEN

SELE 4
use DUPLICAT
QUADRO(11,20,13,61)
SETCOLOR([W+/BG+])
tone(1000,1) ; tone(100,1)
@ 12,21 say replic([°],40)
@ 10,17 say padc("[DUPLICAT.DBF]",48)
INDEX ON CODIGO tag CODIGO eval{||IND()} to XCODDUP
INDEX ON CODCLI tag CODCLI eval{||IND()} to XDUPCODC
index on DTVENC+VAL(CODBAN) tag DTVENC+CODBAN eval{||IND()} to XVENCBAN

CLOSE ALL
SELE 1
USE CLIENTES
set index to XCODCLI
set index to XNOMECLI
SELE 2
USE BANCOS
set index to XCODBAN
SELE 3
USE VENDEDOR
SET INDEX TO XCODVEN
SELE 4
USE DUPLICAT
SET INDEX TO XCODDUP
SET INDEX TO XDUPCODC
SET INDEX TO XVENCBAN

RESTSCREEN(08,00,16,79,MIND)
set cursor on
RETURN

function IND()
set color to N/BG+
@ 14,33 say str(((recno()/lastrec())*100),3)
@ 14,37 say [%  Concluido]
mt=int((((recno()/lastrec())*100))*40)/100
set color to GR+/BG+
@ 12,21 say replic([Û],mt)
return(.t.)
