mrel=savescreen(05,31,13,42)
setcolor("w+/b")
@ 04,31 say [Relat¢rios]
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(05,31,13,42)
*boxshadow(05,43,19,54)
@ 05,31 say [Â]
@ 05,42 say [Â]
setcolor("GR+/b,W+*/B")
@ 06,32 prompt [ Clientes ] MESSA [Relatorio de clientes]
@ 08,32 prompt [  Bancos  ] MESSA [Relatorio de bancos]
@ 10,32 prompt [Vendedores] MESSA [Relatorio de vendedores]
@ 12,32 prompt [Duplicatas] MESSA [Relatorio de duplicatas em aberto]
menu to rela
set key 4 to
set key 19 to
DO CASE
   case rela=1
        do rel_cli
   case rela=2
        do rel_ban
   case rela=3
        do rel_ven
   case rela=4
        do rel_dup
   CASE rela=0
	exit
ENDCASE
ENDDO
I=0
FOR I=1 TO 7
SCROLL(05,31,13,42,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(05,31,13,42,mrel)
