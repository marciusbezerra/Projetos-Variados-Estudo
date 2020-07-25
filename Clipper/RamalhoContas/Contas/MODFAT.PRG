* arquivo: modfat.prg
* por........: Marcius C bezerra
* Noticia....:
* Data.......: 15/07/2001
* Desc.......:
* Atualizador:
* Dados......:

local op
save screen
do while .t.
        @2,41 say "Modulo de faturas"
        menu:={{"Baixa      ","Retira a fatura da posicao devedora     "},;
               {"Inclusao   ","Inclusao de faturas                     "},;
               {"Alteracao  ","Alteracao de campos                     "},;
               {"Consulta   ","Consulta ao arquivo de faturas          "},;
               {"Exclusao   ","Exclusao de registros do arquivo        "},;
               {"Retorna    ","Retorna ao menu anterior                "}}
               montamenu(9,13,menu)
               menu to op
               telavelha=savescreen(4,1,21,79)
               publvar()
               do case
                        case op=1
                                do baifat
                        case op=2
                                do incfat
                        case op=3
                                do altfat
                        case op=4
                                do confat
                        case op=5
                                do excfat
                        otherwise
                                relevar()
                                return
                                restore screen
               endcase
enddo

procedure incfat
if .not. abrearq("clientes","indcodcl")
        return
endif
if .not. abrearq("faturas","indcodfa","indcldat","inddatcl")
        return
endif
do while .t.
        publvar()
        inicvar()
        mostratexto()
        pesquisa()
        if val(mcodfat)=0
                exit
        endif
        if .not. found()
                getvar()
                read
        else
                beep()
                igualavar()
                mostravar()
                mensagem(23,10,"Fatura ja cadastrada")
                loop
        endif
        if lastkey() = 27
                exit
        endif
        if confirma("Gravar este registro?")=1
                append blank
                replvar()
                if date()>clientes->ultcompra
                        clientes->ultcompra:=date()
                endif
        else
                loop
        endif
enddo
close all
voltatela()
relevar()
return

procedure altfat
if .not. abrearq("clientes","indcodcl")
        return
endif
if .not. abrearq("faturas","indcodfa","indcldat","inddatcl")
        return
endif
set relation to codcli into clientes
do while .t.
        mostratexto()
        pesquisa()
        if val(mcodfat)=0
                exit
        endif
        if found()
                igualavar()
                mostravar()
                getvar()
                read
        else
                Beep()
                mensagem(23,10,"Fatura nao cadastrada          ")
                loop
        endif
        if lastkey()=27
                exit
        endif
        if confirma("Alterar este registro?")=1
                replvar()
        else
                loop
        endif
enddo
close all
voltatela()
return

procedure confat
if .not. abrearq("clientes","indcodcl")
        return
endif
if .not. abrearq("faturas","indcodfa")
        return
endif
set relation to codcli into clientes

do while .t.
        mostratexto()
        pesquisa()
        if val(mcodfat)=0
                exit
        endif
        if found()
                igualavar()
                mostravar()
        else
                Beep()
                mensagem(23,10,"Fatura nao cadastrada           ")
                loop
        endif
        mensagem(23,10,"Pressione <SPACE> para continuar ")
enddo
close all
voltatela()
return

procedure excfat
if .not. abrearq("clientes","indcodcl")
        return
endif
if .not. abrearq("faturas","indcodfa","indcldat","inddatcl")
        return
endif
set relation to codcli into clientes
do while .t.
        mostratexto()
        pesquisa()
        if val(mcodfat)=0
                exit
        endif
        if found()
                igualavar()
                mostravar()
        else
                Beep()
                mensagem(23,10,"Fatura nao cadastrada")
                loop
        endif
        BeepSimples()
        if confirma("Deletar este registro?")=1
                delete
        else
                loop
        endif
enddo
close all
voltatela()
return

procedure baifat
if .not. abrearq("Clientes","indcodcl")
        return
endif
if .not. abrearq("Faturas","indcodfa")
        return
