telvig=savescreen(07,20,18,47)
setcolor("w+/b")
@ 06,17 say [ Vigas ]
setcolor([n+/B])
@ 05,16 to 11,25
setcolor([w+/b])
@ 05,16 to 05,25
@ 05,16 say [Â]
@ 05,25 say [Â]
setcolor("/B")
@ 22,02 clear to 22,77
DO WHILE .T.
quadro3(07,20,17,46)
*boxshadow(07,20,17,46)
setcolor("GR+/B,W+*/B")
@ 08,21 prompt [  Viga Armadura Simples  ] messa [C lculo de Vigas com Armadura Simples]
@ 10,21 prompt [   Viga Armadura Dupla   ] messa [C lculo de Vigas com Armadura Dupla]
@ 12,21 prompt [     Vigas Cont¡nuas     ] messa [C lculo de Vigas Cont¡nua]
@ 14,21 prompt [  Viga Ap.em outra Viga  ] messa [C lculo de Vigas Apoiada em outra Viga]
@ 16,21 prompt [Viga c/balan‡o no Extremo] messa [C lculo de Vigas com Balan‡o no Extremo]
menu to vig
DO CASE
   CASE vig=1
        do cvig_sim
   case vig=2
        do cvig_dup
   CASE vig=3
*       do con_anis
   case vig=4
        do cvig_vig
   case vig=5
   *    fo s
   CASE vig=0
        exit
ENDCASE
ENDDO
setcolor("/b")
@ 22,02 clear to 22,77
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(07,20,17,46,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(07,20,18,47,telvig)
