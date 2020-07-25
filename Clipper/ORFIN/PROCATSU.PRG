/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: PROCATSU.PRG
 \ Data....: 03-11-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: Produtos p/ subcategoria
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: GAS-Pro v4.0o
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/
#include "orfin.ch"     // inicializa constantes manifestas

PRIV t_, i_, col_cp, col_ti, cr_, ord_
PARA lin_menu,col_menu
PRIV  tem_borda:=.t., op_menu:=VAR_COMPL, l_s:=10, c_s:=6, l_i:=13, c_i:=71, tela_fundo:=SAVESCREEN(0,0,MAXROW(),79),;
      prefixo_dbf:="PRO", op_sis:=EVAL(qualsis,"PRODUTOS")
SETCOLOR(drvtittel)
vr_memo=NOVAPOSI(@l_s,@c_s,@l_i,@c_i)     // pega posicao atual da tela
CAIXA(mold,l_s,c_s,l_i,c_i)               // monta caixa da tela
@ l_s,c_s+20 SAY " CATEGORIA / SUBCATEGORIA "
SETCOLOR(drvcortel)
@ l_s+01,c_s+1 SAY " Categoria...:     -"
@ l_s+02,c_s+1 SAY " Subcategoria:     -"
PRIV vcod_cat:=SPAC(3)                             // Categoria
PRIV vcod_sub:=SPAC(3)                             // Subcategoria
DO WHILE .t.
 rola_t=.f.
 cod_sos=56
 SET KEY K_ALT_F8 TO ROLATELA
 SETCOLOR(drvcortel+","+drvcorget+",,,"+corcampo)
 @ l_s+01 ,c_s+16 GET  vcod_cat;
                  PICT "999";
                  VALI CRIT("PTAB(vcod_cat,'CATS',1)~Categoria nao localizada. Pressione F8.");
                  WHEN "VDBF(6,24,20,77,'CATS',{'des_cat'},2,'cod_cat',[])"
                  AJUDA "Pressione F8 para categorias"
                  CMDF8 "VDBF(6,24,20,77,'CATS',{'des_cat'},2,'cod_cat',[])"
                  MOSTRA {"LEFT(TRAN(CATS->des_cat,[@!]),43)", 1 , 22 }

 @ l_s+02 ,c_s+16 GET  vcod_sub;
                  PICT "999";
                  VALI CRIT("PTAB(vcod_cat+vcod_sub,'SUBCATS',1)~Subcategoria nao localizada. PressioneF8.");
                  WHEN "VDBF(6,24,20,77,'SUBCATS',{'des_sub'},2,'cod_sub',[cod_cat=CATS->cod_cat])"
                  AJUDA "Pressione F8 para subcategorias"
                  CMDF8 "VDBF(6,24,20,77,'SUBCATS',{'des_sub'},2,'cod_sub',[cod_cat=CATS->cod_cat])"
                  MOSTRA {"LEFT(TRAN(SUBCATS->des_sub,[@!]),43)", 2 , 22 }

 READ
 SET KEY K_ALT_F8 TO
 IF rola_t
  ROLATELA(.f.)
  LOOP
 ENDI
 IF LASTKEY()=K_ESC                                // se quer cancelar
  RETU                                             // retorna
 ENDI
 EXIT
ENDD
op_menu=PROJECOES                                  // flag consulta e faz projecoes
SELE 0

#ifdef COM_REDE
 IF !USEARQ("PRODUTOS",.f.,10,1)                   // se falhou a abertura do arq
  RETU                                             // volta ao menu anterior
 ENDI
#else
 USEARQ("PRODUTOS")                                // abre o dbf e seus indices
#endi

col_cp={;                                          // conteudo das colunas
          "cod_pro",;
          "des_pro",;
          "uni_pro";
       }
col_ti={;                                          // titulo das colunas
          "Codigo",;
          "Descricao",;
          "Unidade";
       }
cr_="cod_cat=M->vcod_cat.and.cod_sub=M->vcod_sub"  // filtro inicial
ord_="des_pro"                                     // ordem inicial
GO TOP                                             // vai p/ inicio do arquivo
cod_sos=8
EDITA(05,03,20,75,.t.,col_cp,col_ti,cr_,ord_)
RETU                                               // volta para o menu anterior

* \\ Final de PROCATSU.PRG
