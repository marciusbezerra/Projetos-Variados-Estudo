IDENTIFICATION DIVISION.
PROGRAM-ID.
EASYCALC.
AUTHOR.
*****************************************
* Calcula o pagamento bruto simples
* Nome do arquivo: EASYCALC.COB
*****************************************
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE COMPUTER. IBM-PS/2.
OBJECT COMPUTER. IBM-PS/2.
INPUT-OUTPUT SECTION.
*
* Envia a saida para o console do DOS
* (a tela do PC), mantendo a simplicidade do exemplo
*
FILE-CONTROL.
    SELECT OUTFILE ASSIGN TO "CON:".
DATA DIVISION.
FILE SECTION.
FD  OUTFILE RECORD IS 500 BYTES.
01  OUT-REC.
    02  FILLER     PIC X(48)
WORKING-STORAGE SECTION.
01  WORK-AREAS.
    02  RATE     PIC S9999      VALUE IS ZERO.
    02  HOURS    PIC S99        VALUE IS ZERO.
    02  GROSS    PIC S9(5)V99   VALUE IS ZERO.
01  DETAIL-LINE.
    02  FILLER   PIX X(18) VALUE 'Your gross pay is '.
    02  FGROSS   PIC $$,$$9.99.
    02  FILLER   PIC X(21) VALUE ', enjoy your weekend!'.
*
PROCEDURE DIVISION.
Begin.
  OPEN OUTPUT OUTFILE.
  DISPLAY "What is rate fer hour? ".
  ACCEPT RATE.
  DISPLAY "How many hours did you work? ".
  ACCEPT HOURS.
*
* Calcula e imprime Gross Pay (o pagamento bruto)
*
MULTIPLY RATE BY HOURS GIVING GROSS.
MOVE GROSS TO FGROOS OF DETAIL-LINE.
WRITE OUT-REC FROM DETAIL-LINE.
CLOSE OUTFILE.
STOP RUN.
