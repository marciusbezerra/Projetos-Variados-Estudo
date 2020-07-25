mcon=savescreen(05,16,13,27)
setcolor("w+/b")
@ 04,17 say [Consultas]
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(05,16,13,27)
*boxshadow(05,27,15,44)
@ 05,16 say [Â]
@ 05,27 say [Â]
setcolor("GR+/b,W+*/B")
@ 06,17 prompt [ Clientes ] MESSA [Consulta de clientes]
@ 08,17 prompt [  Bancos  ] MESSA [Consulta de bancos]
@ 10,17 prompt [Vendedores] MESSA [Consulta de vendedores]
@ 12,17 prompt [Duplicatas] MESSA [Consulta de duplicatas]
menu to cons
set key 4 to
set key 19 to
DO CASE
   case cons=1
      do con_cli
   case cons=2
      do con_ban
   case cons=3
      do con_ven
   case cons=4
      do con_dup
   CASE cons=0
        exit
ENDCASE
ENDDO
I=0
FOR I=1 TO 7
SCROLL(05,16,13,27,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(05,16,13,27,mcon)
