mrel=savescreen(05,27,15,45)
setcolor("w+/b")
@ 04,31 say [Consultas]
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(05,27,15,44)
*boxshadow(05,27,15,44)
@ 05,27 say [Â]
@ 05,44 say [Â]
setcolor("GR+/b,W+*/B")
@ 06,28 prompt [Clientes] MESSA [Consulta de Clientes]
@ 08,28 prompt [ Vigas  ] MESSA [Menu Consulta de Vigas]
@ 10,28 prompt [Pilares ] MESSA [Menu Consulta de Pilares]
@ 12,28 prompt [********] MESSA []
@ 14,28 prompt [********] MESSA []
menu to rela
set key 4 to
set key 19 to
DO CASE
   case rela=1
*      do con_soc
   case rela=2
*      do con_socd
   case rela=3
*      do menuani
   case rela=4
*      do con_preq
   case rela=5
*      do con_pren
   CASE rela=0
        exit
ENDCASE
ENDDO
I=0
FOR I=1 TO 7
SCROLL(05,27,15,44,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(05,27,15,45,mrel)
