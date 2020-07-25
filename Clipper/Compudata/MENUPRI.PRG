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
   @ li,02 prompt [Cadastros] messa [M¢dulos de cadastros]
   @ LI,17 prompt [Consultas] messa [Consultas de Clientes, Bancos, Vendedores e duplicatas]
   @ LI,31 prompt [Relat¢rios] messa [M¢dulo de relat¢rios]
   @ LI,75 prompt [Sair] messa [Volta ao Sistema Operacional]
       menu to mop
       setcolor("")
       SET KEY 28 TO
       SET KEY -3 TO
       set key 24 to
       menupri:=savescreen(00,00,24,79)
       do case
          case mop=1
              do menucad
          case mop=2
              do menucON
          CASE MOP=3
              DO menurel
          case mop=4
              do menusai
          case mop=0
               setcolor("GR+/b,W+*/B")
               @ li,02 say [Cadastros]
               @ LI,17 say [Consultas] 
               @ LI,31 say [Relat¢rios]
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
