********************************************************************
*
*   PROGRAMA: ETIQ.PRG
*   DATA: 09/04/96
*
********************************************************************
cls
USE ITEM NEW ALIAS IT
SET INDEX TO ITEM1
GO TOP
SEEK "0130"
WCOD:=CODI
SET PRINTER ON
SET DEVICE TO PRINTER
l:=0
WHILE !EOF() .AND. SUBSTR(WCOD,1,4)="0130"
 IF ESTOQUE>0 
  @ l,5 say codi
  l++
  @ l,5 say alltrim(espec)
  l++
  if !empty(local) 
     @ l,5 say "local "+local
  endif 
  l:=l+4
  wcod:=codi
 ENDIF
  SELE IT 
  skip
END

