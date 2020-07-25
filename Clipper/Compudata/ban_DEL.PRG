TELcad=SAVESCREEN(00,00,24,79)
setcolor([W+/B])
@ 04,01 say padc([Cadastro de bancos],78)
*quadro3(06,01,20,78)
boxshadow(06,08,20,72)
@ 06,01 clear to 20,78
setcolor([w+/GB+])
@ 05,01 TO 05,77
setcolor([N/w])
@ 22,02 CLEAR TO 22,78
@ 22,01 say [Mensagens ->]
set key 22 to ins()
SELE 2
set index to XCODBAN
go top
do while .T.
   setcolor([N/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para Sair]
   set cursor on
   mcodigo=0
   mnome=space(35)
   setcolor([w+/b,d+/w])
   @ 06,01 clear to 20,78
   @ 10,03 say [Nome do banco....:] get mnome
     clear gets
   @ 7,03 say [Cod. banco.......:] get mcodigo pict [9,999,999,999] valid mcodigo>0
     read
     IF LASTKEY()=27
        EXIT
     ENDIF
   seek str(mcodigo,10)
   if .not. found()
        clear gets
        setcolor([N/w])
        @ 22,15 CLEAR TO 22,78
        tone(1000,2) ; tone(500,2) ; setcursor(0)
        @ 22,15 SAY [Banco nao cadastrado.   Pressione algo...]
        inkey(0)
        loop
   else
   	setcolor([N/w])
   	@ 22,15 CLEAR TO 22,78
   	@ 22,15 SAY [Tecle <ESC> para Cod. banco]
   	setcolor([w+/b,d+/w])
        mnome=nome
        @ 10,03 say [Nome do banco....:] get mnome
   endif
   apaga()
   if mopcap#[S]
      loop
   endif
	delete
	commit
   iniciar=.t.
ENDDO
set key 22 to
RESTSCREEN(00,00,24,79,TELcad)
RETURN