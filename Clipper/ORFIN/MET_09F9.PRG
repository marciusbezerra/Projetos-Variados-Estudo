/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: MET_09F9.PRG
 \ Data....: 06-10-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: F¢rmula (Esp. Sem. 2) a mostrar na tela de METAS
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: Programado manualmente pelo analista
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/

#include "orfin.ch"     // inicializa constantes manifestas
if MET_04F9()=0
 retu 0
else
 RETU ((METAS->met_met/4*2)-MET_03F9())
endif

* \\ Final de MET_09F9.PRG
