TELvigs=SAVESCREEN(00,00,24,79)
setcolor([W+/B])
@ 04,01 say padc([C†lculo de Viga Simples pela NB-1/78],78)
*quadro3(06,08,20,72)
** boxshadow(06,08,20,72)
@ 06,01 clear to 20,78
setcolor([w+/GB+])
@ 05,02 TO 05,77
setcolor([n/w])
@ 22,02 CLEAR TO 22,78
@ 22,01 say [Mensagens ->]
ll=1
do while .T.
   sele 1
   go top
   SETCOLOR([n/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para Sair ≥ F1 -> Lista de Cadastros]
   set cursor on
   set key 28 to liscad()
   mcod=0
   setcolor([w+/b,GR+/b])
   @ 06,01 clear to 20,78
   @ 09,04 say [Imprimir Viga de      a       ]
   @ 07,04 say [Cadastro No.:] get mcod pict [@E 9,999] valid mcod>0
     read
     IF LASTKEY()=27
        if ll>1
           set device to print
           IF ISPRINTER()
              eject
           ENDIF
           set device to screen
        endif
        EXIT
     ENDIF
   set key 28 to
   seek mcod
   if found()
      mnome=clien
      @ 07,25 say [ ] get mnome pict [@!]
        clear gets
    else
      SETCOLOR([n/w])
      @ 22,15 CLEAR TO 22,78
        tone(1000,2) ; tone(500,2) ; setcursor(0)
      @ 22,15 SAY [Cliente n∆o Cadastrado.   Pressione Algo...]
        inkey(0)
        loop
   endif
 do while .t.
   SETCOLOR([n/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para retornar ao Campo Cadastro No.]
   setcursor(1)
   stor 0 to mnum1, mnum2
   sele 2
   go top
   setcolor([w+/b,GR+/b])
   @ 09,04 say [Imprimir Viga de] get mnum1 pict [99] valid mnum1>0
   @ 09,26 say [a] get mnum2 pict [99] valid mnum2>0
     read
     IF LASTKEY()=27
        EXIT
     ENDIF
     mv=mnum1
     impri()
     if mopimp#[S]
        exit
     endif
   do while .t.
      sele 2
      if mv>mnum2
         exit
      endif
     seek STR(mcod,4)+STR(mv,2)
     if found()
        mtab=tabv ; mq=q ; ml=l ; mb=b
        sele 3
        seek mtab
        if found()
           MCOEF=COEF ; MTACO=TIPOACO ; MALONG=ALONG ; MRCONC=RESIST ; MENCUR=ENCURT
           mvavi=cvaovi ; macole=acole ; mmu1=mu1 ; mmu2=mu2 ; mdfor=dfor ; mdmom=dmom
           mccon=ccon ; mcaco=caco
          ELSE
           setcolor([n/w])
           @ 22,15 CLEAR TO 22,78
           tone(1000,2) ; tone(500,2) ; setcursor(0)
           @ 22,15 SAY [Tabela de Seguranáa n∆o existente...  Pressione Algo.]
             inkey(0)
             loop
        endif
      else
       mv++
       loop
     endif
   setcolor([n/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Aguarde !!!  Calculando. . .]
   ml=(ml*mvavi)
   fd=mrconc/mccon
   cc=mtaco*100/mcaco
   s=mmu1*(mencur/(mencur+malong))*(1-(mmu2*(mencur/(mencur+malong))))
   c=s/(mmu1*(mencur/(mencur+malong)))
   r=sqrt(1/(s*fd))
   mfor=((mq*ml)/dfor)*mcoef
   mmom=((mq*(ml*ml))/dmom)*mcoef
   if mmom<=0
      @ 22,15 CLEAR TO 22,78
      setcolor([n/w])
      tone(1000,2) ; tone(500,2) ; setcursor(0)
      @ 22,15 SAY [Momento Fletor igual a 0. Pressione Algo...]
      inkey(0)
      loop
   endif
   mmomx=((mq*(ml*ml))/dmomx)*mcoef
   malt=sqrt(((r*r)*mmom)/mb)
   mb=mb*100
   if malt>150
      @ 22,15 CLEAR TO 22,78
      setcolor([n/w])
      tone(1000,2) ; tone(500,2) ; setcursor(0)
      @ 22,15 SAY [Altura m†xima da viga Ç 1,50m. Pressione Algo...]
      inkey(0)
      loop
   endif
   if malt<20
      mesppel=malt/2
    elseif malt>20 .and. malt<40
      mesppel=malt/2
    elseif malt>40 .and. malt<60
      mesppel=malt/3
    elseif malt>60 .and. malt<80
      mesppel=malt/4
    elseif malt>80 .and. malt<100
      mesppel=malt/5
    elseif malt>100 .and. malt<120
      mesppel=malt/6
    elseif malt>120 .and. malt<140
      mesppel=malt/7
   endif
   mestribo=malt/2
   if mestribo>20
      mestribo=20
   endif
   mbraco=(malt*c)
   mftran=(mfor/(mbraco*cc))*100
   mflong=mmom/(c*cc*malt/100)
   mflongx=mmomx/(c*cc*malt/100)
   mfpele=mb*(malt)*.0005
   malt=malt+3
   mpestri=mftran*.4
   mfdob=(mftran-mpestri)/.9899
   mb=mb/100
   ml=ml/mvavi
   ss=.30*mflong
   mmomx=mmomx*(-1)
   *****************************************
   do while .t.
      setcolor([n/w])
      @ 22,15 CLEAR TO 22,78
      @ 22,15 SAY [Aguarde !!!  Imprimindo. . .]
      set device to print
      if .not. isprinter()
          set device to screen
          setcolor([N/W])
          @ 22,15 clear to 22,77
          tone(1000,2) ; tone(500,2) ; setcursor(0)
          @ 22,15 say [Impressora Desligada !!!  <ƒº p/Continuar ou <Esc> p/Cancelar]
          inkey(0)
          if lastkey()=27
             exit
          endif
          loop
       endif
       exit
    enddo
    if lastkey()=27
       exit
    endif
     setcolor([b/x])
   @ ll,01 say [C†lculos de Engenharia Civil]
   @ ll,50 say [Data: ]+dtoc(date())
     ll++
   @ ll,01 say [Relat¢rio de Vigas Simples pela NB 1/78]
     ll++
   @ ll,01 say replic([-],70)
     ll++
   @ ll,01 say [Cadastro: ]+strzero(mcod,4)
   @ ll,20 say [Cliente: ]+mnome
     ll+=2
   @ ll,01 say [O n£mero desta viga Ç:                  V ]+transform(mv,[99])
     ll++
   @ ll,01 say [O Aáo ser†  CA-]+str(mtaco,2)+[ ]+macole+[.                    Fyd= ]+str(cc,4)+[ Kg/cm2]
     ll++
   @ ll,01 say [O concreto de Resistància M°nima ser†:  FcK=  ]+str(mrconc,3)+[ Kg/cm2]
     ll++
   @ ll,01 say [A Carga sobre a Viga Ç:                   q= ]+transform(mq,[@E 999,999])+[ Kg/m]
     ll++
   @ ll,01 say [A Foráa Cortante M†xima Ç:               vd= ]+transform(mfor,[@E 999,999])+[ Kg]
     ll++
   @ ll,01 say [O Momento Fletor M†ximo Ç:               md= ]+transform(mmom,[@E 999,999])+[ Kg.m]
     ll++
   @ ll,01 say [O Momento Negativo no Engaste Ç:         Xd= ]+transform(mmomx,[@E 999,999])+[ Kg.m]
     ll++
   @ ll,01 say [O v∆o da Viga Ç:                          l= ]+transform(ml,[@E   99.99])+[ m]
     ll++
   @ ll,01 say [A Largura da Base da Viga Ç:              b= ]+transform(mb,[@E    9.99])+[ m]
     ll++
   @ ll,01 say [A Altura M°nima da Viga ser†:          h.mi= ]+transform(malt,[@E  999])+[,00 cm]
     ll++
   @ ll,01 say [O Ferro Negativo no Engaste Ç:           Xe= ]+transform(mflongx,[@E  999.99])+[ cm2]
     ll++
   @ ll,01 say [O Ferro Longitudinal ser†:               As= ]+transform(mflong,[@E  999.99])+[ cm2]
     ll++
   @ ll,01 say [O Ferro de Armaá∆o superior ser†:      F.ar= ]+transform(ss,[@E   99.99])+[ cm2]
     ll++
   @ ll,01 say [O Ferro Trans. Estribos Total ser†:     Asw= ]+transform(mftran,[@E  999.99])+[ cm2]
     ll++
   @ ll,01 say [O Espaáamento do Estribo ser†:         E.Et= ]+transform(mestribo,[@E  999.9])+[0 cm]
     ll++
   @ ll,01 say [O Estribo M°n. usado com Ferro Dobrado E.mi= ]+transform(mpestri,[@E  999.99])+[ cm2]
     ll++
   @ ll,01 say [O Ferro Dobrado usado com Estribo M°n. F.do= ]+transform(mfdob,[@E  999.99])+[ cm2]
     ll++
   @ ll,01 say [O Ferro de Pele Ç:                      Asp= ]+transform(mfpele,[@E  999.99])+[ cm2]
     ll++
   @ ll,01 say [O Espaáamento de Pele Ç:               E.pe= ]+transform(mesppel,[@E  999.9])+[0 cm]
     ll++
   @ ll,01 say replic([-],70)
     ll+=5
   if ll>55
      eject
   endif
   set device to screen
   mv++
  enddo
   loop
 enddo
 loop
ENDDO
set key 28 to
RESTSCREEN(00,00,24,79,TELvigs)
RETURN
