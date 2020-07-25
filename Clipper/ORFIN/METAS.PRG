/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: METAS.PRG
 \ Data....: 03-11-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: Gerenciador do subsistema de metas e gastos diarios
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: GAS-Pro v4.0o
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/
#include "orfin.ch"     // inicializa constantes manifestas

PARA lin_menu,col_menu
PRIV op_sis, tela_fundo:=SAVESCREEN(0,0,MAXROW(),79), l_s, c_s, l_i, c_i, l_a

op_sis=EVAL(qualsis,"METAS")
IF nivelop<sistema[op_sis,O_OUTROS,O_NIVEL]        // se usuario nao tem permissao,
 ALERTA()                                          // entao, beep, beep, beep
 DBOX(msg_auto,,,3)                                // lamentamos e
 RETU                                              // retornamos ao menu
ENDI
cn:=fgrep :=.f.

#ifdef COM_LOCK
 IF LEN(pr_ok)>0                                   // se a protecao acusou
  ? pr_ok                                          // erro, avisa e
  QUIT                                             // encerra a aplicacao
 ENDI
#endi

criterio=""
SELE A                                             // e abre o arquivo e seus indices

#ifdef COM_REDE
 IF !USEARQ(sistema[op_sis,O_ARQUI,O_NOME],.f.,20,1)
                                                   // se falhou a abertura do
  RETU                                             // arquivo volta ao menu anterior
 ENDI
#else
 USEARQ(sistema[op_sis,O_ARQUI,O_NOME])
#endi

SET KEY K_F9 TO veoutros                           // habilita consulta em outros arquivos
op_menu=INCLUSAO
IF AT("D",exrot[op_sis])=0                         // se usuario pode fazer inclusao
 MET_INCL()                                        // neste arquivo chama prg de inclusao
ELSE                                               // caso contrario vamos avisar que
 ALERTA()                                          // ele nao tem permissao para isto
 DBOX(msg_auto,,,3)
ENDI
SET KEY K_F9 TO                                    // F9 nao mais consultara outros arquivos
CLOS ALL                                           // fecha todos arquivos abertos
RETU

PROC MET_incl(reg_cop)  // inclusao no arquivo METAS
LOCAL getlist:={}, cabem:=1, rep:=ARRAY(FCOU()), ult_reg:=RECN(),;
      ctl_r, ctl_c, ctl_w, t_f3_, t_f4_
PRIV op_menu:=INCLUSAO, tem_borda, criterio:="", cpord:=""
FOR i=1 TO FCOU()                                  // cria/declara privadas as
 msg=FIEL(i)                                       // variaveis de memoria com
 PRIV &msg.                                        // o mesmo nome dos campos
NEXT                                               // do arquivo
IF reg_cop!=NIL                                    // quer repetir todo o reg atual
 FOR i=1 TO FCOU()                                 // para cada campo,
  msg=FIEL(i)                                      // salva o conteudo
  rep[i]=&msg.                                     // para repetir
 NEXT
ELSE
 AFILL(rep,"")                                     // eche com valor vazio
