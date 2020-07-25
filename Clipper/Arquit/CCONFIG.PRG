TELvigs=SAVESCREEN(00,00,24,79)
setcolor([W+/B])
@ 04,01 say padc([Configarador de Valores para C lculos],78)
*quadro3(06,08,20,72)
** boxshadow(06,08,20,72)
@ 06,01 clear to 20,78
setcolor([w+/GB+])
@ 05,02 TO 05,77
setcolor([N/W])
@ 22,02 CLEAR TO 22,77
@ 22,01 say [Mensagens ->]
do while .T.
   setcolor([N/W])
   @ 22,15 CLEAR TO 22,77
   @ 22,15 SAY [Tecle <ESC> para Sair...]
   sele 3
   set cursor on
   MALTE=[N]
   stor 0 TO mtab, mcoef, mtaco, malong, mrconc, mencur, mvavi, mmu1
   stor 0 to mmu2, mdfor, mdmom, mccon, mcaco, mdmomx
   macole=[A]
   setcolor([w+/b,GR+/b])
   @ 06,01 clear to 20,78
   @ 06,04 say [Tabela de Seguran‡a No.] get mtab pict [9999] valid mtab>0
     read
     if lastkey()=27
        exit
     endif
     seek mtab
     if found()
        MCOEF=COEF ; MTACO=TIPOACO ; MALONG=ALONG ; MRCONC=RESIST ; MENCUR=ENCURT
        mvavi=cvaovi ; macole=acole ; mmu1=mu1 ; mmu2=mu2 ; mdfor=dfor ; mdmom=dmom
        mccon=ccon ; mcaco=caco ; mdmomx=dmomx
        @ 08,04 say [Qual o Coef. do VÆo da Viga              yv=] get mvavi pict [@E 9.99]
        @ 09,04 say [Qual o Coef. de Seg. M.f e da V.c.       yf=] get mcoef pict [@E 9.99]
        @ 10,04 say [Qual o Coef. de Minora‡Æo do A‡o         Yf=] get mcaco pict [@E 9.99]
        @ 11,04 say [Qual o Coef. de Minora‡Æo do Concreto    Yc=] get mccon pict [@E 9.99]
        @ 12,04 say [Qual o Coef. 1§ do C lc. de MU (æ)       æ1=] get mmu1 pict [@E 9.999]
        @ 13,04 say [Qual o Coef. 2§ do C lc. de MU (æ)       æ2=] get mmu2 pict [@E 9.999]
        @ 14,04 say [Qual ‚ o Tipo do A‡o CA-....             CA=] get mtaco pict [@E 99]
        @ 14,53 get macole pict [@!]
        @ 15,04 say [Qual o Alongamento M ximo do A‡o        Eyd=] get malong pict [@E 9.99]
        @ 16,04 say [Qual a Resistˆncia do Concreto          FcK=] get mrconc pict [@E 999]
        @ 17,04 say [Qual o Encurtamento M ximo do Concreto  Ecd=] get mencur pict [@E 9.99]
        @ 18,04 say [Denominador da For‡a Cortante          V/..=] get mdfor pict [@E 99]
        @ 19,04 say [Denominador do Momento Fletor          M/..=] get mdmom pict [@E 99]
        @ 20,04 say [Denominador do Mom. Negat. do Engaste  X/..=] get mdmomx pict [@E 99]
        clear gets
          setcolor([N/W])
        @ 22,15 CLEAR TO 22,78
          setcolor([n/w,gr+/w])
          tone(1000,2) ; tone(500,2)
        @ 22,15 SAY [Tabela de Seguran‡a j  existente...]
        @ 22,52 PROMPT [Alterar]
        @ 22,61 PROMPT [Excluir]
          menu to tab
          do case
             case tab=1
                  malte=[S]
             case tab=2
                  sele 2
                  locate for tabv=mtab
                  if found()
                     setcolor([N/W])
                     @ 22,15 CLEAR TO 22,78
                     tone(1000,2) ; tone(500,2) ; setcursor(0)
                     @ 22,15 SAY [Tabela sendo Usada nos C lculos de Viga.  Pressione Algo...]
                       inkey(0)
                       loop
                  endif
                  sele 3
                  dele
                  commit
                  loop
             case tab=0
                  loop
         endcase
     endif
   setcolor([w+/b,GR+/b])
   @ 08,04 say [Qual o Coef. do VÆo da Viga              yv=] get mvavi pict [@E 9.99] valid mvavi>0
   @ 09,04 say [Qual o Coef. de Seg. M.f e da V.c.       yf=] get mcoef pict [@E 9.99] valid mcoef>0 .and. mcoef<=3
   @ 10,04 say [Qual o Coef. de Minora‡Æo do A‡o         Yf=] get mcaco pict [@E 9.99] valid mcaco>0
   @ 11,04 say [Qual o Coef. de Minora‡Æo do Concreto    Yc=] get mccon pict [@E 9.99] valid mccon>0
   @ 12,04 say [Qual o Coef. 1§ do C lc. de MU (æ)       æ1=] get mmu1 pict [@E 9.999] valid mmu1>0
   @ 13,04 say [Qual o Coef. 2§ do C lc. de MU (æ)       æ2=] get mmu2 pict [@E 9.999] valid mmu2>0
   @ 14,04 say [Qual ‚ o Tipo do A‡o CA-....             CA=] get mtaco pict [@E 99] valid mtaco>=10 .and. mtaco<=60
   @ 14,53 get macole pict [@!] valid macole#space(1)
   @ 15,04 say [Qual o Alongamento M ximo do A‡o        Eyd=] get malong pict [@E 9.99] valid malong>0
   @ 16,04 say [Qual a Resistˆncia do Concreto          FcK=] get mrconc pict [@E 999] valid mrconc>0
   @ 17,04 say [Qual o Encurtamento M ximo do Concreto  Ecd=] get mencur pict [@E 9.99] valid mencur>0
   @ 18,04 say [Denominador da For‡a Cortante          V/..=] get mdfor pict [@E 99] valid mdfor>0
   @ 19,04 say [Denominador do Momento Fletor          M/..=] get mdmom pict [@E 99] valid mdmom>0
   @ 20,04 say [Denominador do Mom. Negat. do Engaste  X/..=] get mdmomx pict [@E 99]
   READ
   IF LASTKEY()=27
      loop
   ENDIF
   grava()
   if mopcao#[S]
      loop
   endif
   IF MALTE#[S]
      APPEND BLANK
   ENDIF
   REPLA TABE WITH MTAB, COEF WITH MCOEF, TIPOACO WITH MTACO
   REPLA ALONG WITH MALONG, RESIST WITH MRCONC, ENCURT WITH MENCUR
   repla cvaovi with mvavi, acole with macole
   repla mu1 with mmu1, mu2 with mmu2, dfor with mdfor, dmom with mdmom
   repla ccon with mccon, caco with mcaco, dmomx with mdmomx
   COMMIT
ENDDO
RESTSCREEN(00,00,24,79,TELvigs)
RETURN
