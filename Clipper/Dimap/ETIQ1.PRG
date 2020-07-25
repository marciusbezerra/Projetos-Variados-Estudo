********************************************************************
*
*   PROGRAMA: ETIQ.PRG
*   DATA: 09/04/96
*
********************************************************************

USE ITEM NEW ALIAS IT
SET INDEX TO ITEM1
GO TOP
SEEK "0120"
WCOD:=CODI
*SET PRINTER ON
*SET DEVICE TO PRINTER
WHILE !EOF() .AND. SUBSTR(WCOD,1,4)="0120"




END