ENDI
t_f3_=SETKEY(K_F3,{||rep()})                       // repeticao reg anterior
t_f4_=SETKEY(K_F4,{||conf()})                      // confirma campos com ENTER
ctl_w=SETKEY(K_CTRL_W,{||nadafaz()})               // enganando o CA-Clipper...
ctl_c=SETKEY(K_CTRL_C,{||nadafaz()})
ctl_r=SETKEY(K_CTRL_R,{||nadafaz()})
DO WHIL cabem>0
 cod_sos=6
 rola_t=.f.                                        // flag se quer rolar a tela
 SELE METAS
 GO BOTT                                           // forca o
 SKIP                                              // final do arquivo
 
 /*
    cria variaveis de memoria identicas as de arquivo, para inclusao
    de registros
 */
 FOR i=1 TO FCOU()
  msg=FIEL(i)
  M->&msg.=IF((fgrep .OR. reg_cop!=NIL).AND.!EMPT(rep[1]),rep[i],&msg.)
 NEXT
 DISPBEGIN()                                       // apresenta a tela de uma vez so
 MET_GETS()
 IMPRELA()
 MET_TELA()
 INFOSIS(.t.)                                      // exibe informacao no rodape' da tela
 DISPEND()
 cabem=DISKSPACE(;
          IF(;
             LEN(sistema[op_sis,O_ARQUI,O_DIR_DBF])<2.OR.sistema[op_sis,O_ARQUI,O_DIR_DBF]="\",;
             0,;
             ASC(sistema[op_sis,O_ARQUI,O_DIR_DBF])-64;
          );
       )
 cabem=INT((cabem-2048)/METAS->(RECSIZE()))
 IF cabem<1                                        // mais nenhum!!!
  ALERTA()
  msg="Verifique ESPA€O EM DISCO, "+usuario
  DBOX(msg,,,,,"INCLUSŽO INTERROMPIDA!")           // vamos parar por aqui!
  EXIT
 ENDI
 SELE 0                                            // torna visiveis variaveis de memoria
 SETCOLOR(drvcortel+","+drvcorget+",,,"+corcampo)
 SET KEY K_ALT_F8 TO ROLATELA
 
 /*
    recebe chaves do arquivo de indice basico
 */
 @ l_s+02 ,c_s+11 GET  mes_met;
                  PICT sistema[op_sis,O_CAMPO,01,O_MASC]
                  DEFINICAO 1

 @ l_s+02 ,c_s+14 GET  ano_met;
                  PICT sistema[op_sis,O_CAMPO,02,O_MASC]
                  DEFINICAO 2

 READ
 SET KEY K_ALT_F8 TO
 IF rola_t
  ROLATELA()
  LOOP
 ENDI
 SELE METAS
 IF LASTKEY()=K_ESC                                // cancelou ou chave em branco
  cabem=0                                          // prepara saida da inclusao
  LOOP                                             // volta p/ menu de cadastramento
 ENDI
 SEEK STR(M->mes_met,02,00)+STR(M->ano_met,04,00)
 IF FOUND()                                        // pesquisou e achou!
  op_menu=ALTERACAO                                // seta flag de ateracao
  DISPBEGIN()
  MET_GETS()
  IMPRELA()
  MET_GETS()                                       // mostra conteudo do registro
  INFOSIS(.f.)                                     // exibe informacao no rodape' da tela
  DISPEND()
  ALERTA()
  msg="Consultar/alterar|Retornar … inclus„o"      // pergunta se deseja
  op_=DBOX(msg,,,E_MENU,,"REGISTRO J EXISTE")     // alterar o registro
  IF op_ =1                                        // caso afirmativo
   EDIT()                                          // deixa alterar
  ENDI
  op_menu=INCLUSAO
  LOOP                                             // volta para inclusao
 ENDI
 SELE 0
 MET_GET1(INCLUI)                                  // recebe campos
 SELE METAS
 IF LASTKEY()=K_ESC                                // se cancelou
  ALERTA()                                         // avisa que o registro
  DBOX("Registro n„o inclu¡do!",18,,1)             // nao foi incluido, e volta
  LOOP
 ENDI

 #ifdef COM_REDE
  GO BOTT                                          // vamos bloquear o final do
  SKIP                                             // arq para que nehum outro
  BLOREG(0,.5)                                     // usuario possa incluir
  SEEK STR(M->mes_met,02,00)+STR(M->ano_met,04,00) // se registro foi incluido
  IF FOUND()                                       // por outro usuario, entao
   BLOREG(0,.5)
   FOR i=1 TO FCOU()
    msg=FIEL(i)
    rep[i]=&msg.
    REPL &msg. WITH M->&msg.
   NEXT
   MET_GET1(FORM_INVERSA)                          // executa formula inversa
   RECA
   FOR i=1 TO FCOU()
    msg=FIEL(i)
    REPL &msg. WITH rep[i]
   NEXT
   ALERTA(4)                                       // beep 4 vezes
   msg="Registro acabou de ser|inclu¡do por outro usu rio!"
   DBOX(msg,,,,,"ATEN€ŽO!")                        // avisa
   SELE METAS
   UNLOCK                                          // libera o registro
   LOOP                                            // e recebe chave novamente
  ENDI
 #endi

 APPEND BLANK                                      // inclui reg em branco no dbf
 FOR i=1 TO FCOU()                                 // para cada campo,
  msg=FIEL(i)                                      // salva o conteudo
  rep[i]=M->&msg.                                  // para repetir
  REPL &msg. WITH rep[i]                           // enche o campo do arquivo
 NEXT

 #ifdef COM_REDE
  UNLOCK                                           // libera o registro e
  COMMIT                                           // forca gravacao
 #else
  IF RECC()-INT(RECC()/20)*20=0                    // a cada 20 registros
   COMMIT                                          // digitados forca gravacao
  ENDI
 #endi

 ult_reg=RECN()                                    // ultimo registro digitado
 IF sistema[EVAL(qualsis,"GASTOS"),O_OUTROS,O_NIVEL]<5
  SUBNIVEL("GASTOS")
 ENDI
 IF reg_cop!=NIL                                   // estava na consulta e quis rep o campo
  EXIT                                             // cai fora...
 ENDI
