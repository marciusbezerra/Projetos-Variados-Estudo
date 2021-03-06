/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: MET_03F9.PRG
 \ Data....: 05-10-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: F�rmula (Gasto sem. 1) a mostrar na tela de METAS
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: Programado manualmente pelo analista
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/

#include "orfin.ch"     // inicializa constantes manifestas

LOCAL reg_dbf:=POINTER_DBF()
local valor:=0
usearq("GASTOS")
sum GASTOS->vlr_gas*GASTOS->qtd_gas to valor for day(GASTOS->dat_gas)>=METAS->se1_met .and. day(GASTOS->dat_gas)<=(METAS->se2_met-1) .and. GASTOS->mes_met=METAS->mes_met .and. GASTOS->ano_met=METAS->ano_met
POINTER_DBF(reg_dbf)
RETU valor

* \\ Final de MET_03F9.PRG
