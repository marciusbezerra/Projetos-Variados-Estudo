/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: MET_01F9.PRG
 \ Data....: 05-10-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: Valor inicial do campo MES_MET, arquivo METAS
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: Programado manualmente pelo analista
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/

#include "orfin.ch"     // inicializa constantes manifestas

/*
   -------------------------------------------------------------------
   Se abrir outros arquivos salve situacao anterior e restaure ao sair
   como no exemplo abaixo:
     LOCAL reg_dbf:=POINTER_DBF()
     ...        ...        ...        ...
     POINTER_DBF(reg_dbf)
     RETU
   -------------------------------------------------------------------
*/

RETU MONTH(date()) // <- deve retornar um valor NUMERICO

* \\ Final de MET_01F9.PRG