ENDD
GO ult_reg                                         // para o ultimo reg digitado
SETKEY(K_F3,t_f3_)                                 // restaura teclas de funcoes
SETKEY(K_F4,t_f4_)
SETKEY(K_CTRL_W,ctl_w)
SETKEY(K_CTRL_C,ctl_c)
SETKEY(K_CTRL_R,ctl_r)
RETU


PROC MET_tela     // tela do arquivo METAS
tem_borda=.t.
l_s=Sistema[op_sis,O_TELA,O_LS]           // coordenadas da tela
c_s=Sistema[op_sis,O_TELA,O_CS]
l_i=Sistema[op_sis,O_TELA,O_LI]
c_i=Sistema[op_sis,O_TELA,O_CI]
SETCOLOR(drvtittel)
vr_memo=NOVAPOSI(@l_s,@c_s,@l_i,@c_i)     // pega posicao atual da tela
CAIXA(mold,l_s,c_s,l_i,c_i)               // monta caixa da tela
i=LEN(sistema[op_sis,O_MENS])/2
@ l_s,c_s-1+(c_i-c_s+1)/2-i SAY " "+MAIUSC(sistema[op_sis,O_MENS])+" "
SETCOLOR(drvcortel)
@ l_s+01,c_s+1 SAY "Ú Metas ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂDias iniciais da 4 semanas ÄÄÄÄÄÄÄÄÄÄ¿"
@ l_s+02,c_s+1 SAY "³Mes/Ano:   /          ³1a.:    2a.:    3a.:    4a.:         ³"
@ l_s+03,c_s+1 SAY "³Meta...:              ³Pressione F5 para ver o calendario   ³"
@ l_s+04,c_s+1 SAY "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
@ l_s+05,c_s+1 SAY "³                 Gasto          Esperado       Restando     ³"
@ l_s+06,c_s+1 SAY "³1a. Semana.....:                                            ³"
@ l_s+07,c_s+1 SAY "³2a. Semana.....:                                            ³"
@ l_s+08,c_s+1 SAY "³3a. Semana.....:                                            ³"
@ l_s+09,c_s+1 SAY "³4a. Semana.....:                                            ³"
@ l_s+10,c_s+1 SAY "³                                                            ³"
@ l_s+11,c_s+1 SAY "³Total..........:                                            ³"
@ l_s+12,c_s+1 SAY "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
RETU

PROC MET_gets     // mostra variaveis do arquivo METAS
LOCAL getlist := {}
MET_TELA()
SETCOLOR(drvcortel+","+drvcorget+",,,"+corcampo)
CRIT("",,"1|2|3|4|6|7|8|10|11|12|14|15")
@ l_s+02 ,c_s+11 GET  mes_met;
                 PICT sistema[op_sis,O_CAMPO,01,O_MASC]

@ l_s+02 ,c_s+14 GET  ano_met;
                 PICT sistema[op_sis,O_CAMPO,02,O_MASC]

