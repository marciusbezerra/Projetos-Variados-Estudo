TELcad=SAVESCREEN(00,00,24,79)
setcolor([W+/B])
@ 04,01 say padc([Cadastro de duplicatas],78)
*quadro3(06,01,20,78)
** boxshadow(06,08,20,72)
@ 06,01 clear to 20,78
setcolor([w+/GB+])
@ 05,01 TO 05,77
setcolor([N/w])
@ 22,02 CLEAR TO 22,78
@ 22,01 say [Mensagens ->]
set key 22 to ins()
SELE 4
set index to xcoddup
go top
do while .T.
   setcolor([N/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para Sair]
   set cursor on
   mcodigo=0
   mcodcli=0
   mcodban=0
   mcodven=0
   mvalor=0.00
   mdtemissao=ctod("  /  /  ")
   mdtvenc=ctod("  /  /  ")
   mdtpag=ctod("  /  /  ")
   setcolor([w+/b,d+/w])
   @ 06,01 clear to 20,78
   @ 11,03 say [Cod. cliente......:] get mcodcli pict [9,999,999,999] 
   @ 12,03 say [Cod. banco........:] get mcodban pict [9,999,999,999]
   @ 13,03 say [Data emiss∆o......:] get mdtemissao 
   @ 14,03 say [Valor do t°tulo...:] get mvalor pict [9,999,999,999.99]
   @ 15,03 say [Data vencimento...:] get mdtvenc
   @ 16,03 say [Cod. representante:] get mcodven pict [999]
   @ 17,03 say [Data pagamento....:] get mdtpag 
     clear gets
   @ 9,03 say [Cod. duplicata....:] get mcodigo pict [9,999,999,999] valid mcodigo>0
     read
     IF LASTKEY()=27
        EXIT
     ENDIF
   set key 28 to
   seek str(mcodigo,10)
   if !found()
      setcolor([N/w])
      @ 22,15 CLEAR TO 22,78
        tone(1000,2) ; tone(500,2) ; setcursor(0)
      @ 22,15 SAY [Duplicata n∆o Cadastrada.   Pressione Algo...]
        inkey(0)
        loop
   endif
        setcolor([w+/b,d+/w])
        mcodcli=val(codcli)
        mcodban=val(codban)
        mcodven=val(codven)
        mvalor=valor
        mdtemissao=dtemissao
        mdtvenc=dtvenc
        mdtpag=dtpag
        @ 11,03 say [Cod. cliente......:] get mcodcli pict [9,999,999,999] valid busccli() when mens(1)
        @ 12,03 say [Cod. banco........:] get mcodban pict [9,999,999,999] valid buscban() when mens(2)
        @ 13,03 say [Data emiss∆o......:] get mdtemissao when mens(0) valid mdtemissao<>ctod("  /  /  ")
        @ 14,03 say [Valor do t°tulo...:] get mvalor pict [9,999,999,999.99] when mens(0)
        @ 15,03 say [Data vencimento...:] get mdtvenc when mens(0) valid datavenc()
        @ 16,03 say [Cod. representante:] get mcodven pict [999] valid buscven() when mens(3)
        @ 17,03 say [Data pagamento....:] get mdtpag when mens(0)
        busccli()
        buscban()
        buscven()
        clear gets
	setcolor([N/w])
      	@ 22,15 CLEAR TO 22,78
        tone(500,2) ; setcursor(0)
      	@ 22,15 SAY [Duplicata Cadastrada.   Pressione Algo...]
        inkey(0)
ENDDO
set key 22 to
set key 28 to
RESTSCREEN(00,00,24,79,TELcad)
RETURN
