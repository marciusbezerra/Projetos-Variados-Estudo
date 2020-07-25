TELMIT=SAVESCREEN(00,00,24,79)
setcolor([W+/g])
@ 04,01 say padc([Consulta de Demonstrativo Financeiro],78)
quadro(06,12,19,66)
@ 05,02 TO 05,77
boxshadow(06,12,19,66)
setcolor([w+/bg+])
@ 22,01 say [Mensagens ->]
sele 3
set order to 1
go top
do while .T.
   @ 22,15 CLEAR TO 22,77
   mmes=0 ; mano=0
   SETCOLOR([W+/BG+,RG+/B,,,RG+/BG+])
   @ 10,24 SAY [Mes->] GET Mmes PICT [99] VALID Mmes>0 .AND. MMES<13
   @ 10,34 say [Ano->] get mano pict [9999] valid mano>0
   READ
   IF LASTKEY()=27
      EXIT
   ENDIF
   mmes1=strzero(mmes,2) ; mano1=strzero(mano,4)
   @ 10,24 SAY [Mes->] GET Mmes1 PICT [99]
   @ 10,34 say [Ano->] get mano1 pict [9999]
   CLEAR GETS
   set cursor off
   SEEK MANO1+MMES1
   IF ! FOUND()
      tone(100,2)
      tone(1000,1)
      setcolor([n/gb+])
      set cursor off
      @ 22,15 SAY [Mes nao foi Encerrado. . .]
      inkey(.5)
      set cursor on
      LOOP
   ENDIF
IF MMES=1
   MMES2=[Janeiro]
elseif MMES=2
   MMES2=[Fevereiro]
elseif MMES=3
   MMES2=[Marco]
elseif MMES=4
   MMES2=[Abril]
elseif MMES=5
   MMES2=[Maio]
elseif MMES=6
   MMES2=[Junho]
elseif MMES=7
   MMES2=[Julho]
elseif MMES=8
   MMES2=[Agosto]
elseif MMES=9
   MMES2=[Setembro]
elseif MMES=10
   MMES2=[Outubro]
elseif MMES=11
   MMES2=[Novembro]
elseif MMES=12
   MMES2=[Dezembro]
