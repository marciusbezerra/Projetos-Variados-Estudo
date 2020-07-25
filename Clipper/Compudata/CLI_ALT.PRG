TELcad=SAVESCREEN(00,00,24,79)
setcolor([W+/B])
@ 04,01 say padc([Cadastro de clientes],78)
*quadro3(06,01,20,78)
boxshadow(06,08,20,72)
@ 06,01 clear to 20,78
setcolor([w+/GB+])
@ 05,01 TO 05,77
setcolor([N/w])
@ 22,02 CLEAR TO 22,78
@ 22,01 say [Mensagens ->]
set key 22 to ins()
SELE 1
set index to xcodcli
go top
do while .T.
   setcolor([N/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para Sair]
   set cursor on
   mcodigo=0
   mnome=space(40)
   mendereco=space(40)
   mbairro=space(15)
   mcidade=space(20)
   mestado=space(2)
   mfone=space(15)
   mfax=space(15)
   mcgc=space(15)
   minscest=space(15)
   mdtcadastro=ctod("  /  /  ")
   setcolor([w+/b,d+/w])
   @ 06,01 clear to 20,78
   @ 09,03 say [Data cadastro....:] get mdtcadastro
   @ 10,03 say [Nome completo....:] get mnome
   @ 11,03 say [Endere‡o.........:] get mendereco
   @ 12,03 say [Bairro...........:] get mbairro
   @ 13,03 say [Cidade...........:] get mcidade
   @ 14,03 say [Estado...........:] get mestado
   @ 15,03 say [Fone.............:] get mfone 
   @ 16,03 say [Fax..............:] get mfax
   @ 17,03 say [C.G.C............:] get mcgc
   @ 18,03 say [Incri‡Æo estadual:] get minscest
     clear gets
   @ 7,03 say [Cod. cliente.....:] get mcodigo pict [9,999,999,999] valid mcodigo>0
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
        @ 22,15 SAY [Cliente nao cadastrado.   Pressione algo...]
        inkey(0)
        loop
   else
   	setcolor([N/w])
   	@ 22,15 CLEAR TO 22,78
   	@ 22,15 SAY [Tecle <ESC> para Cod. cliente]
   	setcolor([w+/b,d+/w])
        mnome=nome
        mendereco=endereco
        mbairro=bairro
        mcidade=cidade
        mestado=estado
        mfone=fone
        mfax=fax
        mcgc=cgc
        minscest=inscest
        mdtcadastro=dtcadastro
        @ 09,03 say [Data cadastro....:] get mdtcadastro valid mdtcadastro<>ctod("  /  /  ") when poedata()  
        @ 10,03 say [Nome completo....:] get mnome valid mnome<>space(40)
        @ 11,03 say [Endere‡o.........:] get mendereco
        @ 12,03 say [Bairro...........:] get mbairro
        @ 13,03 say [Cidade...........:] get mcidade
        @ 14,03 say [Estado...........:] get mestado
        @ 15,03 say [Fone.............:] get mfone 
        @ 16,03 say [Fax..............:] get mfax
        @ 17,03 say [C.G.C............:] get mcgc
        @ 18,03 say [Incri‡Æo estadual:] get minscest
   endif
   READ
   IF LASTKEY()=27
      LOOP
   ENDIF
   grava()
   if mopcao#[S]
      loop
   endif
   repla codigo with str(mcodigo,10)
   repla nome with mnome
   repla endereco with mendereco
   repla bairro with mbairro
   repla cidade with mcidade
   repla estado with mestado
   repla fone with mfone
   repla fax with mfax
   repla cgc with mcgc
   repla inscest with minscest
   repla dtcadastro with mdtcadastro
   commit
   mcodigo++
   iniciar=.t.
ENDDO
set key 22 to
RESTSCREEN(00,00,24,79,TELcad)
RETURN