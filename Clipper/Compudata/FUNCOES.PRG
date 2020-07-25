***********************  calculadora  ********************
func calc
SET KEY CTRLF10 TO
*SET COLOR TO N*/W
*@ 23,28 SAY [ PARA MOVER USE ƒƒ> CTRL SETAS ]
*SET COLOR TO
* -> Funcao que ativa a calculadora
movcal_x=6
movcal_y=-1
M->X_POS=ROW()
M->Y_POS=COL()
M->C_COR=SETCOLOR()
M->CA_TELA=SAVESCREEN(MOVCAL_X+0,MOVCAL_Y+53,MOVCAL_X+14,MOVCAL_Y+79)
SET CURSOR OFF
SET COLOR TO w+/b
@ MOVCAL_X+1,MOVCAL_Y+54 CLEAR TO MOVCAL_X+13,MOVCAL_Y+78
SET COLOR TO w+/b
@ 02+MOVCAL_X,55+MOVCAL_Y SAY REPL(CHR(220),23)
@ 03+MOVCAL_X,55+MOVCAL_Y SAY CHR(219)+SPACE(21)+CHR(219)
@ 04+MOVCAL_X,55+MOVCAL_Y SAY REPL(CHR(223),23)
SET COLOR TO w+/b
@ 00+MOVCAL_X,53+MOVCAL_Y TO 14+MOVCAL_X,79+MOVCAL_Y DOUBLE
SET COLOR TO GR+/b
@ 06+MOVCAL_X,55+MOVCAL_Y SAY " 7 "
@ 06+MOVCAL_X,60+MOVCAL_Y SAY " 8 "
@ 06+MOVCAL_X,65+MOVCAL_Y SAY " 9 "
@ 08+MOVCAL_X,55+MOVCAL_Y SAY " 4 "
@ 08+MOVCAL_X,60+MOVCAL_Y SAY " 5 "
@ 08+MOVCAL_X,65+MOVCAL_Y SAY " 6 "
@ 10+MOVCAL_X,55+MOVCAL_Y SAY " 1 "
@ 10+MOVCAL_X,60+MOVCAL_Y SAY " 2 "
@ 10+MOVCAL_X,65+MOVCAL_Y SAY " 3 "
@ 12+MOVCAL_X,55+MOVCAL_Y SAY "  0  "
@ 12+MOVCAL_X,63+MOVCAL_Y SAY "  .  "
SET COLOR TO gr+/b
@ 06+MOVCAL_X,MOVCAL_Y+70 SAY " - "
@ 12+MOVCAL_X,MOVCAL_Y+75 SAY " % "
@ 08+MOVCAL_X,MOVCAL_Y+70 SAY " + "
@ 08+MOVCAL_X,MOVCAL_Y+75 SAY " * "
@ 10+MOVCAL_X,MOVCAL_Y+75 SAY " / "
SET COLOR TO W+/b
@ 10+MOVCAL_X,MOVCAL_Y+70 SAY "   "
@ 11+MOVCAL_X,MOVCAL_Y+70 SAY "<ƒŸ"
@ 12+MOVCAL_X,MOVCAL_Y+70 SAY "   "
@ 06+MOVCAL_X,MOVCAL_Y+75 SAY "C/E"
M->C_RESULT=0
M->C_ALGA=SPACE(14)
M->C_DEC=""
M->C_DIG=CHR(0)
M->C_VAR="C_ALGA"
M->C_VERDAD=.F.
SET COLOR TO W+/n
@ 03+MOVCAL_X,56+MOVCAL_Y SAY " "+STR(M->C_RESULT,19,4)+""
M->C_UOPER=""
M->C_PERC=" "
DO WHILE M->C_DIG<>CHR(27)
   M->C_DIG=CHR(INKEY(0))
   IF AT(M->C_DIG,CHR(26)+CHR(2)+CHR(141)+CHR(145))<>0
      M->MOV_TELA=SAVESCREEN(MOVCAL_X+0,MOVCAL_Y+53,MOVCAL_X+14,MOVCAL_Y+79)
      RESTSCREEN(MOVCAL_X+0,MOVCAL_Y+53,MOVCAL_X+14,MOVCAL_Y+79,M->CA_TELA)
      IF M->C_DIG=CHR(26)
         MOVCAL_Y=MOVCAL_Y-1
      ELSEIF M->C_DIG=CHR(2)
         MOVCAL_Y=MOVCAL_Y+1
      ELSEIF M->C_DIG=CHR(141)
         MOVCAL_X=MOVCAL_X-1
      ELSEIF M->C_DIG=CHR(145)
         MOVCAL_X=MOVCAL_X+1
      ENDIF
      IF MOVCAL_X+0<0
         MOVCAL_X=0
      ELSEIF MOVCAL_X+14>24
         MOVCAL_X=24-14
      ELSEIF MOVCAL_Y+53<0
         MOVCAL_Y=-53
      ELSEIF MOVCAL_Y+79>79
         MOVCAL_Y=0
      ENDIF
      M->CA_TELA=SAVESCREEN(MOVCAL_X+0,MOVCAL_Y+53,MOVCAL_X+14,MOVCAL_Y+79)
      RESTSCREEN(MOVCAL_X+0,MOVCAL_Y+53,MOVCAL_X+14,MOVCAL_Y+79,M->MOV_TELA)
   ENDIF
