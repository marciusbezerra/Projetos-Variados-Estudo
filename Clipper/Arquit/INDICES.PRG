mIND:=savescreen(08,00,16,79)
set cursor off
@ 09,16 clear to 15,65
close all
quadro(09,16,15,65)
BOXSHADOW(09,16,15,65)
SETCOLOR([n/r])
@ 09,25 say [´ Organizando Arquivos de Dados Ã]

SELE 1
use cliente
QUADRO(11,20,13,61)
SETCOLOR([W+/BG+])
tone(1000,1) ; tone(100,1)
@ 12,21 say replic([°],40)
@ 10,17 say padc("[CLIENTE.DBF]",48)
INDEX ON CODI tag CODI eval{||IND()} to CLIENT01

SELE 2
use vigas
QUADRO(11,20,13,61)
SETCOLOR([W+/BG+])
tone(1000,1) ; tone(100,1)
@ 12,21 say replic([°],40)
@ 10,17 say padc("[VIGAS.DBF]",48)
index on STR(CODIV,4)+STR(V,2) tag CODIV+V eval{||IND()} to VIGAS01

SELE 3
use tabelas
QUADRO(11,20,13,61)
SETCOLOR([W+/BG+])
tone(1000,1) ; tone(100,1)
@ 12,21 say replic([°],40)
@ 10,17 say padc("[TABELAS.DBF]",48)
index on TABE tag TABE eval{||IND()} to TABELA01

CLOSE ALL
SELE 1
USE CLIENTE
set index to CLIENT01
SELE 2
USE VIGAS
SET INDEX TO VIGAS01
SELE 3
USE TABELAS
SET INDEX TO TABELA01
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
