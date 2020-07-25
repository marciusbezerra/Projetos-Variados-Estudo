manven=savescreen(10,13,16,21)
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(10,13,16,21)
setcolor("GR+/b,W+*/B")
@ 11,14 prompt [Incluir] messa [Inclui vendedores]
@ 13,14 prompt [Alterar] messa [Altera vendedores]
@ 15,14 prompt [Excluir] messa [Exclui vendedores]
menu to mven
set key 4 to
set key 19 to
DO CASE
CASE mven=1
     do ven_cad
 case mven=2
     do ven_alt
 case mven=3
     do ven_del
 CASE mven=0
      exit
ENDCASE
ENDDO
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(10,13,16,21,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(10,13,16,21,manven)
