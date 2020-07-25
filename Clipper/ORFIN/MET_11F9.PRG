/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: MET_11F9.PRG
 \ Data....: 06-10-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: F¢rmula (Esp. Sem. 4) a mostrar na tela de METAS
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: Programado manualmente pelo analista
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/

#include "orfin.ch"     // inicializa constantes manifestas

if met_06f9()=0
 retu 0
else
 RETU (METAS->met_met-(MET_03F9()+MET_04F9()+MET_05F9()))
endif

* \\ Final de MET_11F9.PRG
