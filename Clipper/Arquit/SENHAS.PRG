# include "box.ch"
********************  SENHA DE ENTRADA ******************
PROCEDURE SENHA
clear typeahead
LL=SAVESCREEN(24,00,24,79)
SET COLOR TO W+/B,N/W
@ 14,20,16,59 box B_DOUBLE_SINGLE+SPACE(1)
BOXSHADOW(14,20,16,59)
VEZ=0
DO WHILE .T.
   @ 15,21 CLEAR TO 15,58
   RESTSCREEN(24,00,24,79,LL)
   K=0
   chave=[SCSV.1]
   SENHA=[]
   cont=0
   COL=40
   c=1
   VR=0
   setcolor([w+/B])
   @ 15,39 say "[...............]"
   DO WHILE CONT<=14
      SET COLOR TO W+/B,N/W
      @ 15,22 SAY [ Digite Senha ->]
      @ 15,COL-1 SAY [.]
      @ 15,39 say "["
      SET COLOR TO RG+/B
      if col=40
         k=0
      endif
      if k#0
         @ 15,COL-1 SAY [þ]
      endif
      t:=inkey(0)
      IF T=13
         EXIT
      ENDIF
      IF T=5 .OR. T=4 .OR. T=24 .OR. T=9 .OR. T=22 .OR. T=1 .OR. T=18 .OR. T=7 .OR. T=6 .OR. T=3
         LOOP
      ELSEIF T=-1 .OR. T=-2 .OR. T=-3 .OR. T=-4 .OR. T=-5 .OR. T=-6 .OR. T=-7 .OR. T=-8 .OR. T=-9
         LOOP
      ENDIF
      IF T=27
         SET CURSOR OFF
         I=0
         FOR I=1 TO 13
             SCROLL(0,0,24,79,,I)
              INKEY(.1)
         NEXT
              close all
               set key -4 to
               set score on
               set key 4 to
               set key 19 to
               SETCOLOR("")
               set color to
               close all
               SET CURSOR ON
               clear
               cls
               DO FIM
      ENDIF
      if t=8 .OR. T=19
         VR++
         if k=0
            loop
         endif
         SET COLOR TO W+/B,N/W
         @ 15,col-1 say [.]
         col--
         cont--
         IF VR=1
            c-=2
            ELSE
            C-=1
         ENDIF
         senha:=substr(senha,1,c)
         loop
      endif
      SET COLOR TO RG+/B
      @ 15,COL SAY [þ]
      SET COLOR TO W+/B,N/W
      K=1
      COL++
      cont++
      c++
      SENHA:=SENHA+(chr(t))
      VR=0
   ENDDO
   IF UPPER(ALLTRIM(SENHA))==CHAVE
      PASSA=.T.
      EXIT
      ELSE
      VEZ++
      TONE(1000,2)
      SET COLOR TO W+*/B
      @ 24,00 SAY PADC([SENHA INVALIDA !!!  TECLE ALGO.],80)
      INKEY(0)
      IF VEZ=3
         @ 24,00
         TONE(1000,2)
         for i=1 to 10
             @ 24,00 say padc([ACESSO NEGADO ! ! !],80)
             inkey(.1)
         next
         PASSA=.F.
         EXIT
      ENDIF
      @ 24,00
      SENHA=[]
      LOOP
   ENDIF
ENDDO
RETU
