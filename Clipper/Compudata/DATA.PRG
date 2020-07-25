*******************   DATA DE ENTRADA *************************
SET PROCEDURE TO FUNCOES
PROCEDURE DATA1
# INCLUDE "BOX.CH"
# INCLUDE "INKEY.CH"
public DATA:=DATE()
*SET COLOR TO W+/B,N/W
*@ 11,20,13,59 box B_DOUBLE_SINGLE+SPACE(1)
*BOXSHADOW(11,20,13,59)
SETCOLOR("W+/B,GR+/B")
@ 23,00
@ 23,22 SAY [  DATA ATUAL  ->] GET DATA PICT [@K]
READ

***********************  MOSTRAGEM DA DATA EM PORTUGUES  ************
PROCEDURE DATA2
PUBLIC DIAS:=DOW(DATA)
PUBLIC DIa:=DTOC(DATA)
PUBLIC DIA:=LEFT(DIA,2)
PUBLIC cmes:=MONTH(DATA)
PUBLIC cANO:=YEAR(DATA)
IF DIAS=1
   DIAS=[Domingo]
elseif dias=2
   dias=[Segunda]
elseif dias=3
   dias=[Ter‡a]
elseif dias=4
   dias=[Quarta]
elseif dias=5
   dias=[Quinta]
elseif dias=6
   dias=[Sexta]
elseif dias=7
   dias=[S bado]
endif
IF cmes=1
   cmes=[Janeiro]
elseif cmes=2
   cmes=[Fevereiro]
elseif cmes=3
   cmes=[Mar‡o]
elseif cmes=4
   cmes=[Abril]
elseif cmes=5
   cmes=[Maio]
elseif cmes=6
   cmes=[Junho]
elseif cmes=7
   cmes=[Julho]
elseif cmes=8
   cmes=[Agosto]
elseif cmes=9
   cmes=[Setembro]
elseif cmes=10
   cmes=[Outubro]
elseif cmes=11
   cmes=[Novembro]
elseif cmes=12
   cmes=[Dezembro]
endif
@ 02,45 SAY padl(dias+[, ]+dia+[ de ]+cmes+[ de ]+str(cano,4)+[.],33)
setcolor("w+/bg+")
@ 02,79 say [³]
setcolor("")

**********************  MOSTRAGEM DA hora ***********
procedure hora
set key CTRLF9 to
t:=0
ho:=savescreen(10,34,15,46)
t=0
M->C_COR=SETCOLOR()
quadro1(10,34,14,45)
boxshadow(10,34,14,45)
@ 12,35 to 12,44
@ 12,34 SAY [Ã]
@ 12,45 SAY [´]
do while t<=9000
   setcolor([gr+/b])
   @ 11,35 say [Hora Atual]
   @ 13,36 say TIME()
   setcolor("")
   t++
enddo
set key CTRLF9 to hora
SETCOLOR(M->C_COR)
restscreen(10,34,15,46,ho)
