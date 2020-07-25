FUNC liscli()
SET KEY 28 TO
TelPROC=savescreen(00,00,24,79)
SELE 1
set index to XNOMECLI
GO TOP
TITU={[C¢digo           ³             C l i e n t e]}
CAM={[SPACE(4)+codigo+space(4)+chr(179)+space(1)+nome+space(1)]}
sepa={[Ä]}
QUADRO(09,03,19,76)
@ 19,24 say [´  -> Mov. ³ ESC -> Sai Ã]
boxshadow(09,03,19,76)
@ 09,03 SAY [Ã]
@ 09,76 SAY [´]
setcolor([N/R])
@ 09,30 say [´ Rela‡Æo de Clientes Ã]
SETCOLOR([W+/gB+,GR+/B])
dbedit(10,04,18,75,CAM,[tecpcad1],[],TITU,SEPA)
RESTSCREEN(00,00,24,79,TELPROC)
SETCOLOR([W+/B,GR+/B])
RETURN

function tecpcad1(mode)
do case
   case mode=1
         SETCOLOR([n/w])
         @ 22,15 CLEAR TO 22,78
         @ 22,15 SAY [In¡cio de Arquivo ! ! ! ]
           inkey(.3)
         @ 22,15 clear to 22,78
         return(1)
   case mode=2
         SETCOLOR([n/w])
         @ 22,15 CLEAR TO 22,78
         @ 22,15 SAY [Fim de Arquivo ! ! !]
           inkey(.3)
         @ 22,15 clear to 22,78
         return(1)
   case mode=3
         QUADRO2(12,25,15,54)
         BOXSHADOW(12,25,15,54)
         setcolor([W+/r])
         @ 13,27 say [Arquivo sem Conte£do ! ! !]
         SETCOLOR([w+*/r])
         @ 14,27 say [    Pressione Algo . . .  ]
           inkey(0)
         return(0)
   case mode=4
        if lastkey()=27
           SET KEY 28 TO liscli
           return(0)
          ELSEIF LASTKEY()=13
           Mcodcli=val(codigo)
           keyboard chr(13)
           return(0)
        endif
endcase
return(1)                   

FUNC lisban()
SET KEY 28 TO
TelPROC=savescreen(00,00,24,79)
SELE 2
GO TOP
TITU={[C¢digo           ³             B a n c o]}
CAM={[SPACE(4)+codigo+space(4)+chr(179)+space(1)+nome+space(1)]}
sepa={[Ä]}
QUADRO(09,03,19,76)
@ 19,24 say [´  -> Mov. ³ ESC -> Sai Ã]
boxshadow(09,03,19,76)
@ 09,03 SAY [Ã]
@ 09,76 SAY [´]
setcolor([N/R])
@ 09,30 say [´  Rela‡Æo de Bancos  Ã]
SETCOLOR([W+/gB+,GR+/B])
dbedit(10,04,18,75,CAM,[tecpcad2],[],TITU,SEPA)
RESTSCREEN(00,00,24,79,TELPROC)
SETCOLOR([W+/B,GR+/B])
RETURN

function tecpcad2(mode)
do case
   case mode=1
         SETCOLOR([n/w])
         @ 22,15 CLEAR TO 22,78
         @ 22,15 SAY [In¡cio de Arquivo ! ! ! ]
           inkey(.3)
         @ 22,15 clear to 22,78
         return(1)
   case mode=2
         SETCOLOR([n/w])
         @ 22,15 CLEAR TO 22,78
         @ 22,15 SAY [Fim de Arquivo ! ! !]
           inkey(.3)
         @ 22,15 clear to 22,78
         return(1)
   case mode=3
         QUADRO2(12,25,15,54)
         BOXSHADOW(12,25,15,54)
         setcolor([W+/r])
         @ 13,27 say [Arquivo sem Conte£do ! ! !]
         SETCOLOR([w+*/r])
         @ 14,27 say [    Pressione Algo . . .  ]
           inkey(0)
         return(0)
   case mode=4
        if lastkey()=27
           SET KEY 28 TO lisban
           return(0)
          ELSEIF LASTKEY()=13
           Mcodban=val(codigo)
           keyboard chr(13)
           return(0)
        endif
endcase
return(1)                   


FUNC lisven()
SET KEY 28 TO
TelPROC=savescreen(00,00,24,79)
SELE 3
GO TOP
TITU={[C¢digo           ³             R e p r e s e n t a n t e s]}
CAM={[SPACE(4)+codigo+space(4)+chr(179)+space(1)+nome+space(1)]}
sepa={[Ä]}
QUADRO(09,03,19,76)
@ 19,24 say [´  -> Mov. ³ ESC -> Sai Ã]
boxshadow(09,03,19,76)
@ 09,03 SAY [Ã]
@ 09,76 SAY [´]
setcolor([N/R])
@ 09,30 say [´    Representantes   Ã]
SETCOLOR([W+/gB+,GR+/B])
dbedit(10,04,18,75,CAM,[tecpcad3],[],TITU,SEPA)
RESTSCREEN(00,00,24,79,TELPROC)
SETCOLOR([W+/B,GR+/B])
RETURN

function tecpcad3(mode)
do case
   case mode=1
         SETCOLOR([n/w])
         @ 22,15 CLEAR TO 22,78
         @ 22,15 SAY [In¡cio de Arquivo ! ! ! ]
           inkey(.3)
         @ 22,15 clear to 22,78
         return(1)
   case mode=2
         SETCOLOR([n/w])
         @ 22,15 CLEAR TO 22,78
         @ 22,15 SAY [Fim de Arquivo ! ! !]
           inkey(.3)
         @ 22,15 clear to 22,78
         return(1)
   case mode=3
         QUADRO2(12,25,15,54)
         BOXSHADOW(12,25,15,54)
         setcolor([W+/r])
         @ 13,27 say [Arquivo sem Conte£do ! ! !]
         SETCOLOR([w+*/r])
         @ 14,27 say [    Pressione Algo . . .  ]
           inkey(0)
         return(0)
   case mode=4
        if lastkey()=27
           SET KEY 28 TO lisven
           return(0)
          ELSEIF LASTKEY()=13
           Mcodven=val(codigo)
           keyboard chr(13)
           return(0)
        endif
endcase
return(1)
