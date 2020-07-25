manban=savescreen(08,13,14,21)
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(08,13,14,21)
setcolor("GR+/b,W+*/B")
@ 09,14 prompt [Incluir] messa [Inclui bancos]
@ 11,14 prompt [Alterar] messa [Altera bancos]
@ 13,14 prompt [Excluir] messa [Exclui bancos]
menu to mban
set key 4 to
set key 19 to
DO CASE
CASE mban=1
     do ban_cad
 case mban=2
     do ban_alt
 case mban=3
     do ban_del
 CASE mban=0
      exit
ENDCASE
ENDDO
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(08,13,14,21,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(08,13,14,21,manban)
