mandup=savescreen(12,13,18,21)
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(12,13,18,21)
setcolor("GR+/b,W+*/B")
@ 13,14 prompt [Incluir] messa [Inclui duplicatas]
@ 15,14 prompt [Alterar] messa [Altera duplicatas]
@ 17,14 prompt [Excluir] messa [Exclui duplicatas]
menu to mdup
set key 4 to
set key 19 to
DO CASE
CASE mdup=1
     do dup_cad
 case mdup=2
     do dup_alt
 case mdup=3
     do dup_del
 CASE mdup=0
      exit
ENDCASE
ENDDO
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(12,13,18,21,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(12,13,18,21,mandup)
