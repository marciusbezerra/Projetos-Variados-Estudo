* arquivo: modcaon.prg
* por........: Marcius C bezerra
* Noticia....:
* Data.......: 11/09/2002
* Desc.......:
* Atualizador:
* Dados......:

local op

@ 2, 41 say "M¢dulo de consultas          "

save screen

do while .t.
        menu:={{"Pos. Data/Cliente  ","Relat¢rio ordenado por data de vencimento / cliente"},;
               {"Pos. Cliente/Data  ","Relat¢rio ordenado por cliente / data de vencimento"},;
               {"T¡tulos em atraso  ","Rela‡Æo de atrasos at‚ a data informada"},;
               {"Fluxo sint‚tico    ","Listagem de totais por dia vencidos / a vencer"},;
               {"Rela‡Æo de clientes","Listagem classificada por nome ou c¢digo"},;
               {"Consulta / Cliente ","Consulta sint‚tica por cliente / data de vencimento"},;
               {"Consulta / Data    ","Consulta sint‚tica total por data de vencimento"},;
               {"Retorna            ","Retorna ao menu anterior"}}
               montamenu(9,13,menu)
               menu to op
               telavelha=savescreen(4,1,21,79)
               do case
                case op=1
                        do datacliente
                case op=2
                        do clientedata
                case op=3
                        do tituatras
                case op=4
                        do fluxosin
                case op=5
                        do relcli
                case op=6
                        do conclidat
                case op=7
                        do condatcli
                otherwise
                        restore screen
                        return
               endcase
enddo

procedure conclidat
private mcodcli:=space(4), ddataini, ddatafim, filtro:=""
if .not. abrearq("CLIENTES","INDCODCL")
        RESTSCREEN(4,1,21,79,telavelha)
        return
endif

if .not. abrearq("FATURAS","INDCLDAT")
        RESTSCREEN(4,1,21,79,telavelha)
        return
endif

set relation to codcli into clientes

do while .t.
        mcodcli:=space(4); ddataini := ddatafim := ctod("")
        quadro(6,3,14,45,3)
        @ 7,5 say "C¢digo do cliente.:"
        @ 8,5 say "XXXX = Todos"
        @ 7,26 get mcodcli picture "@N!"
        read
        if (val(mcodcli)=0 .and. mcodcli <> "XXXX") .or. (lastkey()=27)
                close all
                exit
        endif
        if mcodcli <> "XXXX"
                seek mcodcli
                if found()
                        @ 8,5 say clientes->nomecli
                        unico = .t.
                else
                        loop
                endif
                filtro = "codcli=mcodcli"
        else
                filtro = ""
        endif
        @ 10, 5 say "Data inicial.:" get ddataini
        @ 11, 5 say "Data final...:" get ddatafim valid ddatafim >= ddataini
        read
        if lastkey()=27
                close all
                exit
        endif
        if ddataini = ctod("") .and. ddatafim <> ctod("")
                if len(filtro)>1
                        filtro = filtro + " .and. vencimento >= ddataini .and. vencimento <= ddatafim"
                else
                        filtro = "vencimento >= ddataini .and. vencimento <= ddatafim"
                endif
        endif
        if len(filtro)>1
                set filter to &filtro.
        endif
        quadro(6,2,20,77,3)
        campos:={"codcli","clientes->(left(nomecli,18))","codfat",;
                "vr_nominal","vencimento","pagamento", "vr_nominal-vr_pago"}
        matpic:={"","","","@E 9,999,999.99","","","@E 9,999,999.99"}
        mattit:={"C¢digo","Nome do cliente","Fatura","Valor",;
                "Vencimento","Data do pagamento","Em aberto"}
        dbedit(7,3,19,76,campos,,matpic,mattit)
        goto top
enddo
restscreen(4,1,21,79,telavelha)
close all

procedure condatcli
if .not. abrearq("clientes","indcodcl")
        restscreen(4,1,21,79,telavelha)
        return
