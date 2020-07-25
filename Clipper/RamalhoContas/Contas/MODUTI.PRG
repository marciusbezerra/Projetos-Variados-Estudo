procedure utireindex
use clientes
set cursor off
moldura(10,40,14,65,.f.,"Arquivo: Clientes")
@12,42 say "Por....:  Codigo ÄÄÄÛ"
@13,42 say "          Nome ÄÄÄÄÄÛ"
setcolor("W*/N")
@12,63 say chr(219)
index on codcli to indcodcl
setcolor("W/N")
@12,63 say chr(251)
setcolor("W*/N")
@13,63 say chr(219)
index on nomecli to indnomcl
setcolor("W/N")
@13,63 say chr(251)

use faturas
set cursor off
moldura(12,45,17,70,.f.,"Arquivo: Faturas")
@14,47 say "Por .: Cod. fatura ÄÛ"
@15,47 say "Data/Cliente ÄÄÄÄÄÄÄÛ"
@16,47 say "Cliente/Data ÄÄÄÄÄÄÄÛ"
setcolor("W*/N")
@14,68 say chr(219)
index on codfat to indcodfa
setcolor("W/N")
@14,68 say chr(251)
setcolor("W*/N")
@15,68 say chr(219)
index on dtos(vencimento)+codcli to inddatcl
setcolor("W/N")
@15,68 say chr(251)
setcolor("W*/N")
@16,68 say chr(219)
index on codcli+dtos(vencimento) to indcldat
setcolor("W/N")
@16,68 say chr(251)
set cursor on
restscreen(4,1,21,79,telavelha)
close all
return

procedure beep
tone(600,6)
tone(900,6)
return

procedure BeepSimples
tone(900,6)
return
