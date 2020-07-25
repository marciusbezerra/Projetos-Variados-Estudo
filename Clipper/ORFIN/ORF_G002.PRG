/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: ORF_G002.PRG
 \ Data....: 03-11-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: Gastos por sub-categoria
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: GAS-Pro v4.0o
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/
#include "orfin.ch"     // inicializa constantes manifestas

PRIV dele_atu, cur_atual, getlist:={}, sgr_dad:={}, arq_, arqsgr_, qt_1, ii
PARA lin_menu, col_menu
PRIV  tem_borda:=.t., op_menu:=VAR_COMPL, l_s:=10, c_s:=27, l_i:=13, c_i:=54, tela_fundo:=SAVESCREEN(0,0,MAXROW(),79)
nucop=1
arqsgr_=drvdbf+"G"+ide_maq+".003"
arq_=drvdbf+"SGR"+ide_maq+".par"                   // nome do arquivo de parametro do SGR

#ifndef COM_TUTOR
 IF FILE(arqsgr_)
  cod_sos=58
  msgt="EXISTEM ESPECIFICA€™ES|DESTE GRFICO!"
  msg="Utilizar|Recalcular"
  i=DBOX(msg,,,E_MENU,,msgt)
  IF i=1
   COPY FILE (arqsgr_) TO (arq_)
   SGRAFICO(GRAFICO)                               // ativa o SGR atraves de interrupt
   ERASE (arq_)                                    // eclui arquivo .par do SGR
   RETU
  ENDI
 ENDI
#endi

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
                  VALI CRIT("dt_fin>=dt_ini~Informe uma data maior ou igual a inicial")
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
 PTAB(PRODUTOS->cod_cat+PRODUTOS->cod_sub,"SUBCATS",1,.t.)
 SET RELA TO cod_pro INTO PRODUTOS,;               // relacionamento dos arquivos
          TO PRODUTOS->cod_cat+PRODUTOS->cod_sub INTO SUBCATS
 resolucao=100
 cor_col=.t.
 titrel="GASTOS POR SUB-CATEGORIA"
 criterio=""                                       // inicializa variaveis
 cpord="SUBCATS->des_sub+SUBCATS->cod_cat+SUBCATS->cod_sub"
 chv_rela:=chv_1:=chv_2 := ""
 tps:=op_x:=ccop := 1
 fil_ini=""
 IF !opcoes_sgr(lin_menu,col_menu,57,fil_ini)      // nao quis configurar...
  CLOS ALL                                         // fecha arquivos e
  LOOP                                             // volta ao menu
 ENDI
 EXIT
ENDD
cur_atual=SETCURSOR(0)
dele_atu:=SET(_SET_DELETED,.t.)                    // os excluidos nao servem...
POE_GAUGE("[ESC] Interrompe","AGUARDE...","Emitidos:")
BEGIN SEQUENCE
 INI_ARQ()                                         // acha 1o. reg valido do arquivo
 DO WHIL !EOF().AND.POE_GAUGE()
  IF IN_KEY()=K_ESC                                // se quer cancelar
   IF canc()                                       // pede confirmacao
    BREAK                                          // confirmou...
   ENDI
  ENDI
  IF dat_gas>=M->dt_ini.and.dat_gas<=M->dt_fin     // se atender a condicao...
   qb01501=SUBCATS->cod_cat+SUBCATS->cod_sub       // campo para agrupar 1a quebra
   AADD(sgr_dad,{SUBCATS->des_sub,0})              // procura quebra no vetor tit das quebras
   qt_1=LEN(sgr_dad)
   DO WHIL !EOF().AND.POE_GAUGE() .AND. SUBCATS->cod_cat+SUBCATS->cod_sub=qb01501
    IF IN_KEY()=K_ESC                              // se quer cancelar
     IF canc()                                     // pede confirmacao
      BREAK                                        // confirmou...
     ENDI
    ENDI
    IF dat_gas>=M->dt_ini.and.dat_gas<=M->dt_fin   // se atender a condicao...
     sgr_dad[qt_1,2]+=qtd_gas*vlr_gas              // acumula no vetor
     SKIP                                          // pega proximo registro
    ELSE                                           // se nao atende condicao
     SKIP                                          // pega proximo registro
    ENDI
   ENDD
  ELSE                                             // se nao atende condicao
   SKIP                                            // pega proximo registro
  ENDI
 ENDD
 SETCURSOR(cur_atual)
 SET ALTE TO (arqsgr_)                             // abre o arquivo para gravacao
 SET ALTE ON                                       // liga gravacao
 SET CONS OFF                                      // nao iremos exibir na tela
 IF EMPTY(titrel)                                  // se nao definiu um titulo
  ?? "Titulo = GASTOS POR SUB-CATEGORIA"           // pegaremos o default
 ELSE                                              // caso contrario
  ?? "Titulo = "+titrel                            // usaremos o titulo definido
 ENDI
 ? "Tipo = 2 "
 ? "Titulo X = "
 ? "Titulo Y = "
 ? "Porta = "+drvporta
 IF !cor_col
  ? "Pintar areas = NAO"
 ENDI
 IF !EMPTY(drvland)                                // prn matricial nao tem resolucao
  ? "Resolucao = "+STR(resolucao)
 ENDI
 ? "Tamanho texto titulo = 1"
 ? "Posicao do titulo = Esquerdo"
 qt_1=LEN(sgr_dad)                                 // quantidade de colunas
 ? "Quantidade Linhas = 1"
 ? "Quantidade Colunas = "+LTRIM(STR(qt_1))
 ? "[DADOS]"
 IF qt_1>0
  ? ""
  FOR ii=1 TO qt_1                                 // grava os titulos
   ?? CHR(34)+ALLTRIM(TRAN(sgr_dad[ii,1],""))+CHR(34)+IF(ii=qt_1,"",",")
  NEXT
  ? ""
  ?? CHR(34)+CHR(34)+","
  FOR ii=1 TO qt_1
   ?? LTRIM(TRAN(sgr_dad[ii,2],""))                // grava o dado
   IF ii!=qt_1                                     // se nao for a ultima coluna
    ?? ","                                         // grava o delimitador
   ENDI
  NEXT
 ENDI
 ? ""
 SET ALTE OFF                                      // desliga a gravacao
 SET ALTE TO                                       // fecha arquivo
 SET CONS ON                                       // reabilita o video
 COPY FILE (arqsgr_) TO (arq_)
 SGRAFICO(GRAFICO)                                 // ativa o SGR atraves de interrupt
 ERASE (arq_)                                      // eclui arquivo .par do SGR
END SEQUENCE
SELE GASTOS                                        // seleciona arquivo
SET RELA TO                                        // retira os relacionamentos
SET(_SET_DELETED,dele_atu)                         // os excluidos serao vistos
RETU

* \\ Final de ORF_G002.PRG