endif
if .not. abrearq("faturas","inddatcl")
        restscreen(4,1,21,79,telavelha)
        return
endif
set relation to codcli into clientes
select clientes
do while .t.
        mcodcli:=space(4); ddataini:=ctod("");ddatafim:=ctod("")
        quadro(6,3,14,45,3)
        @7,5 say "Data inicial.:" get ddataini
        @8,5 say "Data final...:" get ddatafim
        read
        if lastkey()=27
                restscreen(4,1,21,79,telavelha)
                close all
                return
        endif
        do case
                case ddataini=ctod("")  .and. ddatafim=ctod("")
                        testadata=0
                case ddataini<>ctod("") .and. ddatafim=ctod("")
                        testadata=1
                case ddataini=ctod("")  .and. ddatafim<>ctod("")
                        testadata=2
                case ddataini<>ctod("") .and. ddatafim<>ctod("")
                        testadata=3
        endcase
        select clientes
        achou=.f.
        do while .not. achou
                @10,5  say "Codigo do cliente :"
                @11,5  say "XXXX = TODOS"
                @10,26 get mcodcli picture "@N!"
                read
                if mcodcli<>"XXXX"
                        seek mcodcli
                        if found()
                                @11,5 say clientes->nomecli
                                achou:=.t.
                        else
                                loop
                        endif
                else
                        unico=.f.
                        exit
                endif
        enddo
        select faturas
        goto top
        quadro(6,2,19,77,3)
        @6,3  say "Codigo"
        @6,19 say "Nome"
        @6,33 say "Fatura"
        @6,42 say "Vencimento"
        @6,57 say "Valor"
        @6,67 say "Data pgto"
        i=7
        do while .not. eof()
                do case
                        case pagamento<>ctod("") .and. vr_nominal=vr_pago
                                skip
                        case mcodcli<>"XXXX" .and. codcli<>mcodcli
                                skip
                        case (testadata=1 .or. testadata=3) .and. vencimento < ddataini
                                skip
                        case (testadata=2 .or. testadata=3) .and. vencimento > ddatafim
                                skip
                        otherwise
                                if i=19
                                        mensagem(23,10,"Pressione <enter> para ver outros registros",0)
                                        scroll(7,3,18,76,12)
                                        i=7
                                endif
                                @i,4  say codcli+" "+chr(179)
                                @i,10 say clientes->(left(nomecli,20))+" "+chr(179)
                                @i,33 say codfat + " " +chr(179)
                                @i,43 say dtoc(vencimento)+" "+chr(179)
                                @i,54 say vr_nominal picture "@E 9,999,999.99"+chr(179)
                                @i,67 say pagamento
                                skip
                                i++
                endcase
        enddo
        mensagem(23,10,"Presione <enter> para a proxima tela",0)
enddo
inkey(0)
restscreen(4,1,21,79,telavelha)

procedure fluxosin
if .not. abrearq("faturas","inddatcl")
        return
endif
@23,10 say "Imprimindo fluxo sintetico ... aguarde ..."
listaflu()
close all

procedure listaflu
p=0;lin=61;totdata:=totger:=0
titulo="Fluxo sint‚tico de vencimentos"
nr="CR-003"
compvenc=vencimento
set device to printer
pago = "PAGAMENTO=CTOD('')"
pagparcial = "VR_NOMINAL <> VR_PAGO"
do while .not. eof()
        if lin>60
                cabecger(titulo,nr)
                cabecflu()
        endif
        detalheflu()
enddo
totalfluxo()
final()
set device to screen
mensagem(23,10,"Final do relatorio de clientes",2)

procedure cabecflu
        @4,10 say "Data de vencimento                       Montante"
        @5,0  say replicate("=",80)
        lin=7
return

