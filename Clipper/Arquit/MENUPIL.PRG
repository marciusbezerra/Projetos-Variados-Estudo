telpilar=savescreen(09,20,20,47)
setcolor("w+/b")
@ 08,17 say [Pilares]
setcolor([n+/b])
@ 05,16 to 11,25
setcolor([w+/b])
@ 05,16 to 05,25
@ 05,16 say [Â]
@ 05,25 say [Â]
setcolor("/b")
@ 22,02 clear to 22,77
DO WHILE .T.
quadro3(09,20,19,46)
*boxshadow(09,20,19,46)
setcolor("GR+/b,W+*/B")
@ 10,21 prompt [  Pilar Armadura Simples  ] messa [C lculo de Vigas com Armadura Simples]
@ 12,21 prompt [   Pilar Armadura Dupla   ] messa [C lculo de Vigas com Armadura Dupla]
@ 14,21 prompt [     Pilar Cont¡nuas      ] messa [C lculo de Vigas Cont¡nua]
@ 16,21 prompt [  Pilar Ap.em outra viga  ] messa [C lculo de Vigas Apoiada em outra Viga]
@ 18,21 prompt [Pilar c/balan‡o no Extremo] messa [C lculo de Vigas com Balan‡o no Extremo]
menu to pilar
DO CASE
   CASE pilar=1
*       do cpilar_sim
   case pilar=2
*       do cpilar_dup
   CASE pilar=3
*       do con_anis
   case pilar=4
*       do CON_ANID
   case pilar=5
   *    fo s
   CASE pilar=0
        exit
ENDCASE
ENDDO
setcolor("/b")
@ 22,02 clear to 22,77
SET PROCEDURE TO
I=0
FOR I=1 TO 7
SCROLL(09,20,19,46,I)
C:=1 ; WHILE C<=300 ; C++ ; ENDDO
NEXT
restscreen(09,20,20,47,telpilar)
