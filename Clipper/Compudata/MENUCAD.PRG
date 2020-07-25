mman=savescreen(05,01,13,12)
setcolor("w+/b")
@ 04,02 say [Cadastros]
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(05,01,13,12)
@ 05,01 say [Â]
@ 05,12 say [Â]
setcolor("GR+/b,W+*/B")
@ 06,02 prompt [ Clientes ] messa [Inclui, altera e exclui clientes]
@ 08,02 prompt [  Bancos  ] messa [Inclui, altera e exclui bancos]
@ 10,02 prompt [Vendedores] messa [Inclui, altera e exclui vendedores]
@ 12,02 prompt [Duplicatas] messa [Inclui, altera e exclui duplicatas]
menu to manu
set key 4 to
set key 19 to
DO CASE
CASE manu=1
     do cad_cli
 case manu=2
     do cad_ban
 case manu=3
     do cad_ven
 case manu=4
     do cad_dup
 CASE manu=0
      exit
ENDCASE
ENDDO
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(05,01,13,12,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(05,01,13,12,mman)