@ l_s+03 ,c_s+11 GET  met_met;
                 PICT sistema[op_sis,O_CAMPO,03,O_MASC]
                 CRIT(sistema[op_sis,O_CAMPO,03,O_CRIT],,"5|9|13")

@ l_s+02 ,c_s+30 GET  se1_met;
                 PICT sistema[op_sis,O_CAMPO,04,O_MASC]

@ l_s+02 ,c_s+38 GET  se2_met;
                 PICT sistema[op_sis,O_CAMPO,05,O_MASC]

@ l_s+02 ,c_s+46 GET  se3_met;
                 PICT sistema[op_sis,O_CAMPO,06,O_MASC]

@ l_s+02 ,c_s+54 GET  se4_met;
                 PICT sistema[op_sis,O_CAMPO,07,O_MASC]

CLEAR GETS
RETU

PROC MET_get1(tp_mov)     // capta variaveis do arquivo METAS
LOCAL getlist := {}
PRIV  blk_metas:=.t.

IF tp_mov=INCLUI
 DO WHILE .t.
  rola_t=.f.
  SET KEY K_ALT_F8 TO ROLATELA
  SETCOLOR(drvcortel+","+drvcorget+",,,"+corcampo)
  CRIT("",,"1|2|3|4|6|7|8|10|11|12|14|15")
  @ l_s+03 ,c_s+11 GET  met_met;
                   PICT sistema[op_sis,O_CAMPO,03,O_MASC]
                   DEFINICAO 3
                   MOSTRA sistema[op_sis,O_FORMULA,5]
                   MOSTRA sistema[op_sis,O_FORMULA,9]
                   MOSTRA sistema[op_sis,O_FORMULA,13]

  @ l_s+02 ,c_s+30 GET  se1_met;
                   PICT sistema[op_sis,O_CAMPO,04,O_MASC]
                   DEFINICAO 4

  @ l_s+02 ,c_s+38 GET  se2_met;
                   PICT sistema[op_sis,O_CAMPO,05,O_MASC]
                   DEFINICAO 5

  @ l_s+02 ,c_s+46 GET  se3_met;
                   PICT sistema[op_sis,O_CAMPO,06,O_MASC]
                   DEFINICAO 6

  @ l_s+02 ,c_s+54 GET  se4_met;
                   PICT sistema[op_sis,O_CAMPO,07,O_MASC]
                   DEFINICAO 7

  READ
  SET KEY K_ALT_F8 TO
  IF rola_t
   ROLATELA()
   LOOP
  ENDI
  IF LASTKEY()!=K_ESC .AND. drvincl .AND. op_menu=INCLUSAO
   IF !CONFINCL()
    LOOP
   ENDI
  ENDI
  EXIT
 ENDD
ENDI
IF tp_mov=EXCLUI .OR. tp_mov=FORM_INVERSA
 INTREF(FORM_INVERSA)
 DELE
ELSEIF tp_mov=INCLUI .OR. tp_mov=RECUPERA .OR. tp_mov=FORM_DIRETA
 IF op_menu!=INCLUSAO
  RECA
  INTREF(FORM_DIRETA)
 ENDI
ENDI
RETU

PROC GAS_incl(reg_cop)  // inclusao no arquivo GASTOS
LOCAL getlist:={},cabem:=1,rep:=ARRAY(FCOU()),ult_reg:=RECN(),dbfseq_,;
      ctl_r, ctl_c, t_f3_, t_f4_, l_max
PRIV op_menu:=INCLUSAO, sq_atual_, op_sis, l_s, c_s, l_i, c_i, cod_sos, chv_rela, chv_1, chv_2, tem_borda, criterio:="", cpord:="", l_a
op_sis=EVAL(qualsis,"GASTOS")
IF AT("D",exrot[op_sis])>0
 RETU
ENDI
chv_rela=""
FOR i=1 TO LEN(sistema[op_sis,O_CPRELA])
 chv_rela+="+"+TRANSCAMPO(.f.,sistema[op_sis,O_CPRELA,i],i)
NEXT
chv_rela=IF(LEN(chv_rela)>2,SUBS(chv_rela,2),"")
PEGACHV2()
FOR i=1 TO FCOU()                                  // cria/declara privadas as
 msg=FIEL(i)                                       // variaveis de memoria com
 PRIV &msg.                                        // o mesmo nome dos campos
