msoc=savescreen(07,10,14,21)
setcolor("w+/Gb+")
@ 06,04 say [S¢cios]
setcolor([n+/bg+])
@ 05,01 to 09,13
setcolor([w+/bg+])
@ 05,01 to 05,13
@ 05,01 say [Â]
@ 05,13 say [Â]
setcolor("/bg+")
@ 22,02 clear to 22,77
DO WHILE .T.
quadro3(07,10,13,20)
*boxshadow(07,10,13,20)
setcolor("X/gb+,W+*/gB+")
@ 08,11 prompt [*********] messa []
@ 10,11 prompt [*********] messa []
@ 12,11 prompt [*********] messa []
menu to soc
DO CASE
CASE soc=1
     do man_cads
 case soc=2
     do man_alts
 case soc=3
     do man_dels
 CASE soc=0
      exit
ENDCASE
ENDDO
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(07,10,14,21,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(07,10,14,21,msoc)