endif
   mtc_mit=savescreen(00,00,24,79)
   SET CURSOR OFF
   setcolor([n/gb+])
   @ 22,15 SAY [Aguarde !!! Organizando Relatorio.]
   set order to 2
   reindex
   go top
   @ 22,15 SAY [Aguarde !!! Relatorio Sendo Impresso.]
   linha=9
   chav=0 ; VALORS=0 ; MREC=0 ; MDES=0
   set device to print
   set print on
   set print to c_mitra.txt
   @ 02,00 say padc([MITRA DIOCESANA DE ITAPIPOCA],76)
   @ 04,02 SAY [FILIAL: PAROQUIA SAO FRANCISCO DE ASSIS        C.G.C.: 07.440.969/0011-02]
   @ 06,02 say PADC([DEMONSTRATIVO FINACEIRO DO MES DE ]+MMES2+[ DE ]+MANO1,76)
   @ 08,02 say PADC([RECEITAS TRIBUTAVEIS A MITRA],76)
   DO WHILE .NOT. EOF()
      IF CONTAC#[03] .AND. CONTAC#[04] .AND. CONTAC#[17] .AND. CONTAC#[29] .AND. CONTAC#[48]
         @ linha,02 SAY CONTAC+[. ]+ALLTRIM(DESCC)+[ ]+ALLTRIM(COMPLEM)+REPLIC([.],(47-LEN(ALLTRIM(DESCC)+ALLTRIM(COMPLEM))))+[ R$]
       ELSEif contac#[17] .and. contac#[29] .and. contac#[48]
         @ linha,02 SAY CONTAC+[. ]+ALLTRIM(DESCC)+[ ]+ALLTRIM(COMPLEM)+REPLIC([.],(27-LEN(ALLTRIM(DESCC)+ALLTRIM(COMPLEM))))+[ R$]
       elseif (contac=[17] .and. scontac=[00])  .or. (contac=[29] .and. scontac=[00]) .or. (contac=[48] .and. scontac=[00])
         @ linha,02 SAY CONTAC+[. ]+ALLTRIM(DESCC)
         mcol=len(alltrim(descc))+7
       elseif (contac=[17] .and. scontac#[00]) .or. (contac=[48] .and. scontac#[00])
         @ linha,mcol SAY alltrim(DESCC)
       ELSEif (Contac=[29] .and. scontac#[00]) .OR. (Contac=[48] .and. scontac#[00])
         @ linha,mcol say ALLTRIM(DESCC)+[ ]+REPLIC([.],(10-LEN(ALLTRIM(DESCC))))+[ R$]
      ENDIF
      IF CONTAC#[03] .AND. CONTAC#[04] .AND. CONTAC#[17] .and. contac#[29] .and. contac#[48]
         IF VALORC>0
            @ LINHA,57 SAY VALORC PICT [@E 9,999,999.99]
          ELSE
            @ LINHA,65 SAY [-0-]
         ENDIF
        ELSE
       if (contac=[17] .AND. SCONTAc#[00]) .OR. (contac=[29] .and. scontac#[00]) .or. (contac=[48] .and. scontac#[00]) .or. (contac=[03]) .or. (contac=[04])
         IF VALORC>0
            @ LINHA,42 SAY VALORC PICT [@E 9,999,999.99]
          ELSE
            @ LINHA,50 SAY [-0-]
         ENDIF
        endif
            VALORS=VALORS+VALORC
         IF (CONTAC=[04]) .or. (contac=[17] .and. scontac=[03]) .or. (contac=[29] .and. scontac=[03]) .or. (contac=[48] .and. scontac=[04])
            @ LINHA,55 SAY [R$]
            IF VALORS>0
               @ LINHA,57 SAY VALORS PICT [@E 9,999,999.99]
              ELSE
               @ LINHA,65 SAY [-0-]
            ENDIF
            VALORS=0
        ENDIF
      ENDIF
      IF TIPOC=[R]
          MREC=MREC+VALORC
        ELSE
          MDES=MDES+VALORC
      ENDIF
      if contac#[17] .and. contac#[29] .and. contac#[48]
         linha=linha+1
        elseif (contac=[17].and.scontac#[00]) .or. (contac=[29].and.scontac#[00]) .or. (contac=[48].and.scontac#[00])
         linha=linha+1
      endif
      skip
      IF CONTAC=[05]
         LINHA=LINHA+1
         @ LINHA+1,02 say PADC([RECEITAS NAO TRIBUTAVEIS A MITRA],76)
         LINHA=LINHA+2
      ENDIF
      IF CONTAC=[21]
         @ LINHA+1,02 say PADL([T O T A L   D E   R E C E B I M E N T O S],55)
         @ LINHA+1,57 SAY MREC PICT [@E 9,999,999.99]
         LINHA=LINHA+4
         @ LINHA,02 say PADC([DESPESAS PAROQUIAIS],76)
         LINHA++
      ENDIF
   enddo
   @ LINHA+1,02 say PADL([T O T A L   D E   P A G A M E N T O S],55)
   @ LINHA+1,57 SAY MDES PICT [@E 9,999,999.99]
   SELE 5
   SEEK MANO1+MMES1
   IF ! FOUND()
      LINHA=LINHA+3
      @ LINHA+1,02 say PADC([DEMONSTRATIVO ECONOMICO],76)
      @ LINHA+2,02 SAY [SALDO ANTERIOR         R$]
      @ LINHA+2,38 SAY [-0-]
      @ LINHA+3,02 SAY [TOTAL DE RECEBIMENTOS  R$]
      if mrec>0
         @ LINHA+3,30 SAY MREC PICT [@E 9,999,999.99]
       else
         @ LINHA+3,38 SAY [-0-]
      endif
      @ LINHA+4,02 SAY [TOTAL DE RECEITAS ]+replic([.],34)+[ R$]
      if mrec>0
         @ LINHA+4,57 SAY MREC PICT [@E 9,999,999.99]
       else
         @ LINHA+4,65 SAY [-0-]
      endif
      @ LINHA+5,02 SAY [TOTAL DE DESPESAS ]+replic([.],34)+[ R$]
      if mdes>0
         @ LINHA+5,57 SAY MDES PICT [@E 9,999,999.99]
       else
         @ LINHA+5,65 SAY [-0-]
      endif
      @ LINHA+6,02 SAY [SALDO ATUAL ]+replic([.],40)+[R$]
        MATU=MREC-MDES
      if matu>0
         @ LINHA+6,57 SAY MATU PICT [@E 9,999,999.99]
       else
         @ LINHA+6,65 SAY [-0-]
      endif
   else
      LINHA=LINHA+3
      @ LINHA+1,02 say PADC([DEMONSTRATIVO ECONOMICO],76)
      @ LINHA+2,02 SAY [SALDO ANTERIOR         R$]
      if sante#0
         @ linha+2,30 say sante pict [@E 9,999,999.99]
       else
         @ LINHA+2,38 SAY [-0-]
      endif
      @ LINHA+3,02 SAY [TOTAL DE RECEBIMENTOS  R$]
      if rece>0
         @ LINHA+3,30 SAY rece PICT [@E 9,999,999.99]
       else
         @ LINHA+3,38 SAY [-0-]
      endif
      @ LINHA+4,02 SAY [TOTAL DE RECEITAS ]+replic([.],34)+[ R$]
      if receitas>0
         @ LINHA+4,57 SAY receitas PICT [@E 9,999,999.99]
       else
         @ LINHA+4,65 SAY [-0-]
      endif
      @ LINHA+5,02 SAY [TOTAL DE DESPESAS ]+replic([.],34)+[ R$]
      if desp>0
         @ LINHA+5,57 SAY desp PICT [@E 9,999,999.99]
       else
         @ LINHA+5,65 SAY [-0-]
      endif
      @ LINHA+6,02 SAY [SALDO ATUAL ]+replic([.],40)+[ R$]
      if satual#0
         @ LINHA+6,57 SAY satual PICT [@E 9,999,999.99]
       else
         @ LINHA+6,65 SAY [-0-]
      endif
   endif
   LINHA=LINHA+9
   @ LINHA,02 say PADC([DEMONSTRATIVO BANCARIO],76)
   LINHA++
   SELE 5
   @ LINHA,02 SAY [BANCO ]+BANCO1+[ R$]
   IF SBANCO1#0
      @ LINHA,27 SAY SBANCO1 PICT [@E 9,999,999.99]
   ELSE
      @ LINHA,35 SAY [-0-]
   ENDIF
   LINHA++
   @ LINHA,02 SAY [BANCO ]+BANCO2+[ R$]
   IF SBANCO1#0
      @ LINHA,27 SAY SBANCO2 PICT [@E 9,999,999.99]
   ELSE
      @ LINHA,35 SAY [-0-]
   ENDIF
   LINHA++
   @ LINHA,02 SAY [BANCO ]+BANCO3+[ R$]
   IF SBANCO1#0
      @ LINHA,27 SAY SBANCO3 PICT [@E 9,999,999.99]
   ELSE
      @ LINHA,35 SAY [-0-]
   ENDIF
   LINHA++
   @ LINHA,02 SAY [BANCO ]+BANCO4+[ R$]
   IF SBANCO1#0
      @ LINHA,27 SAY SBANCO4 PICT [@E 9,999,999.99]
   ELSE
      @ LINHA,35 SAY [-0-]
   ENDIF
   MSBANC=SBANCO1+SBANCO2+SBANCO3+SBANCO4
   @ LINHA,55 SAY [R$]
   if MSBANC#0
      @ LINHA,57 SAY MSBANC PICT [@E 9,999,999.99]
    else
      @ LINHA,65 SAY [-0-]
   endif
   LINHA++
   @ LINHA,02 SAY [DINHEIRO EM CAIXA]+REPLIC([.],35)+[ R$]
   if CAIXA#0
      @ LINHA,57 SAY CAIXA PICT [@E 9,999,999.99]
    else
      @ LINHA,65 SAY [-0-]
   endif
*  LINHA=LINHA+2
*  @ LINHA,02 SAY [T O T A L   G E R A L]+REPLIC([.],31)+[ R$]
*  MTOTG=MSBANC+CAIXA
*  if MTOTG#0
*     @ LINHA,57 SAY MTOTG PICT [@E 9,999,999.99]
*   else
*     @ LINHA,65 SAY [-0-]
*  endif
   LINHA=LINHA+3
   @ LINHA  ,02 SAY [   Declaro para os devidos fins e sob as penas da Lei, que o Demonstra-]
   @ LINHA+1,02 SAY [tivo Financeiro acima apresentado,  corresponde,  exatamente, ao escri-]
   @ LINHA+2,02 SAY [turado no Livro Caixa  desta Filial, tudo  de acordo com a documenta‡Æo]
   @ LINHA+3,02 SAY [h bil em meu poder,  devidamente arquivada  para  atender as exigˆncias]
   @ linha+4,02 say [legais.]
   linha=linha+5
   @ linha+1,02 say padl([Itapaj‚, ]+dia+[ de ]+mes+[ de ]+STR(Ano,4)+[.],66)
   linha=linha+2
   @ linha+2,02 say padl([_____________________________________],70)
   @ linha+3,02 say padl([P roco ou Respons vel],63)
   @ 00,00 say [ ]
   set print to
   set print off
   set device to screen
   setcolor([w+/bg+])
   @ 22,15 clear to 22,77
   memoedit(memoread("c_mitra.txt"),06,01,20,78,.f.)
   restscreen(00,00,24,79,mtc_mit)
   sele 3
   set order to 1
   go top
   set cursor on
ENDDO
RESTSCREEN(00,00,24,79,TELMIT)
RETURN          
