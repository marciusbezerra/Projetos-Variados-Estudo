* arquivo: crmenu.prg
* por........: Marcius C bezerra
* Noticia....:
* Data.......: 13/07/2001
* Desc.......:
* Atualizador:
* Dados......:
telados=savescreen(0,0,24,79)
empresa="M C BEZERRA- Consultoria & programacao"
sistema="SISTEMA DE CONTAS A RECEBER"
set scoreboard off
set date british
set wrap on
set deleted on
set message to 23 center
set key 28 to ajuda
do while .t.
telapadrao("Menu principal")
menu:={{"Faturas             ","Manutencao de faturas"},;
       {"Clientes            ","Manutencao do arquivo de clientes"},;
       {"Consultas/Relatorios","Consultas em video e emissao de relatorios"},;
       {"Utilitarios         ","Rotinas de backup e reindexacao"},;
       {"Finaliza            ","Retorno ao sistema operacional"}}
       montamenu(6,5,menu)
       menu to op
       do case
                case op=1
                        do modfat
                case op=2
                        do modcli
                case op=3
                        do modcon
                case op=4
                        do moduti
                otherwise
                        Beep()
                        if confirma("Sair do sistema?")=1
                                restscreen(0,0,24,79,telados)
                                exit
                        endif
       endcase
enddo

function montamenu(ls, cs, menu)
local retangulo := chr(213)+chr(205)+chr(184)+chr(179)+;
        chr(190)+chr(205)+chr(212)+chr(179)+chr(32)
@ ls, cs, ls+len(menu)+1, cs+len(menu[1,1])+1 box retangulo
for i=1 to len(menu)
        @ ls+i, cs+1 prompt menu[i,1] message menu[i,2]
next
return nil

function menumanut(ls, cs, nome)
tipo=nome
menu={{"Inclusao ","Inclusao de &tipo.                        "},;
     {"Alteracao","Alteracao de &tipo.                       "},;
     {"Consulta ","Consulta ao arquivo de &tipo.             "},;
     {"Exclusao ","Exclusao de registros do arquivo de &tipo."},;
     {"Retorna  ","Retorna ao menu anterior                  "}}
montamenu(ls, cs, menu)
return nil

function quadro(ls,cs,li,ci,tipo)
local q[6]
q[1]=chr(201)+chr(205)+chr(187)+chr(186)+;
    chr(188)+chr(205)+chr(200)+chr(186)+chr(32)
q[2]=chr(218)+chr(196)+chr(191)+chr(179)+;
    chr(217)+chr(196)+chr(172)+chr(179)
q[3]=chr(213)+chr(205)+chr(174)+chr(179)+;
    chr(190)+chr(205)+chr(212)+chr(179)+chr(32)
q[4]=chr(214)+chr(196)+chr(183)+chr(186)+;
    chr(189)+chr(196)+chr(201)+chr(186)
q[5]=chr(220)+chr(220)+chr(220)+chr(219)+;
    chr(220)+chr(220)+chr(223)+chr(219)
if tipo >= 176 .and. tipo <=178 .or. tipo=219
        if pcount()=6
                q[6]=replicate(tipo,9)
        else
                q[6]=replicate(tipo,8)
        endif
        tipo=6
endif
@ ls,cs,li,ci box q[tipo]
return nil

function moldura(topo,esq,dir,baixo,duplo,texto)
if pcount()<>6
        @ 23,10 say "Numero de parametros invalidos"
        return (nil)
endif
if duplo
        @topo,esq clear to dir,baixo
        @topo,esq to dir,baixo double
else
        @topo,esq clear to dir,baixo
        @topo,esq to dir,baixo
endif
if len(texto)>0
        tam=baixo-esq
        novapos=(tam-len(texto))/2
        @topo,esq-novapos say texto
endif
return (nil)

function confirma(texto)
local les,ces,largjan,telavelha
largjan=len(texto)+2
if largjan < 16
        largjan=16
endif
ces=(80-largjan)/2
les=19
telavelha=savescreen(les,0,les+4,79)
corantig=setcolor()
cornova="W/B,N/W"
set color to &cornova
@les,ces clear to les+3,ces+largjan
@les,ces to les+3,ces+largjan double
@les+1,ces+2 say texto
coluna=(largjan-9)/2
@les+2,ces+coluna prompt "Sim"
@les+2,ces+coluna+6 prompt "Nao"
menu to confirm
set color to &corantig
restscreen(les,0,les+4,79,telavelha)
return (confirm)

function telapadrao(programa)
clear
@0,0 to 3,39 double
@0,40 to 3,79 double
@4,0,21,79 box replicate(chr(176),9)
@4,0 to 21,79
@22,0 to 24,79 double
@1,1 say empresa
@1,41 say sistema
@1,73 say left(time(),5)
@2,41 say programa
@2,70 say date()
@23,1 say "Dica...:"
return nil

function mensagem(ls,cs,texto,tempo)
set cursor off
@ls,cs say space(60)
@ls,cs say texto
if tempo<>nil
        inkey(tempo)
else
        inkey(0)
endif
@ls,cs say space(65)
set cursor on
return nil

function abrearq(arq,ind1,ind2,ind3)
private arquivo:=arq,indice1:=ind1,indice2:=ind2,indice3:=ind3
if .not. file ("&arquivo..dbf")
        Beep()
        mensagem(23,10,"Arquivo "+arquivo+" nao encontrado.")
        return (.f.)
endif
if indice1=nil
        use &arquivo. new
endif
if indice3<>nil
        if .not. file("&indice3..ntx")
                BeepSimples()
                mensagem(23,10,"O arquivo de indice "+indice3+" nao foi encontrado",1.5)
                BeepSimples()
                mensagem(23,10,"Voce deve executar a rotina de reindexacao antes de continuar",1.5)
                if confirma("Reindexar agora?")=1
                        utireindex()
                        use &arquivo. index &indice1.,&indice2.,&indice3. new
                else
                        return (.f.)
                endif
        else
                use &arquivo. index &indice1., &indice2., &indice3. new
        endif
        return (.t.)
endif
if indice2<>nil
        if .not. file("&indice2..ntx")
                BeepSimples()
                mensagem(23,10,"O arquivo de indice "+indice2+" nao foi encontrado",1.5)
                BeepSimples()
                mensagem(23,10,"Voce deve executar a rotina de reindexacao antes de continuar",1.5)
                if confirma("Reindexar agora?")=1
                        utireindex()
                        use &arquivo. index &indice1.,&indice2. new
                else
                        return (.f.)
                endif
        else
                use &arquivo. index &indice1., &indice2. new
        endif
        return (.t.)
endif
if indice1<>nil
        if .not. file("&indice1..ntx")
                BeepSimples()
                mensagem(23,10,"O arquivo de indice "+indice1+" nao foi encontrado",1.5)
                BeepSimples()
                mensagem(23,10,"Voce deve executar a rotina de reindexacao antes de continuar",1.5)
                if confirma("Reindexar agora?")=1
                        utireindex()
                        use &arquivo. index &indice1. new
                else
                        return (.f.)
                endif
        else
                use &arquivo. index &indice1. new
        endif
        return (.t.)
endif

procedure ajuda
if .not. file("Ajuda.txt")
        mensagem(23,10,"Arquivo de ajuda nao encontrado",1.5)
        mensagem(23,10,"Consulte o manual para sanar duvidas",2)
        return
endif
save screen to telahelp
moldura(4,1,21,79,.t.,"Texto de auxilio")
memoedit(memoread("ajuda.txt"),5,2,20,78,.f.)
restore screen from telahelp
return
