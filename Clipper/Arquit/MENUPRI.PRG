C=-1
C2=1
I=0
FOR I=1 TO 7
    SCROLL(0,0,24,34,,c-1)
    SCROLL(0,35,24,79,,c2+1)
    SCROLL(0,0,12,79,c)
    SCROLL(13,0,24,79,c2)
    C--
    C2++
    INKEY(.1)
NEXT
setcolor("X/gb+,W+*/gB+")
clear
mop=1
do tela1
mtel=savescreen(07,02,24,78)
do while .t.
   LI=4
   restscreen(07,02,24,78,mtel)
   set key 24 to seta24
   SET KEY CTRLF9 TO HORA
   SET KEY CTRLF10 TO CALC
   setcolor("/b")
   @ 22,02 CLEAR TO 22,77
   setcolor("GR+/b,W+*/B")
   @ li,02 prompt [Clientes] messa [Cadastra, Altera e Exlcui Ficha de Clientes]
   @ LI,17 prompt [C lculos] messa [Menu de Vigas, Pilares e Configura‡Æo]
   @ LI,31 prompt [Consultas] messa [Consulta de Clientes, Menu de Vigas e Pilares]
   @ LI,44 prompt [Relat¢rios] messa [Menu de Clientes, Vigas e Pilares]
   @ LI,59 PROMPT [Utilit rios] messa [Indexa Arquivos, Aviso MS-DOS]
   @ LI,75 prompt [Sair] messa [Volta ao Sistema Operacional]
       menu to mop
       setcolor("")
       SET KEY 28 TO
       SET KEY -3 TO
       set key 24 to
       menupri:=savescreen(00,00,24,79)
       do case
          case mop=1
              do menucli
          case mop=2
              do menucal
          case mop=3
              do menucON
          CASE MOP=4
              DO menurel
          case mop=5
               PUBLIC TELASAI:=SAVESCREEN(00,00,24,79)
              do menutil
          case mop=6
              do menusai
          case mop=0
               setcolor("GR+/b,W+*/B")
               @ li,02 say [Clientes]
               @ LI,17 say [C lculos]
               @ LI,31 say [Consultas] 
               @ LI,44 say [Relat¢rios]
               @ LI,59 say [Utilit rios]
               @ 22,02 say padc([Encerramento do Programa],75)
               set key 4 to
               set key 19 to
               fim:=savescreen(10,25,13,56)
               set cursor on
               setcolor("w+/b")
               @ 04,75 say [Sair]
               quadro1(10,25,12,54)
               BOXSHADOW(10,25,12,54)
               setcolor([W+/b,gr+/b])
               clear gets
               sn=[N]
               @ 11,27 say [Sair do sistema ->] &&t sn pict [@!] valid sn $[SN]
               SETCOLOR([W+/b,GR+*/b])
               @ 11,46 prompt [Sim]
               @ 11,50 prompt [NÆo]
               menu to SAIR
               do case
                  case sair=1
                        SET CURSOR OFF
                        I=0
                        FOR I=1 TO 13
                            SCROLL(0,0,24,79,,I)
                            INKEY(.1)
                        NEXT
                        close all
                        set key -4 to
                        set score on
                        set key 4 to
                        set key 19 to
                        SETCOLOR("")
                        set color to
                        SET CURSOR ON
                        close all
                        clear
                        exit
                  Case SAIR=2
                        set key 4 to
                        set key 19 to
                        restscreen(10,25,13,56,fim)
                        loop
                  other
                        set key 4 to
                        set key 19 to
                        restscreen(10,25,13,56,fim)
                        loop
               endcase
           other
           loop
      endcase
enddo
close all
clear all
DO FIM