procedure detalheflu
if compvenc<>vencimento
        @lin  ,14 say compvenc picture 'DD/DD/DD'
        @lin  ,23 say replicate(".",23)
        @lin++,46 say totdata picture '99,999,999.99'
        compvenc=vencimento
        if &pagparcial
                totger += vr_nominal-vr_pago; totdata = vr_nominal-vr_pago
        else
                totger+=vr_nominal; totdata=vr_nominal
        endif
else
        if &pagparcial
                totger+=vr_nominal-vr_pago; totdata+=vr_nominal-vr_pago
        else
                totger+=vr_nominal;totdata+=vr_nominal
        endif
endif
skip
return

procedure totalfluxo
@lin,14    say compvenc
@lin, 23   say replicate(".",23)
@lin,46    say totdata picture '99,999,999.99'
@++lin,36  say "TOTAL....:" // aumenta o valor de lin antes de imprimir
@lin++,46  say totger picture '99,999,999.99'

procedure tituatras
if .not. abrearq("clientes","indcodcl")
        restscreen(4,1,21,79,telavelha)
        return
endif
if .not. abrearq("faturas","inddatcl")
        restscreen(4,1,21,79,telavelha)
        return
endif
set relation to codcli into clientes
select clientes
do while .t.
        mcodcli:=space(4);dataref:=ctod("")
        quadro(6,3,14,45,3)
        @7,5 say "Data referencia.:" get dataref valid dataref<>ctod("")
        read
        if lastkey()=27
                restscreen(4,1,21,79,telavelha)
                close all
                return
        endif
        select clientes
        achou:=.f.
        do while .not. achou
                @10,5  say "Codigo do cliente :"
                @11,5  say "XXXX = TODOS"
                @10,26 get mcodcli picture "@N!"
                read
                if mcodcli<>"XXXX"
                        seek mcodcli
                        if found()
                                @11,5 say clientes->nomecli
                                unico:=.t.
                                achou:=.t.
                        else
                                loop
                        endif
                else
                        unico := .f.
                        exit
                endif
        enddo
        select faturas
        goto top
        set device to printer
        lin := 61;p:=totger:=totdia:=0; datacomp=ctod(""); nr:="CR-005"
        do while .not. eof()
                do case
                        case pagamento = ctod("") .and. vencimento > dataref
                                skip
                        case pagamento <> ctod("") .and. vr_nominal = vr_pago
                                skip
                        case mcodcli <>"XXXX" .and. codcli <> mcodcli
                                skip
                        otherwise
                                listatras()
                endcase
        enddo
        totalatras()
        final()
        set device to screen
        mensagem(23,11,"FINAL DO RELATORIO DE ATRASADOS",2)
enddo
restscreen(4,1,21,79,telavelha)

procedure listatras
if lin>60
        cabecger("Rela‡Æo de t¡tulos em atraso")
        cabecatr()
endif
if datacomp<>vencimento
        if datacomp<>ctod("")
                @lin ,33 say "Total....:"
                @lin++, 46 say totdia picture "@E 99,999,999.99"+" ³"
        endif
        @lin++,1 say "Vencimento : "+dtoc(vencimento)
        datacomp=vencimento
        totdia=0
endif
@lin,4  say codcli + " ³"
@lin,10 say clientes->(left(nomecli,20))+ " ³"
@lin,33 say codfat + " ³"
@lin,47 say vr_nominal picture "@E 9,999,999.99"+" ³"
if pagamento<>ctod("")
        @lin,63 say vr_pago picture "@E 9,999,999.99" + " ³"
endif
totger += vr_nominal-vr_pago ; totdia += vr_nominal-vr_pago
skip
lin++
return

procedure cabecatr
@4,1  say "C¢digo"
@4,9 say "Cliente"
@4,33 say "Fatura"
@4,43 say "           Valor"
@4,60 say " Pagto. Parcial"
@5,00 say replicate("=",80)
lin := 6
return

procedure totalatras
@ lin, 33 say "Total....:"
@ lin++, 46 say totdia picture "@E 99,999,999.99"+ " |"
@ ++lin, 33 say "TOT.GERAL:"
@ lin++, 46 say totger picture "@E 99,999,999.99"
return