endif
set relation to codcli into clientes
do while .t.
        mostratexto()
        pesquisa()
        if val(mcodfat)=0
                exit
        endif
        if found()
                igualavar()
                mostravar()
                do case
                        case mpagamento <>ctod("") .and. (mvr_nominal=mvr_pago)
                        BeepSimples()
                        if confirma("Fatura ja baixada totalmente. Continua?")=2
                                loop
                        else
                                @13,58 get mpagamento picture 'DD/DD/DD' valid mpagamento<>ctod("")
                                @15,58 get mvr_pago picture '@E 9,999,999.99' valid mvr_pago>0
                                read
                        endif
                        case mpagamento<>ctod("") .and. (mvr_nominal <> mvr_pago)
                        @16,38 say "Valor em aberto.:"
                        calc=vr_pago
                        @16,58 say mvr_nominal-mvr_pago picture '@E 9,999,999.99'
                        @13,58 get mpagamento picture 'DD/DD/DD' valid mpagamento<>ctod("")
                        @15,58 get mvr_pago picture '@E 9,999,999.99' valid mvr_pago>0
                        read
                        mvr_pago=mvr_pago+calc
                        if mvr_pago > mvr_nominal
                                if lastkey()=27
                                        exit
                                endif
                                BeepSimples()
                                if confirma("Valor pago nao pode ser maior que o nominal. Continua?")=2
                                        mvr_pago=calc
                                        loop
                                endif
                        endif
                        otherwise
                        @13,58 get mpagamento picture 'DD/DD/DD' valid mpagamento<>ctod("")
                        @15,58 get mvr_pago picture '@E 9,999,999.99' valid mvr_pago>0
                        read
                endcase
        else
                Beep()
                mensagem(23,10,"Fatura nao cadastrada")
                loop
        endif
        if lastkey()=27
                exit
        endif
        if confirma("Confirma baixa dessa fatura?")=1
                replace pagamento with mpagamento
                replace vr_pago with mvr_pago
        else
                loop
        endif
        enddo
close all
voltatela()
return

static procedure inicvar
mcodfat=space(5)
mcodcli=space(4)
mvencimento=ctod("  /  /  ")
mpagamento=ctod("  /  /  ")
mvr_nominal=0
mvr_pago=0
return

static procedure mostratexto
set color to W/N
@5,2 clear to 17,74
@11,2 to 17,74
@11,34 to 17,34
@5,2 to 17,74 double
@7,4 say   "Numero......:"
@9,4 say   "Cod. cliente:"
@13,4 say  "Vencimento..:"
@13,38 say "Data pagamento..:"
@15,4 say  "Valor.......:"
@15,38 say "Valor pago......:"
return

static procedure mostravar
set color to W/N
@7,19 say mcodfat
@9,19 say mcodcli
@9,28 say clientes->nomecli
@13,19 say mvencimento picture 'DD/DD/DD'
@13,58 say mpagamento picture 'DD/DD/DD'
@15,19 say mvr_nominal picture '@E 9,999,999.99'
@15,58 say mvr_pago picture '@E 9,999,999.99'
return

static procedure getvar
set color to W/N,N/W
@9,19 get mcodcli picture "99999" valid clientes->(pesqcli(@mcodcli,9,28))
@13,19 get mvencimento picture 'DD/DD/DD' valid mvencimento<>ctod("")
@15,19 get mvr_nominal picture '@E 9,999,999.99' valid mvr_nominal>0
@13,58 get mpagamento picture 'DD/DD/DD'
@15,58 get mvr_pago picture '@E 9,999,999.99'
return

static procedure igualavar
store codfat to mcodfat
store codcli to mcodcli
store vencimento to mvencimento
store pagamento to mpagamento
store vr_nominal to mvr_nominal
store vr_pago to mvr_pago
return

static procedure replvar
replace codfat with mcodfat
replace codcli with mcodcli
replace vencimento with mvencimento
replace pagamento with mpagamento
replace vr_nominal with mvr_nominal
replace vr_pago with mvr_pago
return

static procedure publvar
public mcodfat,mcodcli,mvencimento,mpagamento,mvr_nominal
public mvr_pago
return

static procedure relevar
release mcodfat,mcodcli,mvencimento,mpagamento,mvr_nominal
release mvr_pago
return

static procedure pesquisa
set color to w/n,n/w
do mostratexto
mcodfat=0
@7,19 get mcodfat picture "99999"
read
mcodfat=strzero(mcodfat,5)
setcolor("N/W")
@7,19 say mcodfat
setcolor("W/N")
seek mcodfat
return

function pesqcli
parameters mcodcli,lin,col
mcodcli=strzero(val(mcodcli),4)
setcolor("N/W")
@ 9,19 say mcodcli
setcolor("W/N")
seek mcodcli
set cursor off
if found()
        @lin,col say nomecli
        achou=.t.
else
        @lin,col say "Nao encontrado                         "
        beep()
        inkey(2)
        achou=.f.
        mcodcli = "    "
        @lin,col say "                                       "
endif
set cursor on
return (achou)
