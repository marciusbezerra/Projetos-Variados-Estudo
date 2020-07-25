msai=savescreen(05,74,10,79)
setcolor("w+/b")
@ 04,75 say [Sair]
setcolor("/B")
@ 22,02 clear to 22,77
DO WHILE .T.
set key 4 to seta4
set key 19 to seta19
quadro3(05,74,09,78)
*boxshadow(05,74,09,78)
@ 05,74 say [Â]
@ 05,78 say [Â]
setcolor("gr+/b,W+*/B")
@ 06,75 prompt [Sim] MESSA [Retorna ao Sistema Operacional]
@ 08,75 prompt [NÆo] Messa [Retorna ao Menu Principal]
menu to sai
set key 4 to
set key 19 to
DO CASE
   CASE sai=1
        do fim
   case sai=2
        exit
   CASE sai=0
        exit
ENDCASE
ENDDO
I=0
FOR I=1 TO 7
SCROLL(05,74,09,78,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(05,74,10,79,msai)
