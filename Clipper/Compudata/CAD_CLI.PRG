mancli=savescreen(06,13,12,21)
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(06,13,12,21)
setcolor("GR+/b,W+*/B")
@ 07,14 prompt [Incluir] messa [Inclui clientes]
@ 09,14 prompt [Alterar] messa [Altera clientes]
@ 11,14 prompt [Excluir] messa [Exclui clientes]
menu to mcli
set key 4 to
set key 19 to
DO CASE
CASE mcli=1
     do cli_cad
 case mcli=2
     do cli_alt
 case mcli=3
     do cli_del
 CASE mcli=0
      exit
ENDCASE
ENDDO
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(06,13,12,21,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(06,13,12,21,mancli)
