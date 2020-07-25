/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: ORF_MENU.PRG
 \ Data....: 03-11-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: Menu geral da aplica‡„o
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: GAS-Pro v4.0o
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/
#include "orfin.ch"     // inicializa constantes manifestas

opc_01=1
v01=SAVESCREEN(0,0,MAXROW(),79)
DO WHIL opc_01!=0
 cod_sos=3
 RESTSCR(0,0,MAXROW(),79,v01)
 menu01="Cadastros~1|"+;
        "Consultas~2|"+;
        "Relatorios~3|"+;
        "Graficos~4|"+;
        "Utilitarios~5"
 opc_01=DBOX(menu01,0,,E_POPMENU,NAO_APAGA,,,,opc_01)
 BEGIN SEQUENCE
  DO CASE
   CASE opc_01=0      // retornar ao DOS
    ALERTA()
    msgt="ENCERRAMENTO"
    msg ="Finalizar opera‡”es|N„o finalizar"
    cod_sos=1
    op_=DBOX(msg,,,E_MENU,,msgt,,,1)
    IF op_!=1
     opc_01=1
    ENDI

   CASE opc_01=1     // cadastros
    opc_02=1
    v02=SAVESCREEN(0,0,MAXROW(),79)
    DO WHIL opc_02!=0
     cod_sos=4
     RESTSCR(0,0,MAXROW(),79,v02)
     menu02="Categorias de produtos~1|"+;
            "Produtos e servicos~2|"+;
            "Metas e gastos diarios~3"
     ROLAPOP(1)
     opc_02=DBOX(menu02,1,2,E_MENU,NAO_APAGA,,,,opc_02)
     ROLAPOP()
     DO CASE
      CASE opc_02=1     // categorias de produtos
       CATS(3,10)

      CASE opc_02=2     // produtos e servicos
       PRODUTOS(3,10)

      CASE opc_02=3     // metas e gastos diarios
       METAS(3,10)

     ENDC
     CLEA GETS
     CLOS ALL
    ENDD

   CASE opc_01=2     // consultas
    opc_02=1
    v02=SAVESCREEN(0,0,MAXROW(),79)
    DO WHIL opc_02!=0
     cod_sos=4
     RESTSCR(0,0,MAXROW(),79,v02)
     menu02="Produtos p/ subcategoria~1"
     ROLAPOP(1)
     opc_02=DBOX(menu02,1,13,E_MENU,NAO_APAGA,,,,opc_02)
     ROLAPOP()
     DO CASE
      CASE opc_02=1     // produtos p/ subcategoria
       PROCATSU(3,21)

     ENDC
     CLEA GETS
     CLOS ALL
    ENDD

   CASE opc_01=3     // relatorios
    opc_02=1
    v02=SAVESCREEN(0,0,MAXROW(),79)
    DO WHIL opc_02!=0
     cod_sos=4
     RESTSCR(0,0,MAXROW(),79,v02)
     menu02="Maiores gastos~1"
     ROLAPOP(1)
     opc_02=DBOX(menu02,1,24,E_MENU,NAO_APAGA,,,,opc_02)
     ROLAPOP()
     DO CASE
      CASE opc_02=1     // maiores gastos
       opc_03=1
       v03=SAVESCREEN(0,0,MAXROW(),79)
       DO WHIL opc_03!=0
        cod_sos=4
        RESTSCR(0,0,MAXROW(),79,v03)
        menu03="Por produto~1"
        opc_03=DBOX(menu03,3,32,E_MENU,NAO_APAGA,,,,opc_03)
        DO CASE
         CASE opc_03=1     // por produto
          ORF_R001(5,40)

        ENDC
        CLEA GETS
        CLOS ALL
       ENDD

     ENDC
     CLEA GETS
     CLOS ALL
    ENDD

   CASE opc_01=4     // graficos
    opc_02=1
    v02=SAVESCREEN(0,0,MAXROW(),79)
    DO WHIL opc_02!=0
     cod_sos=4
     RESTSCR(0,0,MAXROW(),79,v02)
     menu02="Gastos por produto~1|"+;
            "Gastos por sub-categoria~2|"+;
            "Gastos por categoria~3"
     ROLAPOP(1)
     opc_02=DBOX(menu02,1,36,E_MENU,NAO_APAGA,,,,opc_02)
     ROLAPOP()
     DO CASE
      CASE opc_02=1     // gastos por produto
       IF sgr_ok
        ORF_G001(3,44)
       ELSE
        ALERTA(2)
        DBOX(msg_sgr)
       ENDI

      CASE opc_02=2     // gastos por sub-categoria
       IF sgr_ok
        ORF_G002(3,44)
       ELSE
        ALERTA(2)
        DBOX(msg_sgr)
       ENDI

      CASE opc_02=3     // gastos por categoria
       IF sgr_ok
        ORF_G003(3,44)
       ELSE
        ALERTA(2)
        DBOX(msg_sgr)
       ENDI

     ENDC
     CLEA GETS
     CLOS ALL
    ENDD

   CASE opc_01=5     // utilitarios
    opc_02=1
    v02=SAVESCREEN(0,0,MAXROW(),79)
    DO WHIL opc_02!=0
     op_menu=PROJECOES
     cod_sos=9
     RESTSCR(0,0,MAXROW(),79,v02)
     menu02="Usuarios e senhas~1|"+;
            "Copia de seguranca~2|"+;
            "Restaura de copia~3|"+;
            "Organizar indices~4|"+;
            "Apagar excluidos~5|"+;
            "Relatorio gravado~6|"+;
            "Configura ambiente~7"
     ROLAPOP(1)
     opc_02=DBOX(menu02,1,46,E_MENU,NAO_APAGA,,,,opc_02)
     ROLAPOP()
     DO CASE
      CASE opc_02=1     // usuarios e senhas
       cod_sos=17
       MASENHA(1,54)
      CASE opc_02=2     // copia de seguranca
       GBAK()

      CASE opc_02=3     // restaura de copia
       RBAK()

      CASE opc_02=4     // organizar indices
       cod_sos=39
       RCLA()

      CASE opc_02=5     // apagar excluidos
       cod_sos=40
       COMPACTA()

      CASE opc_02=6     // relatorio gravado
       VE_REL()

      CASE opc_02=7     // configura ambiente
       opc_03=1
       v03=SAVESCREEN(0,0,MAXROW(),79)
       DO WHIL opc_03!=0
        cod_sos=41
        RESTSCR(0,0,MAXROW(),79,v03)
        menu03="ÿ Impressoraÿÿÿÿÿÿÿÿÿÿ~1|"+;
               "ÿ Pano de fundoÿÿÿÿÿÿÿ~2|"+;
               "ÿ Fontes de caracteres~3|"+;
               "ÿ Esquemas de coresÿÿÿ~4|"+;
               "ÿ Sensibilidade mouseÿ~5|"+;
               "---~6|"+;
               IF(drvconf,"û ","ÿ ")+"Confirma em camposÿÿ~7|"+;
               IF(drvexcl,"û ","ÿ ")+"Confirma exclus”esÿÿ~8|"+;
               IF(drvincl,"û ","ÿ ")+"Confirma inclus”esÿÿ~9|"+;
               IF(drvsom,"û ","ÿ ")+"Efeitos sonorosÿÿÿÿÿ~10|"+;
               IF(drvautohelp,"û ","ÿ ")+"Ajuda de campo ativa~11|"+;
               IF(drvmouse,"û ","ÿ ")+"Utiliza mouseÿÿÿÿÿÿÿ~12"
        opc_03=DBOX(menu03,3,54,E_MENU,NAO_APAGA,,,,opc_03)
        DO CASE
         CASE opc_03=1     // impressora
          CONFPRN()

         CASE opc_03=2     // pano de fundo
          cod_sos=43; msg=""                       // menu de caracteres para fundo
          FOR t=1 TO 255                           // enche msg com as opcoes
           IF t!=124                               // exceto o '|` que e o
            msg+="|"+STR(t,3)+" - "+CHR(t)         // caracter separador das
           ENDI                                    // opcoes da DBOX(
          NEXT
          t=ASC(drvcara)-IF(ASC(drvcara)>123,1,0)
          op_x=DBOX(SUBS(msg,2),,62,E_MENU,,,,,t)
          IF op_x!=0                               // escolhido um caracter
           op_x+=IF(op_x>123,1,0)                  // desconta o '|`
           IF drvcara!=CHR(op_x)                   // se caracter
            drvcara=CHR(op_x)                      // diferente do atual
            SAVE TO (arqconf) ALL LIKE drv*        // grava configuracoes,
            CBC1()                                 // monta tela principal e
            v01=SAVESCREEN(0,0,MAXROW(),79)        // salva para o break
            BREAK                                  // que foi configurado
           ENDI
          ENDI

         CASE opc_03=3     // fontes de caracteres
          op_x=1; cod_sos=53
          msgf=MUDAFONTE(999)
          DO WHILE op_x!=0 .AND.LEN(msgf)>0
           msgf=STRTRAN(msgf,CHR(251)," ")
           msgf=LEFT(msgf,13*drvfonte)+CHR(251)+SUBS(msgf,13*drvfonte+2)
           op_x=DBOX(msgf,05,62,E_MENU,,,,,drvfonte+1)
           IF op_x>0
            drvfonte=op_x-1
            MUDAFONTE(drvfonte)
           ENDI
          ENDD

         CASE opc_03=4     // esquemas de cores
          CONFCORES()

         CASE opc_03=5     // sensibilidade mouse
          cod_sos=45
          AJMOUSE()

         CASE opc_03=7     // confirma em campos
          drvconf=!drvconf
          SET(_SET_CONFIRM,drvconf)

         CASE opc_03=8     // confirma exclus”es
          drvexcl=!drvexcl

         CASE opc_03=9     // confirma inclus”es
          drvincl=!drvincl

         CASE opc_03=10     // efeitos sonoros
          drvsom=!drvsom

         CASE opc_03=11     // ajuda de campo ativa
          drvautohelp=!drvautohelp

         CASE opc_03=12     // utiliza mouse
          IF MOUSE()>0
           drvmouse=!drvmouse
          ENDI

          #ifdef COM_TUTOR
           IF acao_mac!="D"
            drvmouse=.f.
           ENDI
          #endi

        ENDC
        CLEA GETS
        CLOS ALL
       ENDD
       SAVE TO (arqconf) ALL LIKE drv*             // diferente do atual

     ENDC
     CLEA GETS
     CLOS ALL
    ENDD

  ENDC
 END
 CLEA GETS
 CLOS ALL
ENDD

RETU

* \\ Final de ORF_MENU.PRG
