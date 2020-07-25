TELvigs=SAVESCREEN(00,00,24,79)
setcolor([W+/B])
@ 04,01 say padc([C†lculo de Viga Apoiada em outra Viga pela NB-1/78],78)
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
   set cursor on
   stor 0 to mv, mq, ml, mb, mvs, mves, mvds
   setcolor([w+/b,GR+/B])
   @ 06,01 clear to 20,78
   @ 07,04 say [Qual Ç o n£mero desta Viga ?                      V=] get mv pict [@B 99] valid mv>0
   @ 09,04 say [Qual Ç a Carga sobre a Viga em Kg/m ?             q=] get mq pict [@EB 999,999] valid mq>0
   @ 11,04 say [Qual Ç o V∆o da Viga em metros ?                  L=] get ml pict [@B 99.99] valid ml>0
   @ 13,04 say [Qual a Carga Concentrada Transmitida p/Viga Sec.? P=] get mvs pict [@EB 999,999] valid mvs>0
   @ 15,04 say [Qual a Dist. do Apoio da Esq. atÇ a Viga Sec.?   A1=] get mves pict [@B 99.99] valid mves>0
   @ 17,04 say [Qual a Dist. do Apoio da Dir. atÇ a Viga Sec.?   B1=] get mvds pict [@B 99.99] valid mvds>0
   @ 19,04 say [Qual Ç a largura da base em metros ?              b=] get mb pict [@B 9.99] valid mb>0
   READ
   IF LASTKEY()=27
      EXIT
   ENDIF
   ml=(ml*1.05)
   mfor=((mq*ml)/2)
   mt=(mq*mves)/2
   mu=(mq*mvds)/2
   mn=mt+mvs+mu
   mm=((mn*mves*mvds)/ml)*1.4
*
*   mmom=((mq*(ml*ml))/8)*1.4
*
   if mm<=0
      @ 22,15 CLEAR TO 22,77
      setcolor([n/bg+])
      tone(1000,2) ; tone(500,2) ; setcursor(0)
      @ 22,15 SAY [Momento Fletor igual a 0. Pressione Algo...]
      inkey(0)
      loop
   endif
   malt=sqrt((.032*mm)/mb)
   mb=mb*100
   if malt>150
      @ 22,15 CLEAR TO 22,77
      setcolor([n/bg+])
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
   if mestribo>20
      mestribo=20
   endif
   mbraco=(malt-3)*.749
   mftran=(mfor/(mbraco*4348))*100
   mflong=mm/(32.55*malt)
   mfpele=mb*(malt)*.0005
   malt=malt+3
   mpestri=mftran*.4
   mfdob=(mftran-mpestri)/.9899
   mb=mb/100
   ml=ml/1.05
*****************************************
   @ 06,01 clear to 20,78
   setcolor([gr+/B])
   @ 06,09 say padc([Resultados dos C†lculos],63)
   set device to print
   set print on
   set print to vigas.cal
   @ 01,01 say [O n£mero desta viga Ç:                 V ]+transform(mv,[99])
   @ 02,01 say [O Aáo ser†  CA-50 A.                   Fyd=    4348 Kg/cm2]
   @ 03,01 say [O concreto de Resistància M°nima ser†: FcK=     150 Kg/cm2]
   @ 04,01 say [A Carga sobre a Viga Ç:                  q= ]+transform(mq,[@E 999,999])+[ Kg/m]
   @ 05,01 say [A Foráa Cortante M†xima Ç:              vd= ]+transform(mfor,[@E 999,999])+[ Kg]
   @ 06,01 say [O Momento Fletor M†ximo Ç:              md= ]+transform(mm,[@E 999,999])+[ Kg.m]
   @ 07,01 say [O v∆o da Viga Ç:                         l= ]+transform(ml,[@E   99.99])+[ m]
   @ 08,01 say [A Largura da Base da Viga Ç:             b= ]+transform(mb,[@E    9.99])+[ m]
   @ 09,01 say [O Ferro Longitudinal ser†:              As= ]+transform(mflong,[@E  999.99])+[ cm2]
   @ 10,01 say [O Estribo M°nimo:                       Ae= ]+transform(mpestri,[@E  999.99])+[ cm2]
   @ 11,01 say [O Ferro Dobrado usado com Estribo M°n.  Ad= ]+transform(mfdob,[@E  999.99])+[ cm2]
   @ 12,01 say [O Ferro de Armaá∆o superior ser†:       Ar=    1,00 cm2]
   @ 13,01 say [A Altura M°nima da Viga ser†:            h= ]+transform(malt,[@E  999])+[,00 cm]
   @ 14,01 say [A µrea de Ferro Transversal ser†:      Asw= ]+transform(mftran,[@E  999.99])+[ cm2]
   @ 15,01 say [O Espaáamento do Estribo ser†:           e= ]+transform(mestribo,[@E  999.9])+[0 cm]
   @ 16,01 say [A µrea dos Ferros de Pele Ç:           Asp= ]+transform(mfpele,[@E  999.99])+[ cm2]
   @ 17,01 say [O Espaáamento de Pele Ç:               Esp= ]+transform(mesppel,[@E  999.9])+[0 cm]
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