NEXT                                               // do arquivo
IF reg_cop!=NIL                                    // quer repetir todo o reg atual
 FOR i=1 TO FCOU()                                 // para cada campo,
  msg=FIEL(i)                                      // salva o conteudo
  rep[i]=&msg.                                     // para repetir
 NEXT
ELSE
 AFILL(rep,"")                                     // eche com valor vazio
ENDI
t_f3_=SETKEY(K_F3,{||rep()})                       // repeticao reg anterior
t_f4_=SETKEY(K_F4,{||conf()})                      // confirma campos com ENTER
ctl_w=SETKEY(K_CTRL_W,{||nadafaz()})               // enganando o CA-Clipper...
ctl_c=SETKEY(K_CTRL_C,{||nadafaz()})
ctl_r=SETKEY(K_CTRL_R,{||nadafaz()})

#ifdef COM_REDE
 GAS_CRIA_SEQ()                                    // cria dbf de controle de cp sequenciais
 FOR i=1 TO FCOU()                                 // cria/declara privadas as
  msg="sq_"+FIEL(i)                                // variaveis de memoria com
  PRIV &msg.                                       // o mesmo nome dos campos
 NEXT                                              // do arquivo com extensao _seq
#endi

DISPBEGIN()                                        // monta tela na pagina de traz
IMPRELA()                                          // imp telas do pai
GAS_TELA()                                         // imp tela para inclusao
INFOSIS(.t.)                                       // exibe informacao no rodape' da tela
l_a=Sistema[op_sis,O_TELA,O_SCROLL]
DISPEND()                                          // apresenta tela de uma vez so
DO WHIL cabem>0
 cod_sos=6
 rola_t=.f.                                        // flag se quer rolar a tela
 SELE GASTOS
 GO BOTT                                           // forca o
 SKIP                                              // final do arquivo
 
 /*
    cria variaveis de memoria identicas as de arquivo, para inclusao
    de registros
 */
 FOR i=1 TO FCOU()
  msg=FIEL(i)
  M->&msg.=IF((fgrep .OR. reg_cop!=NIL).AND.!EMPT(rep[1]),rep[i],&msg.)
 NEXT
 
 /*
    inicializa campos de relacionamentos do com os campos do arquivo
    superior (pai)
 */
 FOR i=1 TO LEN(sistema[op_sis,O_CPRELA])
  msg=FIEL(VAL(SUBS(sistema[op_sis,O_ORDEM,1],i*2-1,2)))
  M->&msg.=&(sistema[op_sis,O_CPRELA,i])
 NEXT
 GAS_GERA_SEQ()
 cabem=DISKSPACE(;
          IF(;
             LEN(sistema[op_sis,O_ARQUI,O_DIR_DBF])<2.OR.sistema[op_sis,O_ARQUI,O_DIR_DBF]="\",;
             0,;
             ASC(sistema[op_sis,O_ARQUI,O_DIR_DBF])-64;
          );
       )
 cabem=INT((cabem-2048)/GASTOS->(RECSIZE()))
 IF cabem<1                                        // mais nenhum!!!
  ALERTA()
  msg="Verifique ESPA€O EM DISCO, "+usuario
  DBOX(msg,,,,,"INCLUSŽO INTERROMPIDA!")           // vamos parar por aqui!
  EXIT
 ENDI
 SELE 0                                            // torna visiveis variaveis de memoria
 GAS_GET1(INCLUI)                                  // recebe campos
 SELE GASTOS
 IF LASTKEY()=K_ESC                                // se cancelou
  cabem=0                                          // prepara saida da inclusao
  LOOP
 ENDI

 #ifdef COM_REDE
  GO BOTT                                          // vamos bloquear o final do
  SKIP                                             // arq para que nehum outro
  BLOREG(0,.5)                                     // usuario possa incluir
 #endi

 APPEND BLANK                                      // inclui reg em branco no dbf
 FOR i=1 TO FCOU()                                 // para cada campo,
  msg=FIEL(i)                                      // salva o conteudo
  rep[i]=M->&msg.                                  // para repetir
  REPL &msg. WITH rep[i]                           // enche o campo do arquivo
 NEXT

 #ifdef COM_REDE
  UNLOCK                                           // libera o registro e
  COMMIT                                           // forca gravacao
 #else
  IF RECC()-INT(RECC()/20)*20=0                    // a cada 20 registros
   COMMIT                                          // digitados forca gravacao
  ENDI
 #endi

 ult_reg=RECN()                                    // ultimo registro digitado
 l_max=l_s+Sistema[op_sis,O_TELA,O_SCROLL]+Sistema[op_sis,O_TELA,O_QTDE]
 IF l_s+l_a+1<l_max                                // se nao atingiu o fim da tela
  l_a++                                            // digita na proxima linha
 ELSE                                              // se nao rola a campos para cima
  SCROLL(l_s+Sistema[op_sis,O_TELA,O_SCROLL],c_s+01,l_max-1,c_s+10,1)
  SCROLL(l_s+Sistema[op_sis,O_TELA,O_SCROLL],c_s+12,l_max-1,c_s+15,1)
  SCROLL(l_s+Sistema[op_sis,O_TELA,O_SCROLL],c_s+48,l_max-1,c_s+52,1)
  SCROLL(l_s+Sistema[op_sis,O_TELA,O_SCROLL],c_s+54,l_max-1,c_s+65,1)
  SCROLL(l_s+Sistema[op_sis,O_TELA,O_SCROLL],c_s+67,l_max-1,c_s+78,1)
  SCROLL(l_s+Sistema[op_sis,O_TELA,O_SCROLL],c_s+17,l_max-1,c_s+46,1)
 ENDI
 IF reg_cop!=NIL                                   // estava na consulta e quis rep o campo
  sq_atual_=NIL
  EXIT                                             // cai fora...
 ENDI
