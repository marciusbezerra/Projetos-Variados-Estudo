TELcad=SAVESCREEN(00,00,24,79)
setcolor([W+/B])
@ 04,01 say padc([Alteraá∆o de Clientes],78)
**quadro3(06,01,20,78)
** boxshadow(06,08,20,72)
@ 06,01 clear to 20,78
setcolor([w+/GB+])
@ 05,01 TO 05,77
setcolor([N/w])
@ 22,02 CLEAR TO 22,78
@ 22,01 say [Mensagens ->]
set key 22 to ins()
SELE 1
go top
do while .T.
   setcolor([N/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para Sair ≥ F1 -> Lista de Cadastros]
   set cursor on
   set key 28 to liscad()
   mcod=0 ; mnome=space(50) ; mendr=space(50)
   mtelr=space(50) ; mobs=space(50)
   setcolor([w+/b,GR+/b])
   @ 06,01 clear to 20,78
   @ 10,03 say [Cliente     :] get mnome pict [@!]
   @ 12,03 say [Endereáo    :] get mendr pict [@!]
   @ 14,03 say [Telefone    :] get mtelr pict [@!]
   @ 16,03 say [Observaá‰es :] get mobs pict [@!]
     clear gets
   @ 08,03 say [Cadastro No.:] get mcod pict [@E 9,999] valid mcod>0
     read
     IF LASTKEY()=27
        EXIT
     ENDIF
   set key 28 to
   seek mcod
   if !found()
      setcolor([N/w])
      @ 22,15 CLEAR TO 22,78
        tone(1000,2) ; tone(500,2) ; setcursor(0)
      @ 22,15 SAY [Cliente n∆o Cadastrado.   Pressione Algo...]
        inkey(0)
        loop
   endif
   setcolor([N/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 say [Tecle <ESC> para retornar ao campo Cadastro No.]
   mnome=clien ; mendr=ender ; mtelr=teler ; mobs=obs
   setcolor([w+/b,GR+/b])
   @ 10,03 say [Cliente     :] get mnome pict [@!] valid mnome#space(40)
   @ 12,03 say [Endereáo    :] get mendr pict [@!]
   @ 14,03 say [Telefone    :] get mtelr pict [@!]
   @ 16,03 say [Observaá‰es :] get mobs pict [@!]
   READ
   IF LASTKEY()=27
      LOOP
   ENDIF
   grava()
   if mopcao#[S]
      loop
   endif
   repla codi with mcod, clien with mnome, ender with mendr
   repla teler with mtelr, obs with mobs
   commit
ENDDO
set key 22 to
set key 28 to
RESTSCREEN(00,00,24,79,TELcad)
RETURN