procedure datacliente
if .not. abrearq("clientes","indcodcl")
        restscreen(4,1,21,79,telavelha)
        return
endif
if .not. abrearq("faturas","inddatcl")
        restscreen(4,1,21,79,telavelha)
        return
endif
set relation to codcli into clientes
select clientes
do while .t.
        mcodcli:=space(4);ddataini:=ctod("");ddatafim:=ctod("")
        quadro(6,3,14,45,3)
        @07,05 say "Data inicial.:" get ddataini
        @08,05 say "Data final...:" get ddatafim
        read
        if lastkey()=27
                restscreen(4,1,21,79,telavelha)
                close all
                return
        endif
        do case
                case ddataini=ctod("") .and. ddatafim=ctod("")
                        testadata=0
                case ddataini<>ctod("") .and. ddatafim=ctod("")
                        testadata=1
                case ddataini=ctod("") .and. ddatafim<>ctod("")
                        testadata=2
                case ddataini<>ctod("") .and. ddatafim<>ctod("")
                        testadata=3
        endcase
        select clientes
        achou=.f.
        do while .not. achou
                @10,05 say "Codigo do cliente :" 
                @11,05 say "XXXX = Todos"
                @10,26 get mcodcli picture "@N!"
                read
                if val(mcodcli)=0 .and. mcodcli<>"XXXX"
                        restscreen(4,1,21,79,telavelha)
                        close all
                        return
                endif
                if mcodcli <> "XXXX"
                        seek mcodcli
                        if found()
                                @11,05 say clientes->nomecli
                                unico:=.t.
                                achou:=.t.
                        else
                                loop
                        endif
                else
                        unico=.f.
                        exit
                endif
        enddo
        select faturas
        goto top
        set device to print
        lin:=61 ; p := totger := totdia:= 0; datacomp=ctod("");nr:="CR-006"
        do while .not. eof()
                do case
                        case pagamento<>ctod("") .and. vr_nominal=vr_pago
                                skip
                        case mcodcli<>"XXXX" .and. codcli <> mcodcli
                                skip
                        case (testadata=1 .or. testadata=3) .and. vencimento < ddataini
                                skip
                        case (testadata=2 .or. testadata=3) .and. vencimento > ddatafim
                                skip     
                        otherwise
                                listadatcl()
                endcase
        enddo
        totalatras()
        final()
        set device to screen
enddo
close all
mensagem(23,10,"Final do relatorio de titulos a vencer",2)
restscreen(4,1,21,79,telavelha)

procedure listadatcl
        if lin>60
                cabecger("Relacao de titulos a vencer")
                cabecdatcl()
        endif
        if datacomp<>vencimento
                if datacomp<>ctod("")
                        @lin,33   say "Total....:"
                        @lin++,46 say totdia picture "@E 99,999,999.99"+" ³"
                endif
                @lin++,1 say "Vencimento : " +dtoc(vencimento)
                datacomp=vencimento
                totdia=0
        endif
        @lin,04 say codcli+" ³"
        @lin,10 say clientes->(left(nomecli,20))+" ³"
        @lin,33 say codfat+" ³"
        @lin,46 say vr_nominal picture "@E 99,999,999.99"+" ³"; totdia+=vr_nominal; totger+=vr_nominal
        skip
        lin++
return

procedure cabecdatcl
        @04,03 say "Codigo"
        @04,10 say "Nome"
        @04,33 say "Fatura"
        @04,54 say "Valor"
        @05,00 say replicate("=",80)
        lin=7
return

procedure clientedata
private mcodcli:=space(4), ddataini, ddatafim, filtro:=""
if .not. abrearq("clientes","indcodcl")
        restscreen(4,1,21,79,telavelha)
        return
endif
if .not. abrearq("faturas","indcldat")
        restscreen(4,1,21,79,telavelha)
        return
