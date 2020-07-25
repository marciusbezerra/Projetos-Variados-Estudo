*********************************************************************
*  RELACAO DE TODOS OS ITENS CADASTRADOS NA DIMAP
*  MARIO MACEDO  & AURICELIO JUNIOR
*  Quinta-feira, 11 de Abril  de 1996
*********************************************************************

use item new alias it
set index to ITEM2
go top
CLS
DIA:=STR(DAY(DATE()))
MES:=ALLTRIM(STR(MONTH(DATE())))
ANO:=SUBSTR(STR(YEAR(DATE())),4,2)
WDATA:=DIA+"/0"+MES+"/"+ANO
pag:=0
l:=1
*SET DEVICE TO PRINTER
*SET PRINTER ON
cab()
SUB:=SPACE(4)
GR:=SUBSTR(CODI,1,4)
While !eof()
 IF ESTOQUE=0
   if l>58
       l:=l+4
       cab()
   endif  
   codigo:=substr(codi,1,2)+"."+substr(codi,3,2)+"."+substr(codi,5,3)+"."+substr(codi,8,1)
   @ l,8 say codigo
   @ l,23 say espec
   @ l,68 say unid
   l++
  ENDIF 
  sele it
  skip  
end

procedure cab
  PAG++
  CONT:=0
  WHILE CONT<20000 
     CONT++
  END
  CLS
  L:=2
  @ L,5 SAY "DIMAP - DIVISAO DE MATERIAL E PATRIMONIO" 
  @ L,55 SAY "DATA.: "+WDATA
  L++
  @ l,5 say "RELACAO DOS ITENS ZERADOS EM ESTOQUE"
  @ L,55 SAY "PAGINA.: "+STR(PAG,3)
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