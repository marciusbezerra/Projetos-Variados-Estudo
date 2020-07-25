TELvigs=SAVESCREEN(00,00,24,79)
setcolor([W+/B])
@ 04,01 say padc([C†lculo de Viga Dupla pela NB-1/78],78)
*quadro3(06,08,20,72)
** boxshadow(06,08,20,72)
@ 06,01 clear to 20,78
setcolor([w+/bg+])
@ 05,02 TO 05,77
@ 22,02 CLEAR TO 22,77
@ 22,01 say [Mensagens ->]
do while .T.
   SETCOLOR([X/BG+])
   @ 22,15 CLEAR TO 22,77
   @ 22,15 SAY [Tecle <ESC> para Sair...]
   stor 0 to mv, mq, ml, mb, md
   setcolor([w+/b,GR+/b])
   @ 06,01 clear to 20,78
   set cursor on
   @ 08,04 say [Qual Ç o n£mero desta Viga ?           V=] get mv pict [@B 99] valid mv>0
     READ
     IF LASTKEY()=27
        EXIT
     ENDIF
   SELE 3
   set key 28 to listab()
   MTAB=0
   SETCOLOR([X/BG+])
   @ 22,15 CLEAR TO 22,77
   @ 22,15 SAY [Tecle <ESC> para Sair ≥ <F1> para Lista de Tabelas]
   setcolor([w+/b,GR+/b])
   @ 10,04 say [Tabela de Seguranáa No.] get mtab pict [9999] valid mtab>0
     read
     IF LASTKEY()=27
        EXIT
     ENDIF
     seek mtab
     if found()
        MCOEF=COEF ; MTACO=TIPOACO ; MALONG=ALONG ; MRCONC=RESIST ; MENCUR=ENCURT
        mvavi=cvaovi ; macole=acole ; mmu1=mu1 ; mmu2=mu2 ; mdfor=dfor ; mdmom=dmom
        mccon=ccon ; mcaco=caco ; mdmomx=dmomx
       ELSE
          setcolor([x/bg+])
        @ 22,15 CLEAR TO 22,78
        tone(1000,2) ; tone(500,2) ; setcursor(0)
        @ 22,15 SAY [Tabela de Seguranáa n∆o existente...  Pressione Algo.]
          inkey(0)
          loop
     endif
   set key 28 to
   setcolor([x/bg+])
   @ 22,15 CLEAR TO 22,78
   @ 22,15 SAY [Tecle <ESC> para retornar ao campo TABELA]
   setcolor([w+/b,GR+/b])
   @ 12,04 say [Qual Ç a Carga sobre a Viga em Kg/m ?  q=] get mq pict [@EB 999,999] valid mq>0
   @ 14,04 say [Qual Ç o V∆o da Viga em metros ?       L=] get ml pict [@B 99.99] valid ml>0
   @ 16,04 say [Qual Ç a largura da base em metros ?   b=] get mb pict [@B 9.99] valid mb>0
   @ 18,04 say [Qual Ç a nova altura da Viga em Cent.? d=] get md pict [@B 99.99] valid md>0
   READ
   IF LASTKEY()=27
      EXIT
   ENDIF
   ml=(ml*mvavi)
   fd=mrconc/mccon
   cc=mtaco*100/mcaco
   s=.68*(mencur/(mencur+malong))*(1-(.4*(mencur/(mencur+malong))))
   c=s/(.68*(mencur/(mencur+malong)))
   mfor=((mq*ml)/2)*mcoef
   mmom=((mq*(ml*ml))/8)*mcoef
   if mmom<=0
      @ 22,15 CLEAR TO 22,77
      setcolor([x/bg+])
      tone(1000,2) ; tone(500,2) ; setcursor(0)
      @ 22,15 SAY [Momento Fletor igual a 0. Pressione Algo...]
      inkey(0)
      loop
   endif
   malt=(MD-3)/100
   mb=mb*100
   if malt>150
      @ 22,15 CLEAR TO 22,77
      setcolor([x/bg+])
      tone(1000,2) ; tone(500,2) ; setcursor(0)
      @ 22,15 SAY [Altura m†xima da viga Ç 1,50m. Pressione Algo...]
      inkey(0)
      loop
   endif
   if malt<60
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
   mestribo=malt*100
   if mestribo>20
      mestribo=20
   endif
   mbraco=(malt*c)
   mftran=(mfor/(mbraco*cc))
   mfpele=mb*(malt*100)*.0005
   mpestri=mftran*.4
   mfdob=(mftran-mpestri)/.9899
   mb=mb/100
   ml=ml/mvavi
   malt=(malt*100)
   mmom1=(S*MB*(MALT*MALT))*FD
   mp=mmom-mmom1
   mresi=mp/((MALT/100)-.03)
   mftrac=MP/(C*CC*(MALT/100))+MRESI/CC
   mfcomp=mresi/CC
   MALT=MALT+3
   ****************************
   @ 06,01 clear to 20,78
   setcolor([gr+/B])
   @ 06,09 say padc([Resultados dos C†lculos],63)
   set device to print
   set print on
   set print to vigas.cal
   @ 01,01 say [O n£mero desta viga Ç:                 V ]+transform(mv,[99])
   @ 02,01 say [O Aáo ser†  CA-]+str(mtaco,2)+[ ]+macole+[.                    Fyd= ]+str(cc,4)+[ Kg/cm2]
   @ 03,01 say [O concreto de Resistància M°nima ser†:  FcK=  ]+str(mrconc,3)+[ Kg/cm2]
   @ 04,01 say [A Carga sobre a Viga Ç:                  q= ]+transform(mq,[@E 999,999])+[ Kg/m]
   @ 05,01 say [A Foráa Cortante M†xima Ç:              vd= ]+transform(mfor,[@E 999,999])+[ Kg]
   @ 06,01 say [O Momento Fletor M†ximo Ç:              md= ]+transform(mmom1,[@E 999,999])+[ Kg.m]
   @ 07,01 say [O v∆o da Viga Ç:                         l= ]+transform(ml,[@E   99.99])+[ m]
   @ 08,01 say [A Largura da Base da Viga Ç:             b= ]+transform(mb,[@E    9.99])+[ m]
   @ 09,01 say [A Altura M°nima da Viga ser†:            h= ]+transform(md,[@E  999])+[,00 cm]
   @ 10,01 say [A µrea de Ferro Transversal ser†:      Asw= ]+transform(mftran,[@E  999.99])+[ cm2]
   @ 11,01 say [O Espaáamento do Estribo ser†:        E.Et= ]+transform(mestribo,[@E    9999])+[ cm]
   @ 12,01 say [A µrea dos Ferros de Pele Ç:           Asp= ]+transform(mfpele,[@E  999.99])+[ cm2]
   @ 13,01 say [O Espaáamento de Pele Ç:              E.pe= ]+transform(mesppel,[@E  999.9])+[0 cm]
   @ 14,01 say [Ferros de Traá∆o                        As= ]+transform(mftrac,[@E 9999.99])+[ cm2]
   @ 15,01 say [Ferros de Compress∆o                   As'= ]+transform(mfcomp,[@E 9999.99])+[ cm2]
   @ 00,00 say [ ]
   set print to
   set print off
   set device to screen
   set cursor off
   setcolor([W+/B])
   memoedit(memoread("vigas.cal"),08,09,20,71,.f.)
   FErase([vigas.cal])
   loop
ENDDO
RESTSCREEN(00,00,24,79,TELvigs)
RETURN
