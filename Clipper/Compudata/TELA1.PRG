clea
scroll(08,00,19,78,0)
setcolor("W+/BG+")
quadro(00,00,21,79)
@ 03,00 TO 03,79
@ 03,00 SAY [√]
@ 03,79 SAY [¥]
@ 05,00 TO 05,79
@ 05,00 SAY [√]
@ 05,79 SAY [¥]
setCOLOR("GR+/BG+")
@ 01,02 say [Aluno: Marcius Carneiro Bezerra]
setCOLOR("w+/BG+")
@ 01,47 say [Intituto Tecnol¢gico COMPUDATA]
@ 02,02 SAY [Curso: Dbase / Clipper]
setCOLOR("GR+/BG+")
@ 02,55 SAY DATA2()
setcolor("/b")
@ 04,01 CLEAR TO 04,78
@ 22,02 CLEAR TO 22,77
setcolor("w+/bg+")
@ 08,02 say padc([Seis funá‰es b†sicas:],77)
@ 10,02 say padc([1. Menu],77)
@ 11,02 say padc([2. Inclus∆o],77)
@ 12,02 say padc([3. Alteraá∆o],77)
@ 13,02 say padc([4. Exclus∆o],77)
@ 14,02 say padc([5. Consulta],77)
@ 15,02 say padc([6. Listagem],77)
quadro(21,00,23,79)
@ 21,00 SAY [√]
@ 21,79 SAY [¥]
SETCOLOR("w+/bg+")
@ 24,00 say PADC([<CTRL+F9> HORA ≥ <CTRL+F10> CALCULADORA ≥ <ESC> SAIR ],80)