*  IF M->C_DIG=CHR(28)
*     DO HELP WITH "CALCULADORA"
*  ENDIF
   IF M->C_DIG=CHR(27)
      EXIT
   ENDIF
   M->C_XX=AT(M->C_DIG,CHR(22)+CHR(7)+CHR(6)+CHR(24)+CHR(3)+CHR(19)+CHR(76)+CHR(4)+CHR(1)+CHR(5)+CHR(18))
   IF M->C_XX<>0
      M->C_DIG=SUBS("0.123456789",M->C_XX,1)
   ENDIF
   M->C_VAR=IIF(M->C_DIG=".","M->C_DEC",M->C_VAR)
   M->C_ALGA=IIF(M->C_DIG="." .AND. M->C_ALGA=SPACE(14),SPACE(13)+"0",M->C_ALGA)
   IF M->C_DIG="%"
      IF M->C_VERDAD
         M->C_PERC=IIF(M->C_PERC="%"," ","%")
         SET COLOR TO w+/n
         @ 03+MOVCAL_X,77+MOVCAL_Y SAY M->C_PERC
         SET COLOR TO w+/n
      ELSE
         @ 03+MOVCAL_X,57+MOVCAL_Y SAY SPACE(13)+"0.0000"
      ENDIF
   ELSEIF M->C_DIG $ "0123456789" .AND. LEN(LTRIM(&C_VAR))<>IIF(M->C_VAR="M->C_DEC",4,14)
      &C_VAR=IIF(M->C_VAR="M->C_DEC",&C_VAR+M->C_DIG,SUBS(&C_VAR+M->C_DIG,2))
      @ 03+MOVCAL_X,57+MOVCAL_Y SAY M->C_ALGA+"."+SUBS(M->C_DEC+SUBS("00000",LEN(M->C_DEC)+1),1,4)
      M->C_VERDAD=IIF(M->C_VERDAD .AND. M->C_UOPER $ "="+CHR(13),.F.,M->C_VERDAD)
   ELSEIF M->C_DIG $ "+-/*="+CHR(13)
      IF M->C_VERDAD
         IF VAL(M->C_ALGA+"."+M->C_DEC)<>0
            IF M->C_PERC="%"
               M->OPE_RA=STR(M->C_RESULT,19,4)+M->C_UOPER+"("+STR(M->C_RESULT,19,4)+"*"+M->C_ALGA+"."+SUBS(M->C_DEC+SUBS("00000",LEN(M->C_DEC)+1),1,4)+")/100.000"
            ELSE
               M->OPE_RA=STR(M->C_RESULT,19,4)+M->C_UOPER+M->C_ALGA+"."+SUBS(M->C_DEC+SUBS("00000",LEN(M->C_DEC)+1),1,4)
            ENDIF
            M->C_RESULT=&OPE_RA
            @ 03+MOVCAL_X,57+MOVCAL_Y SAY STR(M->C_RESULT,19,4)
         ENDIF
      ELSEIF M->C_DIG $ "+-/*"
         M->C_VERDAD=.T.
         M->C_RESULT=VAL(M->C_ALGA+"."+M->C_DEC)
      ENDIF
      SET COLOR TO n/w+
      @ 03+MOVCAL_X,55+MOVCAL_Y SAY IIF(M->C_DIG $ "+-/*",M->C_DIG," ")
      @ 03+MOVCAL_X,77+MOVCAL_Y SAY " "
      SET COLOR TO W+/n
      M->C_VAR="M->C_ALGA"
      M->C_ALGA=SPACE(14)
      M->C_DEC=""
      M->C_UOPER=M->C_DIG
      M->C_PERC=" "
   ELSEIF M->C_DIG $ "EeCc"
      M->C_VAR="M->C_ALGA"
      M->C_ALGA=SPACE(14)
      M->C_DEC=""
      M->C_PERC=" "
      IF M->C_DIG $ "Cc"
         M->C_VERDAD=.F.
         SET COLOR TO n/w+
         @ 03+MOVCAL_X,55+MOVCAL_Y SAY " "
         @ 03+MOVCAL_X,77+MOVCAL_Y SAY " "
         SET COLOR TO w+/n
      ENDIF
      @ 03+MOVCAL_X,57+MOVCAL_Y SAY SPACE(13)+"0.0000"
   ENDIF
