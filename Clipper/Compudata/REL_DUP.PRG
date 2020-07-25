TELvigs=SAVESCREEN(00,00,24,79)
setcolor([W+/B])
@ 04,01 say padc([Duplicatas em aberto],78)
@ 06,01 clear to 20,78
setcolor([w+/GB+])
@ 05,02 TO 05,77
setcolor([n/w])
@ 22,02 CLEAR TO 22,78
@ 22,01 say [Mensagens ->]
set device to screen
ll=1
pag=1
virou=.t.
SELE 4
SET INDEX TO XVENCBAN
 go top
 do while .t.
   *****************************************
   do while .t.
      setcolor([n/w])
      @ 22,15 CLEAR TO 22,78
      @ 22,15 SAY [Aguarde !!!  Imprimindo pagina ]+strzero(pag,3)+[...]
      set device to print
      if .not. isprinter()
          set device to screen
          setcolor([N/W])
          @ 22,15 clear to 22,77
          tone(1000,2) ; tone(500,2) ; setcursor(0)
          @ 22,15 say [Impressora Desligada !!!  <l p/Continuar ou <Esc> p/Cancelar]
          inkey(0)
          if lastkey()=27
             exit
          endif
          loop
       endif
       exit
    enddo
    if lastkey()=27
       eject
       exit
    endif
    if (pag=1) .and. (virou)
     @ ll,02 say [Aluno: Marcius Carneiro Bezerra]
     @ ll,47 say [Intituto Tecnol¢gico COMPUDATA]
     ll++
     @ ll,02 SAY [Curso: Dbase / Clipper]
     @ ll,55 SAY DATA2()
     ll+=2
    endif
    if virou
     @ ll,01 say [R E L A C A O   D E   D U P L I C A T A S   E M   A B E R T O]
     ll+=2
     @ ll,01 SAY [    Codigo]+space(1)+[Cliente]+space(34)+[Vencimento]+space(5)+[Montante]
     ll++
     @ ll,01 say replic([-],80)
     ll++
    endif
     CL = space(40)
     cod=codigo
     CC=CodCli
     SELE 1
     set index to XCODCLI
     go top
     seek CC
     if found()
	cl=nome
     else
	cl=[Consumidor]+space(30)
     endif
     SELE 4
     SET INDEX TO XVENCBAN
     go top
     locate for codigo = cod
     if DtPag=ctod("  /  /  ")
      @ ll,01 SAY Codigo+space(1)+cl+space(1)
      @ ll,53 SAY DtVenc
      @ ll,63 SAY Valor
      ll++
     endif
     skip(1)
     if (mod(ll,55)=0) .or. (eof()) 
       if eof()
        @ ll+4,01 say padc([Pagina ]+strzero(pag,3)+[ (Fim de relatorio)],78)
        eject
        exit 
       else
        @ ll+4,01 say padc([Pagina ]+strzero(pag,3),78)
       endif
       pag++
       ll=1
       virou=.t.
       eject
     else
       virou=.f.
     endif
   set device to screen
   loop
 enddo
set key 28 to
set device to screen
set print off
RESTSCREEN(00,00,24,79,TELvigs)
RETURN