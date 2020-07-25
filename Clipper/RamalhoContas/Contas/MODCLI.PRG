* arquivo: modcli.prg
* por........: Marcius C bezerra
* Noticia....:
* Data.......: 07/08/2001
* Desc.......:
* Atualizador:
* Dados......:

local op
save screen
do while .t.
        @2,41 say "Modulo de clientes"
        menumanut(8,13,"Clientes")
        menu to op
        telavelha=savescreen(4,1,21,79)
        publvar()
        do case
                case op=1
                        do inccli
                case op=2
                        do altcli
                case op=3
                        do concli
                case op=4
                        do exccli
                otherwise
                        relevar()
                        return
                        restore screen
        endcase
enddo

procedure inccli
        if .not. abrearq("clientes","indcodcl","indnomcl")
                return
        endif
        do while .t.
                publvar()
                inicvar()
                mostratexto()
                pesquisa()
                if val(mcodcli)=0
                        exit
                endif
                if .not. found()
                        getvar()
                        read
                else
                        Beep()
                        mensagem(23,10,"Cliente ja cadastrado")
                        loop
                endif
                if lastkey() = 27
                        exit
                endif
                if confirma("Gravar esse registro?")=1
                        append blank
                        replvar()
                else
                        loop
                endif
        enddo
        use
        voltatela()
        relevar()
return

procedure altcli
if .not. abrearq("clientes","indcodcl","indnomcl")
        return
endif
do while .t.
        mostratexto()
        pesquisa()
        if val(mcodcli)=0
                exit
        endif
        if found()
                igualavar()
                getvar()
                read
        else
                Beep()
                mensagem(23,10,"Cliente nao cadastrado")
                loop
        endif
        if lastkey() = 27
                exit
        endif
        if confirma("Alterar esse registro?")=1
                replvar()
        else
                loop
        endif
enddo
use
voltatela()
return

procedure concli
if .not. abrearq("clientes","indcodcl")
        return
endif
do while .t.
        mostratexto()
        pesquisa()
        if val(mcodcli)=0
                exit
        endif
        if found()
                igualavar()
                mostravar()
                read
        else
                Beep()
                mensagem(23,10,"Cliente nao cadastrado")
                loop
        endif
        mensagem(23,10,"Pressione <Space> para continuar")
enddo
use
voltatela()
return

procedure exccli
if .not. abrearq("clientes","indcodcl","indnomcl")
        return
endif
do while .t.
        mostratexto()
        pesquisa()
        if val(mcodcli)=0
                exit
        endif
        if found()
                igualavar()
                mostravar()
                read
        else
                Beep()
                mensagem(23,10,"Cliente nao cadastrado")
                loop
        endif
        BeepSimples()
        if confirma("Deletar esse registro?")=1
                delete
        else
                loop
        endif
enddo
use
voltatela()
return

procedure inicvar
mcodcli=space(4)
mnomecli=space(40)
mendereco=space(40)
mcep=space(9)
mcidade=space(20)
mestado=space(2)
multcompra=ctod('  /  /  ')
msituacao=.f.
return

procedure mostratexto
set color to w/n
@6,5 clear to 17,65
@6,5 to 17,65
@8,9 say "Codigo...:"
@9,9 say "Nome.....:"
@10,9 say "Endereco.:"
@11,9 say "CEP......:"
@12,9 say "Cidade...:"
@13,9 say "Estado...:"
@15,9 say "Ultima compra:"
@16,9 say "Situacao.....:"
return

procedure voltatela
        restscreen(4,1,21,79,telavelha)

procedure mostravar
set color to w/n
@8,21 say mcodcli
@9,21 say mnomecli
@10,21 say mendereco
@11,21 say mcep
@12,21 say mcidade
@13,21 say mestado
@15,25 say multcompra picture 'DD/DD/DD'
@16,25 say if(msituacao,"CLIENTE EM DIA","CLIENTE DEVEDOR")
return

procedure getvar
set color to w/n,n/w,,n/b
@9,21 get mnomecli picture "@!X" valid mnomecli<>space(40)
@10,21 get mendereco picture "@!X"
@11,21 get mcep picture "99999-999" valid completa()
@12,21 get mcidade picture "@A!"
@13,21 get mestado picture "AA"
@15,25 get multcompra picture 'DD/DD/DD'
@16,25 get msituacao picture 'L'
return

procedure igualavar
store codcli to mcodcli
store nomecli to mnomecli
store endereco to mendereco
store cep to mcep
store cidade to mcidade
store estado to mestado
store ultcompra to multcompra
store situacao to msituacao
return

procedure replvar
replace codcli with mcodcli
replace nomecli with mnomecli
replace endereco with mendereco
replace cep with mcep
replace cidade with mcidade
replace estado with mestado
replace ultcompra with multcompra
replace situacao with msituacao
return

procedure publvar
public mcodcli,mnomecli,mendereco,mcep,mcidade
public mestado,multcompra,msituacao
return

procedure relevar
release mcodcli,mnomecli,mendereco,mcep,mcidade
release mestado,multcompra,msituacao
return

procedure pesquisa
mcodcli=0
@8,21 get mcodcli picture "9999"
read
mcodcli=strzero(mcodcli,4)
setcolor("N/W")
@8,21 say mcodcli
seek mcodcli
setcolor("W/N")
return

function completa
if val(mcep)=62100000
        mestado="CE"
        mcidade="SOBRAL              "
        KEYBOARD chr(13)+chr(13)
endif
if val(mcep)=62100
        mestado="CE"
        mcidade="SOBRAL              "
        KEYBOARD chr(13)+chr(13)
endif
if val(mcep)=62011
        mestado="CE"
        mcidade="SOBRAL              "
        KEYBOARD chr(13)+chr(13)
endif
if val(mcep)=62400
        mestado="CE"
        mcidade="CAMOCIM             "
        KEYBOARD chr(13)+chr(13)
endif
return(.t.)