ENDDO
*
SETCOLOR(M->C_COR)
RESTSCREEN(0+MOVCAL_X,53+MOVCAL_Y,14+MOVCAL_X,79+MOVCAL_Y,M->CA_TELA)
SET KEY CTRLF10 TO CALC
@ M->X_POS,M->Y_POS SAY ""
*   SETCOLOR("w+/br+")
*   @ 23,15,23,77 box space(1)
*   SETCOLOR("N/W,w+*/R")
***************************  sobra  ********************
FUNCTION BoxShadow( nTop, nLeft, nBottom, nRight )

   LOCAL nShadTop
   LOCAL nShadLeft
   LOCAL nShadBottom
   LOCAL nShadRight

   nShadTop   := nShadBottom := MIN( nBottom + 1, MAXROW() )
   nShadLeft  := nLeft + 1
   nShadRight := MIN( nRight + 1, MAXCOL() )

   RESTSCREEN( nShadTop, nShadLeft, nShadBottom, nShadRight,                 ;
      TRANSFORM( SAVESCREEN(nShadTop, nShadLeft, nShadBottom, nShadRight),   ;
      REPLICATE("X", nShadRight - nShadLeft + 1 ) ) )

   nShadTop    := nTop + 1
   nShadLeft   := nShadRight := MIN( nRight + 1, MAXCOL() )
   nShadBottom := nBottom

   RESTSCREEN( nShadTop, nShadLeft, nShadBottom, nShadRight,                 ;
      TRANSFORM( SAVESCREEN(nShadTop,  nShadLeft, nShadBottom,  nShadRight), ;
      REPLICATE("X", nShadBottom - nShadTop + 1 ) ) )

   RETURN ( NIL )

***********************  quadro 1 ********************
function quadro1(li,ci,lf,cf)
If pcount()<4
   @ 23,10 say [Numero de parametros ivalido !]
   return(.f.)
endif
setcolor("w+/b")
@ li,ci clear to lf,cf
@ li,ci to lf,cf
return(.t.)

*************************  ins *********************
function ins
set key 22 to
if readinsert()
   readinsert(.f.)
   setcolor([r/bg+])
   @ 24,75 say [<Sub>]
   setcursor(1)
else
   readinsert(.t.)
   setcolor([r/bg+])
   @ 24,75 say [<Ins>]
   setcursor(3)
endif
set key 22 to ins()
return(.t.)

*************************  quadro  *************
function quadro(li,ci,lf,cf)
If pcount()<4
   @ 23,10 say [Numero de parametros ivalido !]
   return(.f.)
endif
setcolor("w+/Gb+")
@ li,ci clear to lf,cf
@ li,ci to lf,cf
return(.t.)

*************************  quadro  *************
function quadro3(li,ci,lf,cf)
If pcount()<4
   @ 23,10 say [Numero de parametros ivalido !]
   return(.f.)
endif
setcolor("w+/b")
@ li,ci clear to lf,cf
@ li,ci to lf,cf
return(.t.)
*************************  quadro 2 *************
function quadro2(li,ci,lf,cf)
If pcount()<4
   @ 23,10 say [Numero de parametros ivalido !]
   return(.f.)