ENDD

#ifdef COM_REDE
 GAS_ANT_SEQ()                                     // restaura sequencial anterior
 SELE GASTOS
#endi

GO ult_reg                                         // para o ultimo reg digitado
SETKEY(K_F3,t_f3_)                                 // restaura teclas de funcoes
SETKEY(K_F4,t_f4_)
SETKEY(K_CTRL_W,ctl_w)
SETKEY(K_CTRL_C,ctl_c)
SETKEY(K_CTRL_R,ctl_r)
RETU



#ifdef COM_REDE
 PROC GAS_ANT_SEQ(est_seq)     // restaura sequencial anterior
 SELE GAS_SEQ     // seleciona arquivo de controle de sequencial
 BLOARQ(0,.5)     // esta estacao foi a ultima a incluir?
 IF sq_atual_ == cod_gas
  REPL cod_gas WITH sq_cod_gas
 ENDI
 UNLOCK           // libera DBF para outros usuarios
 COMMIT           // atualiza cps sequenciais no disco
 RETU
#endi


PROC GAS_CRIA_SEQ   // cria dbf de controle de campos sequenciais
LOCAL dbfseq_:=sistema[op_sis,O_ARQUI,O_DIR_DBF]+"GAS_seq" // arq temporario
SELE 0                          // seleciona area vazia
IF !FILE(dbfseq_+".dbf")        // se o dbf nao existe
 DBCREATE(dbfseq_,{;            // vamos criar a sua estrutura
                    {"cod_gas"   ,"C",  6, 0};
                  };
 )
ENDI
USEARQ(dbfseq_,.f.,,,.f.)       // abre arquivo de cps sequencial
IF RECC()=0                     // se o dbf foi criado agora
 BLOARQ(0,.5)                   // inclui um registro que tera
 APPEND BLANK                   // os ultomos cps sequenciais
 SELE GASTOS
 IF RECC()>0                    // se o DBF nao estiver
  SET ORDER TO 0                // vazio, entao enche DBF seq
  GO BOTT                       // com o ultimo reg digitado
  REPL GAS_SEQ->cod_gas WITH cod_gas
  DBSETORDER(1)                 // retorna ao indice principal
 ENDI
 SELE GAS_SEQ                   // seleciona arq de sequencias
 UNLOCK                         // libera DBF para outros usuarios
 COMMIT                         // atualiza cps sequenciais no disco
