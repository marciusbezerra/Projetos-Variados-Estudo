msoc=savescreen(09,10,16,21)
setcolor("w+/Gb+")
@ 08,02 say [Dependentes]
setcolor([n+/bg+])
@ 05,01 to 09,13
setcolor([w+/bg+])
@ 05,01 to 05,13
@ 05,01 say [Â]
@ 05,13 say [Â]
setcolor("/bg+")
@ 22,02 clear to 22,77
DO WHILE .T.
quadro3(09,10,15,20)
*boxshadow(09,10,15,20)
setcolor("X/gb+,W+*/gB+")
@ 10,11 prompt [*********] messa []
@ 12,11 prompt [*********] messa []
@ 14,11 prompt [*********] messa []
menu to depe
DO CASE
CASE depe=1
     do man_cadd
 case depe=2
     do man_altd
 case depe=3
     do man_deld
 CASE depe=0
      exit
ENDCASE
ENDDO
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(09,10,15,20,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(09,10,16,21,msoc)