endif
setcolor("w+/r")
@ li,ci clear to lf,cf
@ li,ci to lf,cf
return(.t.)

************************* setas do menu principal *******************
function seta4
set key 4 to
if lastkey()=4
   public ent:=1
   keyboard chr(27)+chr(4)+chr(13)
elseif lastkey()=19
   keyboard chr(27)+chr(19)+chr(13)
endif
set key 4 to seta4

********************************
function seta19
set key 19 to
if lastkey()=19
   keyboard chr(27)+chr(19)+chr(13)
elseif lastkey()=4
       keyboard chr(27)+chr(4)+chr(13)
endif
set key 19 to seta19

****************************
function seta24
set key 24 to
keyboard chr(13)
set key 24 to seta24

**********************  sai  **************
functio SAIDA
set cursor on
telasai=savescreen(00,00,24,79)
SETCOLOR("")
CLEAR screen
@ 00,00 say padc([Digite EXIT para voltar ao Software],80)
@ 01,00 say padc([Mem¢ria dispon°vel para outro tipo de Software],60)
@ 01,55 say memory(2)
@ 01,col()+2 say [KB]
RUN COMMAND.COM
restscreen(00,00,24,79,telasai)
return(.t.)
**********************  confirma  ***********
functio grava
grav=1
setcolor([n/w])
@ 22,15 clear to 22,78
@ 22,15 say [Confirma Dados->]
SETCOLOR([n/w,GR+/w])
@ 22,33 prompt [Sim]
@ 22,38 prompt [N∆o]
menu to grav
do case
   case grav=1
        public mopcao:=[S]
   case grav=2
        public mopcao:=[N]
   other
        public mopcao:=[N]
endcase
@ 22,15 clear to 22,78
setcolor([w+/bg+,gr+/b])
return(.t.)
**********************  deleta  ***********
functio apaga
setcolor([n/w])
@ 22,15 clear to 22,78
@ 22,15 say [Confirma Deleá∆o->]
SETCOLOR([n/w,GR+/w])
@ 22,40 prompt [N∆o]
@ 22,35 prompt [Sim]
menu to apag
do case
   case apag=1
        public mopcap:=[N]
   case apag=2
        public mopcap:=[S]
   other
        public mopcap:=[N]
endcase
@ 22,15 clear to 22,78
setcolor([w+/bg+,gr+/b])
return(.t.)

*****************  imprime  *****************
FUNCTION IMPRI
setcolor([n/w])
@ 22,15 clear to 22,78
@ 22,15 say [Confirma Impress∆o->]
SETCOLOR([n/w,GR+/w])
@ 22,37 prompt [Sim]
@ 22,42 prompt [N∆o]
menu to IMPR
do case
   case IMPR=1
        public mopIMP:=[S]
   case IMPR=2
        public mopimp:=[N]
   other
        public mopimp:=[N]
endcase
@ 22,15 clear to 22,78
setcolor([w+/bg+,gr+/b])
return(.t.)

********************** password **************8
func pass
!Vol>Volume.Tmp                      // Coloca volume em arquivo temporario
NumArq:=FOpen("Volume.Tmp",2)        // Abre o arquivo
FSeek(NumArq,-20,2)                  // Posiciona ponteiro de registro
Dados:=FReadStr(NumArq,20)           // Le os ultimos 20 bytes do arquivo
Fclose(NumArq)                       // Fecha o Arquivo
FErase("Volume.Tmp")                 // Destroi o arquivo temporario
Comp:=Len(Dados)                     // Comprimento da String lida
For h:=1 to comp                     // Abre loop para localizar hifem
  Letra:=Substr(dados,h,1)
  If Letra="-"
    Ini1:=h-4
    Ini2:=h+1
    Exit
  Endif
Next
Grupo1:=Substr(Dados,ini1,4)
Grupo2:=Substr(Dados,Ini2,4)
nserie:=(Grupo1+Grupo2)
if nserie#"207D6121" .and. nserie#[113608E4]
   clear
   @ row()+1,00 say padc([C¢pia n∆o Autorizada . . .],78)
   @ row()+1,00 say padc([Para sua Autorizaá∆o entre em Contato Conosco.],78)
     inkey(5)
   do fim
   return
endif
