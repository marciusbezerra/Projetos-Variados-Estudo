TELcad=SAVESCREEN(00,00,24,79)
setcolor([W+/B])
@ 04,01 say padc([Cadastro de vendedores],78)
*quadro3(06,01,20,78)
boxshadow(06,08,20,72)
@ 06,01 clear to 20,78
setcolor([w+/GB+])
@ 05,01 TO 05,77
setcolor([N/w])
@ 22,02 CLEAR TO 22,78
@ 22,01 say [Mensagens ->]
set key 22 to ins()
SELE 3
SET INDEX TO XCODVEN
go top
iniciar=.t.
do while .T.
   setcolor([N/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para Sair]
   set cursor on
   if iniciar
      	if lastrec() > 0 
		go bottom
		mcodigo=val(codigo)
		mcodigo++
      	else
        	mcodigo=0
		mcodigo++
      	endif
        mnome=space(30)
   endif
   setcolor([w+/b,d+/w])
   @ 06,01 clear to 20,78
   @ 10,03 say [Nome completo....:] get mnome
     clear gets
   @ 7,03 say [Cod. vendedor....:] get mcodigo pict [999] valid mcodigo>0
     read
     IF LASTKEY()=27
        EXIT
     ENDIF
   seek str(mcodigo,3)
   if found()
        mnome=nome
        @ 10,03 say [Nome completo....:] get mnome
        clear gets
        setcolor([N/w])
        @ 22,15 CLEAR TO 22,78
        tone(1000,2) ; tone(500,2) ; setcursor(0)
        @ 22,15 SAY [Vendedor j  cadastrado.   Pressione algo...]
        inkey(0)
        loop
   endif
   setcolor([N/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para Cod. vendedor]
   setcolor([w+/b,d+/w])
   @ 10,03 say [Nome completo....:] get mnome valid mnome<>space(30)
   READ
   IF LASTKEY()=27
      iniciar=.t.
      LOOP
   ENDIF
   grava()
   if mopcao#[S]
      iniciar=.f.
      loop
   endif
   append blank
   repla codigo with str(mcodigo,3)
   repla nome with mnome
   commit
   iniciar=.t.
ENDDO
set key 22 to
RESTSCREEN(00,00,24,79,TELcad)
RETURN