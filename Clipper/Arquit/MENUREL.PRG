mrel=savescreen(05,40,19,58)
setcolor("w+/b")
@ 04,44 say [Relat¢rios]
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(05,43,11,54)
*boxshadow(05,43,19,54)
@ 05,43 say [Â]
@ 05,54 say [Â]
setcolor("GR+/b,W+*/B")
@ 06,44 prompt [ Clientes ] MESSA [Relatorio de Clientes]
@ 08,44 prompt [  Vigas   ] MESSA [Menu Relatorio de Vigas]
@ 10,44 prompt [ Pilares  ] MESSA [Menu Relatorio de Pilares]
menu to rela
set key 4 to
set key 19 to
DO CASE
   case rela=1
*        do rel_soc
   case rela=2
        do rel_vig
   case rela=3
*        do rel_anis
   case rela=4
*        do rel_prnq
   case rela=5
*        do rel_etis
   case rela=6
*        do rel_etid
   case rela=7
*        do rel_reci
   CASE rela=0
        exit
ENDCASE
ENDDO
I=0
FOR I=1 TO 7
SCROLL(05,43,11,54,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(05,40,19,58,mrel)
