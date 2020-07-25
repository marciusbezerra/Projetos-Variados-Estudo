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
	mcodcli=0
   	mcodban=0
   	mcodven=0
   	mvalor=0.00
   	mdtemissao=ctod("  /  /  ")
   	mdtvenc=ctod("  /  /  ")
   	mdtpag=ctod("  /  /  ")
   endif
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
   @ 9,03 say [Cod. duplicata....:] get mcodigo pict [9,999,999,999] valid mcodigo>0 when mens(-1)
     read
     IF LASTKEY()=27
        EXIT
     ENDIF
   set key 28 to
   seek str(mcodigo,10)
   if found()
        mcodcli=val(codcli)
        mcodban=val(codban)
        mcodven=val(codven)
        mvalor=valor
        mdtemissao=dtemissao
        mdtvenc=dtvenc
        mdtpag=dtpag
        @ 11,03 say [Cod. cliente......:] get mcodcli pict [9,999,999,999]
        @ 12,03 say [Cod. banco........:] get mcodban pict [9,999,999,999]
        @ 13,03 say [Data emiss∆o......:] get mdtemissao 
        @ 14,03 say [Valor do t°tulo...:] get mvalor pict [9,999,999,999.99]
        @ 15,03 say [Data vencimento...:] get mdtvenc
        @ 16,03 say [Cod. representante:] get mcodven pict [999]
        @ 17,03 say [Data pagamento....:] get mdtpag
        busccli()
        buscban()
        buscven()
        clear gets
        setcolor([N/w])
        @ 22,15 CLEAR TO 22,78
        tone(1000,2) ; tone(500,2) ; setcursor(0)
        @ 22,15 SAY [Duplicata j† cadastrada.   Pressione algo...]
        inkey(0)
        loop
   endif
   setcolor([N/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para Cod. duplicata]
   setcolor([w+/b,d+/w])
   @ 11,03 say [Cod. cliente......:] get mcodcli pict [9,999,999,999] valid busccli() when mens(1)
   @ 12,03 say [Cod. banco........:] get mcodban pict [9,999,999,999] valid buscban() when mens(2)
   @ 13,03 say [Data emiss∆o......:] get mdtemissao when mens(0) valid mdtemissao<>ctod("  /  /  ")
   @ 14,03 say [Valor do t°tulo...:] get mvalor pict [9,999,999,999.99] when mens(0)
   @ 15,03 say [Data vencimento...:] get mdtvenc when mens(0) valid datavenc()
   @ 16,03 say [Cod. representante:] get mcodven pict [999] valid buscven() when mens(3)
   @ 17,03 say [Data pagamento....:] get mdtpag when mens(0) 
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
   repla codigo with str(mcodigo,10)
   repla codcli with str(mcodcli,10)
   repla codban with str(mcodban,10)
   repla codven with str(mcodven,3)
   repla valor with mvalor
   repla dtemissao with mdtemissao
   repla dtvenc with mdtvenc
   repla dtpag with mdtpag
   commit
   iniciar=.t.
ENDDO
set key 22 to
set key 28 to
RESTSCREEN(00,00,24,79,TELcad)
RETURN
func busccli()
        if lastkey()=5 .or. lastkey()=271
                return .t.
        endif
        sele 1
        set index to XCODCLI
        seek str(mcodcli,10)
        if eof()
                liscli()
        	sele 4
        	set index to xcoddup
		go top
		seek str(mcodigo,10)
                return .f.
        else
                @ 11,37 say substr(nome,1,40)
        endif
        sele 4
        set index to xcoddup
	go top
	seek str(mcodigo,10)
return .t.
func buscban()
        if lastkey()=5 .or. lastkey()=271
                return .t.
        endif
        sele 2
        seek str(mcodban,10)
        if eof()
                lisban()
        	sele 4
        	set index to xcoddup
		go top
		seek str(mcodigo,10)
                return .f.
        else
                @ 12,37 say substr(nome,1,40)
        endif
        sele 4
        set index to xcoddup
	go top
	seek str(mcodigo,10)
return .t.
func buscven()
        if lastkey()=5 .or. lastkey()=271
                return .t.
        endif
        sele 3
        seek str(mcodven,3)
        if eof()
                lisven()
        	sele 4
        	set index to xcoddup
		go top
		seek str(mcodigo,10)
                return .f.
        else
                @ 16,37 say substr(nome,1,40)
        endif
        sele 4
        set index to xcoddup
	go top
	seek str(mcodigo,10)
return .t.

func mens(acao)
   setcolor([N/w])
   @ 22,15 CLEAR TO 22,78
   if acao=-1 
        @ 22,15 SAY [Tecle <ESC> para Sair]
        set key 28 to
   elseif acao=0 
        @ 22,15 SAY [Tecle <ESC> para Cod. duplicata]
        set key 28 to
   elseif acao=1
        @ 22,15 SAY [Tecle <ESC> para Cod. duplicata | F1 - Clientes]
        set key 28 to liscli()
   elseif acao=2
        @ 22,15 SAY [Tecle <ESC> para Cod. duplicata | F1 - Bancos]
        set key 28 to lisban()
   else
        @ 22,15 SAY [Tecle <ESC> para Cod. duplicata | F1 - Representantes]
        set key 28 to lisven()
   endif
   setcolor([w+/b,d+/w])
return .t.

func datavenc()
        if lastkey()=5 .or. lastkey()=271
                return .t.
        endif
        if mdtvenc=ctod("  /  /  ") 
                return .f.
        endif
        if mdtvenc<mdtemissao
                setcolor([N/w])
                @ 22,15 CLEAR TO 22,78
                @ 22,15 SAY [Vencimento antes da emiss∆o.]
                return .f.
                setcolor([w+/b,d+/w])
        endif
return .t.
