procedure ultreindex
use clientes
set cursor off
moldura(10,40,14,65,.f.,"Arquivo: Clientes")
@12,42 say "Por....:  Codigo ����"
@13,42 say "          Nome ������"
setcolor("W*/N")
@12,63 say chr(219)
index on codcli to indcodcl
setcolor("W/N")
@12,63 say chr(251)
setcolor("W*/N")
@13,63 say chr(219)
index on nomecli to indnomecl
setcolor("W/N")
@13,63 say chr(251)

use faturas
set cursor off
moldura(12,45,17,70,.f.,"Arquivo: Faturas")
@14,47 say "Por .: Cod. fatura ��"
@15,47 say "Data/Cliente ��������"
@16,47 say "Cliente/Data ��������"
setcolor("W*/N")
@14,68 say chr(219)
index on codfat to indcodfa
setcolor("W/N")
@14,68 chr(251)
setcolor("W*/N")
@15,68 chr(219)
index on dtos(vencimento)+codcli to inddatcl
setcolor("W/N")
@15,68 chr(251)
setcolor("W*/N")
@16,68 chr(219)
index on codcli+dtos(vencimento) to indcldat
setcolor("W/N")
@16,68 chr(251)
set cursor on
restscreen(4,1,21,79,telavelha)
close all
return

