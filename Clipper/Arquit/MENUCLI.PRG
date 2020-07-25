mman=savescreen(05,01,12,14)
setcolor("w+/b")
@ 04,02 say [Clientes]
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(05,01,11,11)
*boxshadow(05,01,11,11)
@ 05,01 say [Â]
@ 05,11 say [Â]
setcolor("GR+/b,W+*/B")
@ 06,02 prompt [Cadastrar] messa [Inclui Ficha de Clientes]
@ 08,02 prompt [ Alterar ] messa [Altera Ficha de Clientes]
@ 10,02 prompt [ Deletar ] messa [Exclui Ficha de Clientes]
menu to manu
set key 4 to
set key 19 to
DO CASE
CASE manu=1
     do cli_cad
 case manu=2
     do cli_alt
 case manu=3
     do cli_del
 CASE manu=0
      exit
ENDCASE
ENDDO
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(05,01,11,11,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(05,01,12,14,mman)
