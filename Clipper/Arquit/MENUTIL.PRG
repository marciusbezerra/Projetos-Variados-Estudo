muti=savescreen(05,55,09,75)
setcolor("w+/b")
@ 04,59 say [Utilit rios]
setcolor("/B")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(05,55,09,74)
*boxshadow(05,55,09,74)
@ 05,55 say [Â]
@ 05,74 say [Â]
setcolor("GR+/B,W+*/B")
@ 06,56 prompt [Organizar Arquivos] MESSA [Organiza Arquivos de Öndices]
@ 08,56 prompt [   Aviso MS-DOS   ] MESSA [Sa¡da Tempor ria para o Sistema Operacional]
menu to util
set key 4 to
set key 19 to
DO CASE
   case util=1
      do indices
   case util=2
      SAIDA()
   CASE util=0
        exit
ENDCASE
ENDDO
I=0
FOR I=1 TO 7
SCROLL(05,55,09,74,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(05,55,09,75,muti)
