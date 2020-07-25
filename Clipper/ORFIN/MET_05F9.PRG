/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: MET_05F9.PRG
 \ Data....: 06-10-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: F¢rmula (Gasto sem. 3) a mostrar na tela de METAS
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: Programado manualmente pelo analista
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/

#include "orfin.ch"     // inicializa constantes manifestas

LOCAL reg_dbf:=POINTER_DBF()
local valor:=0
usearq("GASTOS")
sum GASTOS->vlr_gas*GASTOS->qtd_gas to valor for day(GASTOS->dat_gas)>=METAS->se3_met .and. day(GASTOS->dat_gas)<=(METAS->se4_met-1) .and. GASTOS->mes_met=METAS->mes_met .and. GASTOS->ano_met=METAS->ano_met
POINTER_DBF(reg_dbf)
RETU valor

* \\ Final de MET_05F9.PRG
