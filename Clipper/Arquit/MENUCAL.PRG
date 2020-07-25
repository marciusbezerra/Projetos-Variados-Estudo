mpre=savescreen(05,14,12,28)
setcolor("w+/b")
@ 04,17 say [C lculos]
setcolor("/B")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(05,16,11,25)
*boxshadow(05,16,11,25)
@ 05,16 say [Â]
@ 05,25 say [Â]
setcolor("GR+/B,W+*/B")
@ 06,17 prompt [ Vigas ] messa [Menu para C lculo de Vigas]
@ 08,17 prompt [Pilares] messa [Menu para C lculo de Pilares]
@ 10,17 prompt [Config.] messa [Configura valores a ser calculados]
menu to pres
set key 4 to
set key 19 to
DO CASE
   CASE pres=1
        do menuvig
   case pres=2
        do menupil
   case pres=3
        do CCONFIG
   CASE pres=0
      exit
ENDCASE
ENDDO
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(05,16,11,25,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(05,14,12,28,mpre)
