telvig=savescreen(09,48,19,77)
setcolor("w+/b")
@ 08,44 say [  Vigas   ]
setcolor([n+/B])
@ 05,43 to 11,54
setcolor([w+/b])
@ 05,43 to 05,54
@ 05,43 say [Â]
@ 05,54 say [Â]
setcolor("/B")
@ 22,02 clear to 22,77
DO WHILE .T.
quadro3(09,48,19,76)
*boxshadow(09,48,19,76)
setcolor("GR+/B,W+*/B")
@ 10,49 prompt [  Viga Armadura Simples  ] messa [Relat¢rio de Vigas com Armadura Simples]
@ 12,49 prompt [   Viga Armadura Dupla   ] messa [Relat¢rio de Vigas com Armadura Dupla]
@ 14,49 prompt [     Vigas Cont¡nuas     ] messa [Relat¢rio de Vigas Cont¡nua]
@ 16,49 prompt [  Viga Ap.em outra Viga  ] messa [Relat¢rio de Vigas Apoiada em outra Viga]
@ 18,49 prompt [Viga c/balan‡o no Extremo] messa [Relat¢rio de Vigas com Balan‡o no Extremo]
menu to rvig
DO CASE
   CASE rvig=1
        do rvig_sim
   case rvig=2
*        do cvig_dup
   CASE rvig=3
*       do con_anis
   case rvig=4
*       do cvig_vig
   case rvig=5
   *    fo s
   CASE rvig=0
        exit
ENDCASE
ENDDO
setcolor("/b")
@ 22,02 clear to 22,77
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(09,48,19,76,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(09,48,19,77,telvig)