endif
set relation to codcli into clientes
do while .t.
        mcodcli=space(4);ddataini:=ddatafim:=ctod("")
        quadro(6,3,14,45,3)
        @07,05 say "Codigo do cliente :"
        @08,05 say "XXXX = Todos"
        @07,26 get mcodcli picture "@N!"
        read
        if val(mcodcli)=0 .and. mcodcli<>"XXXX"
                close all
                exit
        endif
        if mcodcli<>"XXXX"
                seek mcodcli
                if found()
                        @8,5 say clientes->nomecli
                        unico=.t.
                else
                        loop
                endif
                filtro="codcli=mcodcli"
        else
                filtro=""
        endif
        @10,5 say "Data inicial.:" get ddataini
        @11,5 say "Data final...:" get ddatafim valid ddatafim>=ddataini
        read
        if lastkey()=27
                close all
                exit
        end if
        if ddataini<>ctod("") .and. ddatafim<>ctod("")
                if len(filtro)>1
                        filtro=filtro+" .and. vencimento >= ddataini .and. vencimento <= ddatafim"
                else
                        filtro="vencimento>=ddataini .and. vencimento <=ddatafim"
                endif
        endif
        if len(filtro)>1
                set filter to &filtro.
        endif
        lin:=61;p:=totger:=totdia:=totcli:=0;compcliente=space(4)
        nr="CR-007"; compdata:=ctod("")
        goto top
        set device to printer
        do while .not. eof()
                listacliente()
        enddo
        totalcli()
        final()
        set filter to
        set device to screen
enddo
close all
restscreen(4,1,21,79,telavelha)

procedure listacliente
if lin>60
        cabecger("Relacao de titulos a vencer = por cliente", nr)
        cabeccliente()
endif
if compdata<>vencimento .and. compdata<>ctod("")
        @lin,15   say "Total dia    :"
        @lin++,29 say totdia picture "@E 99,999,999.99"+" ³"
        totdia:=0
endif
if compcliente<>codcli
        if compcliente<>space(4)
                @lin,15   say "Total cliente:"
                @lin++,29 say totcli picture "@E 99,999,999.99"+" ³"
        endif
        @lin++,1 say "Cliente..: "+Clientes->(nomecli)
        compcliente=codcli
        compdata=vencimento
        totcli=0
endif
@lin,04 say codcli+" ³"
@lin,15 say codfat
@lin,30 say vr_nominal picture "@E 9,999,999.99"+" ³"
@lin,52 say dtoc(vencimento)+" ³"
totger+=vr_nominal ; totcli+=vr_nominal ; totdia+=vr_nominal
compcliente=codcli
compdata=vencimento
skip
lin++
return

procedure cabeccliente
@04,03 say "Codigo"
@04,15 say "Fatura"
@04,30 say "        Valor"
@04,50 say "Vencimento"
@05,00 say replicate("=",80)
lin:=6

procedure totalcli()
@lin,15   say "Total dia    :"
@lin++,29 say totdia picture "@E 99,999,999.99"+" ³"
@lin,15   say "Total cliente:"
@lin++,29 say totcli picture "@E 99,999,999.99"+" ³"
@lin,15   say "Total   geral:"
@lin++,29 say totger picture "@E 99,999,999.99"+" ³"

procedure cabecger(titulo,nr)
if p>0
        @lin,0 say replicate("=",71)+nr
        eject
endif
@01,00 say empresa
@01,72 say "pag: "+strzero(++p,3)
@02,15 say titulo
@02,65 say date()
@02,75 say left(time(),5)
@03,00 say replicate("=",80)
return

procedure final(tampag)
if tampag=nil
        tampag=61
endif
pos=tampag-prow()
pos=60-pos
@lin,0 say replicate("*",pos)
do while lin<=tampag-3
        @lin++,pos++ say "*"
enddo
@lin,pos say replicate("*",13)+nr
eject
return
