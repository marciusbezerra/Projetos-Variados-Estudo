****************  LIMPADOR DE TELA (CRESSENTE) ************
SET TALK OFF
SET CURSOR OFF
/*TONE(300)
TONE(600)
TONE(900)
TONE(1200)
TONE(1500)
TONE(1800,2)*/
K=0
L=13
C=36
LF=12
CF=35
DO WHILE L>=1
   t=0
   K=0
   L-=2
   LF+=2
  WHILE K<=5
      t=0
      K+=1
      C-=1
      CF+=1
      SETCOLOR("B/B")
      @ L,C CLEAR TO LF,CF &&BOX [Û]
      do while t<=1000
         t+=1
      enddo
   END
ENDDO
SETCOLOR("")
SET CURSOR ON