ENDI
RETURN

PROC GAS_GERA_SEQ()

#ifdef COM_REDE
 LOCAL ar_:=SELEC()
#else
 LOCAL reg_:=RECNO(),ord_ind:=INDEXORD()
#endi

FIM_ARQ()
M->cod_gas=LPAD(STR(VAL(cod_gas)+1),06,[0])
RETU

PROC GAS_GRAVA_SEQ
REPL cod_gas WITH M->cod_gas
RETU

PROC GAS_tela     // tela do arquivo GASTOS
tem_borda=.t.
l_s=Sistema[op_sis,O_TELA,O_LS]           // coordenadas da tela
c_s=Sistema[op_sis,O_TELA,O_CS]
l_i=Sistema[op_sis,O_TELA,O_LI]
c_i=Sistema[op_sis,O_TELA,O_CI]
SETCOLOR(drvtittel)
vr_memo=NOVAPOSI(@l_s,@c_s,@l_i,@c_i)     // pega posicao atual da tela
CAIXA(mold,l_s,c_s,l_i,c_i)               // monta caixa da tela
i=LEN(sistema[op_sis,O_MENS])/2
@ l_s,c_s-1+(c_i-c_s+1)/2-i SAY " "+MAIUSC(sistema[op_sis,O_MENS])+" "
SETCOLOR(drvcortel)
@ l_s+01,c_s+1 SAY "Data      ³Produto                            ³Qtd. ³Valor Unit. ³Total"
@ l_s+02,c_s+1 SAY "ÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄ"
@ l_s+03,c_s+1 SAY "          ³    -                              ³     ³            ³"
@ l_s+04,c_s+1 SAY "          ³                                   ³     ³            ³"
@ l_s+05,c_s+1 SAY "          ³                                   ³     ³            ³"
@ l_s+06,c_s+1 SAY "          ³                                   ³     ³            ³"
@ l_s+07,c_s+1 SAY "          ³                                   ³     ³            ³"
@ l_s+08,c_s+1 SAY "          ³                                   ³     ³            ³"
@ l_s+09,c_s+1 SAY "          ³                                   ³     ³            ³"
@ l_s+10,c_s+1 SAY "          ³                                   ³     ³            ³"
@ l_s+11,c_s+1 SAY "          ³                                   ³     ³            ³"
@ l_s+12,c_s+1 SAY "          ³                                   ³     ³            ³"
@ l_s+13,c_s+1 SAY "          ³                                   ³     ³            ³"
@ l_s+14,c_s+1 SAY "          ³                                   ³     ³            ³"
RETU

PROC GAS_gets     // mostra variaveis do arquivo GASTOS
LOCAL getlist := {}, l_max, reg_atual:=RECNO()
PRIV  l_a:=Sistema[op_sis,O_TELA,O_SCROLL]
GAS_TELA()
l_max=l_s+Sistema[op_sis,O_TELA,O_SCROLL]+Sistema[op_sis,O_TELA,O_QTDE]
SETCOLOR(drvcortel+","+drvcorget+",,,"+corcampo)
DO WHILE !EOF() .AND. l_s+l_a<l_max .AND.;
   &(INDEXKEY(0))=IF(EMPT(criterio),"","T")+chv_1
 PTAB(COD_PRO,'PRODUTOS',1)
 @ l_s+l_a,c_s+01 GET  dat_gas;
                  PICT sistema[op_sis,O_CAMPO,04,O_MASC]

 @ l_s+l_a,c_s+12 GET  cod_pro;
                  PICT sistema[op_sis,O_CAMPO,05,O_MASC]
                  CRIT(sistema[op_sis,O_CAMPO,05,O_CRIT],,"2")

 @ l_s+l_a,c_s+48 GET  qtd_gas;
                  PICT sistema[op_sis,O_CAMPO,06,O_MASC]

 @ l_s+l_a,c_s+54 GET  vlr_gas;
                  PICT sistema[op_sis,O_CAMPO,07,O_MASC]
                  CRIT(sistema[op_sis,O_CAMPO,07,O_CRIT],,"1")

 SETCOLOR(drvcortel+","+drvcortel+",,,"+drvcortel)
 l_a++
 SKIP
