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
   @ 09,04 say [Qual Ç o n£mero desta Viga ?          V=]
   @ 11,04 say [Tabela de Seguranáa No.]
   @ 13,04 say [Qual Ç a Carga sobre a Viga em Kg/m ? q=]
   @ 15,04 say [Qual Ç o V∆o da Viga em metros ?      L=]
   @ 17,04 say [Qual Ç a largura da base em metros ?  b=]
   @ 07,04 say [Cadastro No.:] get mcod pict [@E 9,999] valid mcod>0
     read
     IF LASTKEY()=27
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
   stor 0 to mv, mq, ml, mb, MTAB
   setcursor(1)
   malte=[S] ; mgrav=[N]
   sele 2
   go top
   setcolor([w+/b,GR+/b])
   @ 11,04 say [Tabela de Seguranáa No.                 ]
   @ 13,04 say [Qual Ç a Carga sobre a Viga em Kg/m ? q=               ]
   @ 15,04 say [Qual Ç o V∆o da Viga em metros ?      L=               ]
   @ 17,04 say [Qual Ç a largura da base em metros ?  b=               ]
   @ 09,04 say [Qual Ç o n£mero desta Viga ?          V=] get mv pict [@B 99] valid mv>0
     read
     IF LASTKEY()=27
        EXIT
     ENDIF
     seek STR(mcod,4)+STR(mv,2)
     if found()
        mtab=tabv ; mq=q ; ml=l ; mb=b
        setcolor([w+/b,GR+/b])
        @ 11,04 say [Tabela de Seguranáa No.] get mtab pict [9999]
        @ 13,04 say [Qual Ç a Carga sobre a Viga em Kg/m ? q=] get mq pict [@EB 999,999]
        @ 15,04 say [Qual Ç o V∆o da Viga em metros ?      L=] get ml pict [@B 99.99]
        @ 17,04 say [Qual Ç a largura da base em metros ?  b=] get mb pict [@B 9.99]
          clear gets
        setcolor([n/w,gr+/w])
        @ 22,15 CLEAR TO 22,78
        tone(1000,2) ; tone(500,2)
        @ 22,15 SAY [Viga j† Cadastrada...]
        @ 22,40 PROMPT [Alterar]
        @ 22,49 PROMPT [Excluir]
        @ 22,58 prompt [Calcular]
          menu to tab
          do case
             case tab=1
                  malte=[S] ; mgrav=[S]
             case tab=2
                  dele
                  commit
                  loop
             case tab=3
                  malte=[C]
                  sele 3
                  seek mtab
                  if found()
                     MCOEF=COEF ; MTACO=TIPOACO ; MALONG=ALONG ; MRCONC=RESIST ; MENCUR=ENCURT
                     mvavi=cvaovi ; macole=acole ; mmu1=mu1 ; mmu2=mu2 ; mdfor=dfor ; mdmom=dmom
                     mccon=ccon ; mcaco=caco
                   ELSE
                     setcolor([n/w])
                     @ 22,15 CLEAR TO 22,78
                     tone(1000,2) ; tone(500,2) ; SETCURSOR(0)
                     @ 22,15 SAY [Tabela de Seguranáa n∆o existente...  Pressione Algo.]
                       inkey(0)
                       loop
                  endif
             case tab=0
                  loop

         endcase

     endif
   SELE 3
 if malte=[S]
   set key 28 to listab()
   SETCOLOR([n/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> p/retornar ao Campo Acima ≥ <F1> p/Lista de Tabelas]
   setcolor([w+/b,GR+/b])
   @ 11,04 say [Tabela de Seguranáa No.] get mtab pict [9999] valid mtab>0
     read
     IF LASTKEY()=27
        loop
     ENDIF
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
   set key 28 to
   setcolor([n/w])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para retornar ao campo N. VIGA]
   setcolor([w+/b,GR+/b])
   @ 13,04 say [Qual Ç a Carga sobre a Viga em Kg/m ? q=] get mq pict [@EB 999,999] valid mq>0
   @ 15,04 say [Qual Ç o V∆o da Viga em metros ?      L=] get ml pict [@B 99.99] valid ml>0
   @ 17,04 say [Qual Ç a largura da base em metros ?  b=] get mb pict [@B 9.99] valid mb>0
   READ
   IF LASTKEY()=27
      LOOP
   ENDIF
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
   MTELA=SAVESCREEN(06,01,20,78)
   if malte#[C]
      setcolor([n/w])
      @ 22,15 CLEAR TO 22,78
      @ 22,15 SAY [ -> Movimentaá∆o do Cursor ≥ Esc -> Grava]
    else
      setcolor([n/w])
      @ 22,15 CLEAR TO 22,78
      @ 22,15 SAY [ -> Movimentaá∆o do Cursor ≥ Esc -> Sair]
   endif
   setcolor([w+/b,GR+/b])
   @ 06,01 clear to 20,78
   setcolor([gr+/B])
   @ 06,09 say padc([Resultados dos C†lculos],63)
   set device to print
   set print on
   set print to vigas.cal
   @ 00,00 say [ ]
   @ 00,01 say [O n£mero desta viga Ç:                  V ]+transform(mv,[99])
   @ 01,01 say [O Aáo ser†  CA-]+str(mtaco,2)+[ ]+macole+[.                    Fyd= ]+str(cc,4)+[ Kg/cm2]
   @ 02,01 say [O concreto de Resistància M°nima ser†:  FcK=  ]+str(mrconc,3)+[ Kg/cm2]
   @ 03,01 say [A Carga sobre a Viga Ç:                   q= ]+transform(mq,[@E 999,999])+[ Kg/m]
   @ 04,01 say [A Foráa Cortante M†xima Ç:               vd= ]+transform(mfor,[@E 999,999])+[ Kg]
   @ 05,01 say [O Momento Fletor M†ximo Ç:               md= ]+transform(mmom,[@E 999,999])+[ Kg.m]
   @ 06,01 say [O Momento Negativo no Engaste Ç:         Xd= ]+transform(mmomx,[@E 999,999])+[ Kg.m]
   @ 07,01 say [O v∆o da Viga Ç:                          l= ]+transform(ml,[@E   99.99])+[ m]
   @ 08,01 say [A Largura da Base da Viga Ç:              b= ]+transform(mb,[@E    9.99])+[ m]
   @ 09,01 say [A Altura M°nima da Viga ser†:          h.mi= ]+transform(malt,[@E  999])+[,00 cm]
   @ 10,01 say [O Ferro Negativo no Engaste Ç:           Xe= ]+transform(mflongx,[@E  999.99])+[ cm2]
   @ 11,01 say [O Ferro Longitudinal ser†:               As= ]+transform(mflong,[@E  999.99])+[ cm2]
   @ 12,01 say [O Ferro de Armaá∆o superior ser†:      F.ar= ]+transform(ss,[@E   99.99])+[ cm2]
   @ 13,01 say [O Ferro Trans. Estribos Total ser†:     Asw= ]+transform(mftran,[@E  999.99])+[ cm2]
   @ 14,01 say [O Espaáamento do Estribo ser†:         E.Et= ]+transform(mestribo,[@E  999.9])+[0 cm]
   @ 15,01 say [O Estribo M°n. usado com Ferro Dobrado E.mi= ]+transform(mpestri,[@E  999.99])+[ cm2]
   @ 16,01 say [O Ferro Dobrado usado com Estribo M°n. F.do= ]+transform(mfdob,[@E  999.99])+[ cm2]
   @ 17,01 say [O Ferro de Pele Ç:                      Asp= ]+transform(mfpele,[@E  999.99])+[ cm2]
   @ 18,01 say [O Espaáamento de Pele Ç:               E.pe= ]+transform(mesppel,[@E  999.9])+[0 cm]
   @ 00,00 say [ ]
   set print to
   set print off
   set device to screen
   set cursor off
   setcolor([W+/B])
   memoedit(memoread("vigas.cal"),08,09,19,71,.f.)
   FErase([vigas.cal])
  if malte#[C]
    grava()
    if mopcao#[S]
       RESTSCREEN(06,01,20,78,MTELA)
       loop
    endif
    sele 2
    if mgrav#[S]
       append blank
    endif
    repla codiv with mcod, v with mv, tabv with mtab, q with mq
    repla l with ml, b with mb
    commit
  endif
   RESTSCREEN(06,01,20,78,MTELA)
   loop
 enddo
 loop
ENDDO
set key 28 to
RESTSCREEN(00,00,24,79,TELvigs)
RETURN
