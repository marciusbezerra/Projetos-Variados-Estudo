*********************************************************************
*  RELACAO DE TODOS OS ITENS CADASTRADOS NA DIMAP
*  MARIO MACEDO  & AURICELIO JUNIOR
*  Quinta-feira, 11 de Abril  de 1996
*********************************************************************
PUBLIC WDATA
USE SUBGRUPO NEW ALIAS SG
SET INDEX TO SUBG1
reindex
GO TOP
use item new alias it
set index to INDIT10
reindex
go top
SET DATE BRIT
M:=0
WHILE M<3
GO TOP
CLS
* DATA()
pag:=0
l:=1
SET DEVICE TO printer
SET PRINTER on
cab()
SUB:=SPACE(4)
GR:=SUBSTR(CODI,1,4)
While !eof()
 IF GR="0101" .OR. GR="0102" .OR. GR="0103" .OR. GR="0104" .OR. GR="0105";
   .OR. GR="0106" .OR. GR="0107" .OR. GR="0108" .OR. GR="0110";
   .OR. GR="0112" .OR. GR="0120" .OR. GR="0121" .OR. GR="0122";
   .OR. GR="0123" .OR. GR="0124" .OR. GR="0125" .OR. GR="0126";
   .OR. GR="0129" .OR. GR="0130" // INICIO DO IF DOS SETORES
   if l>58
       l:=l+4
       cab()
   endif
   IF SUB<>SUBSTR(CODI,1,4)
       SUB:=SUBSTR(CODI,1,4)
       SELE SG
       SEEK SUB
       IF FOUND()
          SUBG:=NOME
       ELSE
          SUBG:=SPACE(10)
       ENDIF
       SELE IT
       L:=L+2
       @ L,5 SAY SUBG
       L:=L+2
   ENDIF
   codigo:=substr(codi,1,2)+"."+substr(codi,3,2)+"."+substr(codi,5,3)+"-"+substr(codi,8,1)
   @ l,8 say codigo
   @ l,23 say espec
   @ l,68 say unid
   l++
  ENDIF                          // FIM DO IF DOS SETORES
   SUB:=SUBSTR(CODI,1,4)
   sele it
   skip
   GR:=SUBSTR(CODI,1,4)

end
M++
END
l:=0
@ l,1 say "  "

RETURN

procedure cab
  PAG++
  CONT:=0
  L:=2
  @ l,5 say "UNIVERSIDADE ESTADUAL VALE DO ACARAU"
  @ L,55 SAY "PAGINA.: "+STR(PAG,3)
  L++
  @ L,5 SAY "DIMAP - DIVISAO DE MATERIAL E PATRIMONIO"
  @ L,55 SAY "DATA.: "
  @ L,63 SAY DATE()
  L++
  @ L,5 SAY REPL("-",70)
  L++
  @ L,8 SAY "CODIGO"
  @ L,23 SAY "ITEM"
  @ L,68 SAY "UNID"
  L++
  @ L,5 SAY REPL("-",70)
  L:=L+2

return

PROCEDURE DATA
DIA:=STR(DAY(DATE()))
MES:=ALLTRIM(STR(MONTH(DATE())))
ANO:=SUBSTR(STR(YEAR(DATE())),4,2)
WDATA:=DIA+"/0"+MES+"/"+ANO
RETURN