ENDD
GO reg_atual
SETCOLOR(drvcortel+","+drvcorget+",,,"+corcampo)
CLEAR GETS
RETU

PROC GAS_get1(tp_mov, excl_rela)     // capta variaveis do arquivo GASTOS
LOCAL getlist := {}
PRIV  blk_gastos:=.t.
excl_rela=IF(excl_rela=NIL,.f.,excl_rela)
IF tp_mov=INCLUI
 IF TYPE("l_a")!="N"
  l_a=Sistema[op_sis,O_TELA,O_SCROLL]
 ENDI
 DO WHILE .t.
  rola_t=.f.
  SET KEY K_ALT_F8 TO ROLATELA
  SETCOLOR(drvcortel+","+drvcorget+",,,"+corcampo)
  @ l_s+l_a,c_s+01 GET  dat_gas;
                   PICT sistema[op_sis,O_CAMPO,04,O_MASC]
                   DEFINICAO 4

  @ l_s+l_a,c_s+12 GET  cod_pro;
                   PICT sistema[op_sis,O_CAMPO,05,O_MASC]
                   DEFINICAO 5
                   MOSTRA sistema[op_sis,O_FORMULA,2]

  @ l_s+l_a,c_s+48 GET  qtd_gas;
                   PICT sistema[op_sis,O_CAMPO,06,O_MASC]
                   DEFINICAO 6

  @ l_s+l_a,c_s+54 GET  vlr_gas;
                   PICT sistema[op_sis,O_CAMPO,07,O_MASC]
                   DEFINICAO 7
                   MOSTRA sistema[op_sis,O_FORMULA,1]

  READ
  SET KEY K_ALT_F8 TO
  IF rola_t
   ROLATELA()
   LOOP
  ENDI
  IF LASTKEY()!=K_ESC .AND. drvincl .AND. op_menu=INCLUSAO
   IF !CONFINCL()
    LOOP
   ENDI
  ENDI
  EXIT
 ENDD
ENDI
PTAB(COD_PRO,'PRODUTOS',1)
IF tp_mov=EXCLUI .OR. tp_mov=FORM_INVERSA

 #ifdef COM_REDE
  IF !excl_rela
   IF !EMPTY(ALIAS())
    REPL flag_excl WITH '*'
   ENDI
  ENDI
 #else
  IF !excl_rela
   IF !EMPTY(ALIAS())
    REPL flag_excl WITH '*'
   ENDI
  ENDI
 #endi

 MANUREF(COD_PRO,'PRODUTOS',1,DECREMENTA)
 IF !EMPTY(ALIAS())
  DELE
 ENDI
ELSEIF tp_mov=INCLUI .OR. tp_mov=RECUPERA .OR. tp_mov=FORM_DIRETA
 IF (op_menu=INCLUSAO .AND. LASTKEY()!=K_ESC) .OR. op_menu!=INCLUSAO
  IF tp_mov=RECUPERA .AND. op_menu!=INCLUSAO .AND. (METAS->(DELE()) .OR. PRODUTOS->(DELE()))
   msg=""
   IF METAS->(DELE())
    msg="|"+sistema[EVAL(qualsis,"METAS"),O_MENU]
   ENDI
   IF PRODUTOS->(DELE())
    msg+="|"+sistema[EVAL(qualsis,"PRODUTOS"),O_MENU]
   ENDI
   ALERTA(2)
   DBOX("Registro exclu¡do em:"+msg+"|*",,,,,"IMPOSS¡VEL RECUPERAR!")
  ELSE
    IF !excl_rela
     IF op_menu=INCLUSAO
      flag_excl=' '
     ELSE
      REPL flag_excl WITH ' '
     ENDI
    ENDI
   MANUREF(COD_PRO,'PRODUTOS',1,INCREMENTA)
   IF op_menu!=INCLUSAO
    RECA
   ENDI
  ENDI
 ENDI
ENDI
RETU

* \\ Final de METAS.PRG
