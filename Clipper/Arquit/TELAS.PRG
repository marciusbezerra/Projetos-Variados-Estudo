***************** FUNCAO DE PROCURA DA: ALTERA€ÇO, DELE€ÇO ******************
FUNC liscad
SET KEY 28 TO
TelPROC=savescreen(00,00,24,79)
SELE 1
GO TOP
TITU={[Cadastro No. ³             C l i e n t e]}
CAM={[SPACE(4)+transform(codi,"@E 9,999")+space(4)+chr(179)+space(1)+clien+space(1)]}
sepa={[Ä]}
QUADRO(09,03,19,76)
@ 19,24 say [´  -> Mov. ³ ESC -> Sai Ã]
boxshadow(09,03,19,76)
@ 09,03 SAY [Ã]
@ 09,76 SAY [´]
setcolor([N/R])
@ 09,30 say [´ Rela‡Æo de Clientes Ã]
SETCOLOR([W+/gB+,GR+/B])
dbedit(10,04,18,75,CAM,[tecpcad],[],TITU,SEPA)
RESTSCREEN(00,00,24,79,TELPROC)
SETCOLOR([W+/B,GR+/B])
SET KEY 28 TO liscad()
RETURN

function tecpcad(mode)
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
           return(0)
          ELSEIF LASTKEY()=13
           Mcod=codi
           keyboard chr(13)
           return(0)
        endif
endcase
return(1)                   

***************** FUNCAO DE PROCURA DA: ALTERA€ÇO, DELE€ÇO ******************
FUNC listab
SET KEY 28 TO
TelPROC=savescreen(00,00,24,79)
SELE 3
GO TOP
TITU={[Tab.³Coef.³ A‡o ³Along.³Resist.³Encurt.³ æ 1 ³ æ 2 ³V/..³M/..]}
CAM={[str(tabe,4)+chr(179)+space(1)+transform(coef,"@E 9.99")+CHR(179)+SPACE(1)+transform(tipoaco,"@E 99")+" "+acole+CHR(179)+SPACE(1)+transform(along,"@E 9.99")+SPACE(1)+CHR(179)+SPACE(2)+transform(resist,"@E 999")+SPACE(2)+CHR(179)+SPACE(2)+transform(encurt,"@E 9.99")+SPACE(1)+chr(179)+transform(mu1,"@E 9.999")+CHR(179)+transform(mu2,"@E 9.999")+CHR(179)+SPACE(1)+transform(dfor,"@E 99")+SPACE(1)+CHR(179)+SPACE(1)+transform(dmom,"@E 99")+space(1)]}
SEPA={[Ä]}
QUADRO(11,09,19,71)
@ 19,14 say [´  -> Mov. ³ <Ä¼ -> Confirma Tabela ³ ESC -> Sai Ã]
boxshadow(11,09,19,71)
@ 13,09 SAY [Ã]
@ 13,70 SAY [´]
setcolor([N/R])
@ 11,30 say [´ Rela‡Æo de Tabelas Ã]
SETCOLOR([W+/gB+,GR+/B])
dbedit(12,10,18,70,CAM,[tecprsc],[],TITU,SEPA)
RESTSCREEN(00,00,24,79,TELPROC)
SETCOLOR([W+/B,GR+/B])
SET KEY 28 TO listab()
RETURN

function tecprsc(mode)
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
           return(0)
          ELSEIF LASTKEY()=13
           Mtab=tabe
*           @ 10,10 say [Tabela de Seguran‡a No.] get mtab pict [9999]
           clea gets
           return(0)
        endif
endcase
return(1)

