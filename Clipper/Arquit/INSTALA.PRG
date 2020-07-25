set procedure to funcoes
setcolor([w+/bg+])
clear
lin=0
@ lin,00 say []
do while lin<25
   @ lin,col() say [W] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [o] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [r] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [l] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [d] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [  ]
   @ lin,col() say [I] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [n] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [f] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [o] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [r] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [m] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [ ] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [t] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [i] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [c] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [a] ; if col()>79 ; lin++ ; @ lin,00 say [] ; endif
   @ lin,col() say [   ]
enddo
quadro2(10,25,17,55)
boxshadow(10,25,17,55)
setcolor([n/r])
@ 12,26 say padc([Instala‡Æo de Sistema],29)
/*
if .not. file([c:\scs\scs.exe])
   ! md c:\scs
endif
*/
setcolor([w+/r])
@ 15,26 say padc([Copiando Arquivo: SCS.EXE],29)
copy file scs.exe to c:\scs\scs.exe
@ 15,26 say padc([Copiando Arquivo: SOCIO.DBF],29)
copy file socio.dbf to c:\scs\socio.dbf
inkey(.2)
@ 15,26 say padc([Copiando Arquivo: DEPEND.DBF],29)
copy file depend.dbf to c:\scs\depend.dbf
inkey(.2)
@ 15,26 say padc([Copiando Arquivo: PRESTACA.DBF],29)
copy file prestaca.dbf to c:\scs\prestaca.dbf
inkey(.2)
setcolor([w*+/r])
@ 15,26 say padc([Configurando o Sistema],29)
*copy file scs.cfg to c:\dos\ramdrive.ini
inkey(4)
setcolor([n/r])
@ 15,26 say padc([Sistema Instalado],29)
@ 20,00 say [ ]
quit



