/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: ORF_R001.PRG
 \ Data....: 03-11-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: Por produto
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: GAS-Pro v4.0o
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/
#include "orfin.ch"     // inicializa constantes manifestas

PRIV dele_atu, cur_atual, getlist:={}
PARA lin_menu, col_menu
PRIV  tem_borda:=.t., op_menu:=VAR_COMPL, l_s:=10, c_s:=27, l_i:=13, c_i:=54, tela_fundo:=SAVESCREEN(0,0,MAXROW(),79)
nucop=1
SETCOLOR(drvtittel)
vr_memo=NOVAPOSI(@l_s,@c_s,@l_i,@c_i)     // pega posicao atual da tela
CAIXA(mold,l_s,c_s,l_i,c_i)               // monta caixa da tela
@ l_s,c_s+10 SAY " PERIODO "
SETCOLOR(drvcortel)
@ l_s+01,c_s+1 SAY " Data inicial:"
@ l_s+02,c_s+1 SAY " Data final..:"
PRIV dt_ini:=CTOD('')                              // Data inicial
PRIV dt_fin:=CTOD('')                              // Data final
DO WHILE .t.
 rola_t=.f.
 cod_sos=56
 SET KEY K_ALT_F8 TO ROLATELA
 SETCOLOR(drvcortel+","+drvcorget+",,,"+corcampo)
 @ l_s+01 ,c_s+16 GET  dt_ini;
                  PICT "@D";
                  VALI CRIT("!EMPT(dt_ini)~Informe a data inicial do periodo")
                  DEFAULT "ctod('01/'+str(month(date()))+'/'+str(year(date())))"
                  AJUDA "Informe a data inicial do periodo"

 @ l_s+02 ,c_s+16 GET  dt_fin;
                  PICT "@D";
                  VALI CRIT("dt_fin>=dt_ini~Informa uma data final maior que a inicial")
                  DEFAULT "date()"
                  AJUDA "Informe a data final do periodo"

 READ
 SET KEY K_ALT_F8 TO
 IF rola_t
  ROLATELA(.f.)
  LOOP
 ENDI
 IF LASTKEY()=K_ESC                                // se quer cancelar
  RETU                                             // retorna
 ENDI

 #ifdef COM_REDE
  IF !USEARQ("GASTOS",.f.,10,1)                    // se falhou a abertura do arq
   RETU                                            // volta ao menu anterior
  ENDI
 #else
  USEARQ("GASTOS")                                 // abre o dbf e seus indices
 #endi

 PTAB(cod_pro,"PRODUTOS",1,.t.)                    // abre arquivo p/ o relacionamento
 PTAB(PRODUTOS->cod_cat,"CATS",1,.t.)
 SET RELA TO cod_pro INTO PRODUTOS,;               // relacionamento dos arquivos
          TO PRODUTOS->cod_cat INTO CATS
 titrel:=criterio := ""                            // inicializa variaveis
 cpord="STR(vlr_gas,10,02)"
 chv_rela:=chv_1:=chv_2 := ""
 tps:=op_x:=ccop := 1
 fil_ini=""
 IF !opcoes_rel(lin_menu,col_menu,1,11,fil_ini)    // nao quis configurar...
  CLOS ALL                                         // fecha arquivos e
  LOOP                                             // volta ao menu
 ENDI
 IF tps=2                                          // se vai para arquivo/video
  arq_=ARQGER()                                    // entao pega nome do arquivo
  IF EMPTY(arq_)                                   // se cancelou ou nao informou
   LOOP                                            // retorna
  ENDI
 ELSE
  arq_=drvporta                                    // porta de saida configurada
 ENDI
 SET PRINTER TO (arq_)                             // redireciona saida
 EXIT
ENDD
cur_atual=SETCURSOR(0)
dele_atu:=SET(_SET_DELETED,.t.)                    // os excluidos nao servem...
POE_GAUGE("[ESC] Interrompe","AGUARDE...","Emitidos:")
SET DEVI TO PRIN                                   // inicia a impressao
maxli=62                                           // maximo de linhas no relatorio
BEGIN SEQUENCE
 DO WHIL ccop<=nucop                               // imprime qde copias pedida
  pg_=1; cl=50000
  INI_ARQ()                                        // acha 1o. reg valido do arquivo
  IF EOF()
   EXIT
  ENDI
  ccop++                                           // incrementa contador de copias
  DO WHIL !EOF().AND.POE_GAUGE()
   IF IN_KEY()=K_ESC                               // se quer cancelar
    IF canc()                                      // pede confirmacao
     BREAK                                         // confirmou...
    ENDI
   ENDI
   IF dat_gas>=M->dt_ini.and.dat_gas<=M->dt_fin    // se atender a condicao...
    REL_CAB(1)                                     // soma cl/imprime cabecalho
    des_pro=PRODUTOS->des_pro                      // variavel temporaria
    @ cl,000 SAY TRAN(des_pro,"@!")                // Descricao
    des_cat=CATS->des_cat                          // variavel temporaria
    @ cl,031 SAY TRAN(des_cat,"@!")                // Categoria
    gasto=qtd_gas*vlr_gas                          // variavel temporaria
    @ cl,052 SAY TRAN(gasto,"@E 9,999,999.99")     // Gasto
    SKIP                                           // pega proximo registro
   ELSE                                            // se nao atende condicao
    SKIP                                           // pega proximo registro
   ENDI
  ENDD
 ENDD ccop
 EJEC                                              // salta pagina
END SEQUENCE
SETCURSOR(cur_atual)
SET PRINTER TO (drvporta)                          // fecha arquivo gerado (se houver)
SET DEVI TO SCRE                                   // direciona saida p/ video
IF tps=2                                           // se vai para arquivo/video
 BROWSE_REL(arq_,2,3,MAXROW()-2,78)
ENDI          // mostra o arquivo gravado
GRELA(1)                                           // grava variacao do relatorio
SELE GASTOS                                        // seleciona arquivo
SET RELA TO                                        // retira os relacionamentos
SET(_SET_DELETED,dele_atu)                         // os excluidos serao vistos
RETU

STATIC PROC REL_CAB(qt)                            // cabecalho do relatorio
IF qt>0                                            // se parametro maior que 0
 cl=cl+qt                                          // soma no contador de linhas
ENDI
IF cl>maxli .OR. qt=0                              // quebra de pagina
 IMPAC(nemp,0,000)                                 // nome da empresa
 @ 0,070 SAY "PAG"
 @ 0,074 SAY TRAN(pg_,'9999')                      // n£mero da p gina
 IMPAC(nsis,1,000)                                 // t¡tulo aplica‡„o
 @ 1,070 SAY "ORF_R001"                            // c¢digo relat¢rio
 @ 2,000 SAY "MAIORES GASTOS POR PRODUTO"
 @ 2,060 SAY NSEM(DATE())                          // dia da semana
 @ 2,068 SAY DTOC(DATE())                          // data do sistema
 @ 3,000 SAY titrel                                // t¡tulo a definir
 @ 4,000 SAY "Descricao                      Categoria                   Gasto"
 @ 5,000 SAY REPL("-",78)
 cl=qt+5 ; pg_++
ENDI
RETU

* \\ Final de ORF_R001.PRG
