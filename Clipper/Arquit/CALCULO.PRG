# include "inkey.ch"
clear
if .not. file([TABELAS.DBF]) .OR. .NOT. FILE([CLIENTE.dbf]) .OR. .NOT. FILE([VIGAS.DBF])
    @ row()+1,00 say padc([Sistema Abortado ! ! !],78)
    @ row()+1,00 say padc([Arquivos de Dados NЦo Encontrados . . .],78)
      inkey(5)
    do fim
    return
endif
set talk off
set status off
set wrap on
set bell oN
set score off
set date british
set century on
set typeahead to 50
set epoch to 1920
SET DELETE ON
SET CONFIRM OFF
SET DELIMITERS ON
SET DELIMITERS TO "[]"
set messa to 22 center
set procedure to funcoes
set procedure to data
set procedure to telas
SET PROCEDURE TO SENHAS
PUBLIC CTRLF9:=K_CTRL_F9
PUBLIC CTRLF10:=K_CTRL_F10
PUBLIC TELASAI:=SAVESCREEN(00,00,24,79)
setcolor("/b")
DO T
**pass()
clear
setcolor("gr+/b")
@ 00,00 say padc([                                                                         ],80)
@ 01,00 say padc([ лллллл лл   лл ллллллл  лллллл лл   лл лл   лл  ллллл  ллллллл лллллл  ллллл ],80)
@ 02,00 say padc([ллп     ллл  лл лл    л ллп     ллл  лл лл   лл лллпллл лл   лл   лл   лллпллл],80)
@ 03,00 say padc([ллммм   лллл лл лл      ллммм   лллл лл ллмммлл лл   лл ллмммлл   лл   лл   лл],80)
@ 04,00 say padc([ллппп   лл лллл лл лллм ллппп   лл лллл ллппплл ллмммлл ллпллпп   лл   ллмммлл],80)
@ 05,00 say padc([ллм     лл  ллл лл   лл ллм     лл  ллл лл   лл ллппплл лл  лл    лл   ллппплл],80)
@ 06,00 say padc([ лллллл лл   лл ллллллл  лллллл лл   лл лл   лл лл   лл лл   лл лллллл лл   лл],80)
@ 07,00 say padc([                                                                         ],80)
@ 08,00 say padc([ лллллл  ллллл  лл   лл млллллл лллллллл ллллллл лл   лл  лллллл  ллллл   ллллл ],80)
@ 09,00 say padc([ллп     ллп плл ллл  лл лл    п    лл    лл   лл лл   лл ллп     лллпллл ллп плл],80)
@ 10,00 say padc([лл      лл   лл лллл лл ллмммм     лл    ллмммлл лл   лл лл      лл   лл лл   лл],80)
@ 11,00 say padc([лл      лл   лл лл лллл  пппплл    лл    ллпллпп лл   лл лл      ллмммлл лл   лл],80)
@ 12,00 say padc([ллм     ллм млл лл  ллл м    лл    лл    лл  лл  ллм млл ллм     ллппплл ллм млл],80)
@ 13,00 say padc([ лллллл  ллллл  лл   лл ллллллп    лл    лл   лл  ллллл   лллллл лл   лл  ллллл ],80)
@ 14,00 say padc([                                                            мл                  ],80)
@ 15,00 say padc([                                                                         ],80)
@ 16,00 say padc([ лллллл    лллллл    лл   лл    лллллл    лл     ],80)
@ 17,00 say padc([ллп          лл      лл   лл      лл      лл     ],80)
@ 18,00 say padc([лл           лл      лл   лл      лл      лл     ],80)
@ 19,00 say padc([лл           лл       лл лл       лл      лл     ],80)
@ 20,00 say padc([ллм          лл       лл лл       лл      лл     ],80)
@ 21,00 say padc([ лллллл    лллллл      ллл      лллллл    ллллллл],80)
@ 22,00 say padc([                                                                         ],80)
@ 23,00 say padc([                                                                         ],80)
@ 24,00 say padc([                                                                         ],80)
IF .NOT. FILE([TABELA01.NTX]) .OR. .NOT. FILE([CLIENT01.NTX]) .OR. .NOT. FILE([VIGAS01.NTX])
   DO INDICES
  ELSE
   CLOSE ALL
   SELE 1
   USE CLIENTE
   SET index to CLIENT01
   SELE 2
   USE VIGAS
   SET INDEX TO VIGAS01
   SELE 3
   USE TABELAS
   SET INDEX TO TABELA01
ENDIF
PASSA=.t.
* DO SENHA
IF PASSA
   DATA1()
   DO MENUPRI
ENDIF
SET TALK ON
SET STATUS ON
SET SCORE ON
DO FIM
