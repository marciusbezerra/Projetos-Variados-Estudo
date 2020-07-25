set talk oN
set status oN
set wrap oFF
set bell oN
set exact off
set score oN
set date AMERICAN
set century oFF
set typeahead to 50
set epoch to 1920
SET DELETE OFF
SET CONFIRM OFF
SETCOLOR([W+/B])
@ 00,00 CLEAR TO 24,79
SETCOLOR([RG+/BG+])
@ 01,25 TO 08,54
@ 01,25 TO 08,54 DOUBLE
BOXSHADOW(01,25,08,54)
@ 02,26 SAY PADC([MARCIUS CARNEIRO BEZERRA],28)
SETCOLOR([W+/BG+])
@ 03,26 SAY PADC([R. Cel. Mont'Alverne],28)
@ 04,26 SAY PADC([341 apto 102, Sobral-Ce],28)
@ 05,26 SAY PADC([CEP 62100-000 (088)8806.3049],28)
SETCOLOR([RG+/BG+])
@ 06,26 SAY PADC([marciusbezerra@hotmail.com],28)
SETCOLOR([W+/BG+])
@ 07,26 say PADC([Curso: Dbase / Clipper],28)
SETCOLOR([/B])
@ 10,00 CLEAR TO 13,79
SETCOLOR([])
set procedure to
QUIT

