comeco:
COLOR 2, 3
LOCATE 1, 1
PRINT STRING$(6000, 177)
CALL Janela( 16, 62, 6, 15, "TRoca de sistema", 1, 14, 14, 1)
COLOR 27
PRINT "1.";
COLOR 14
PRINT " Windows 98 para trabalho"
LOCATE 10, 17
COLOR 27
PRINT "2."
LOCATE 10, 19
COLOR 14
PRINT " Windows 98 para testes"
LOCATE 12, 19
COLOR 11
PRINT "Que sistema vocˆ est  usando agora ? ";
COLOR 7
PRINT CHR$(219)
DO
        X$ = INKEY$
LOOP UNTIL X$ = CHR$(49) OR X$ = CHR$(50) OR X$ = CHR$(27)
IF X$ = CHR$(27) THEN
        SCREEN 0, 0
        CLS
        END
END IF
IF X$ = CHR$(49) THEN
        SOUND 350, 5
        CAll Janela (18, 60, 7, 13, "Confirma‡Æo", 4, 14, 14, 4)
        PRINT "Tem certeza que deseja reiniciar com o "
        LOCATE 11, 19
        PRINT "Windows para teste ? (";
        COLOR 27: PRINT "S";
        COLOR 14: PRINT "/";
        COLOR 27: PRINT "N";
        COLOR 14: PRINT ") ";
        DO
                X$ = INKEY$
        LOOP UNTIL UCASE$(X$) = "S" OR UCASE$(X$) = "N" OR X$ = CHR$(27)
        IF X$ = CHR$(27) THEN GOTO comeco
        IF UCASE$(X$) = "N" THEN GOTO comeco
        SOUND 450, 5
        SCREEN 0, 0
        CLS
        SHELL "C:"
        SHELL "CD\"
        SHELL "ATTRIB -H -R -S *.*"
        SHELL "MD WORIG"
        SHELL "COPY *.* C:\WORIG"
        KILL "C:\*.*"
        SHELL "COPY C:\WTEST\*.* C:"
        SHELL "DELTREE/Y C:\WTEST > NULL"
END IF
IF X$ = CHR$(50) THEN
        SOUND 350, 5
        call Janela (18, 60, 7, 13, "Confirma‡Æo", 4, 14, 14, 4)
        PRINT "Tem certeza que deseja reiniciar com o "
        LOCATE 11, 19
        PRINT "Windows para trabalho ? (";
        COLOR 27: PRINT "S";
        COLOR 14: PRINT "/";
        COLOR 27: PRINT "N";
        COLOR 14: PRINT ") ";
        DO
                X$ = INKEY$
        LOOP UNTIL UCASE$(X$) = "S" OR UCASE$(X$) = "N" OR X$ = CHR$(27)
        IF X$ = CHR$(27) THEN GOTO comeco
        IF UCASE$(X$) = "N" THEN GOTO comeco
        SOUND 450, 5
        SCREEN 0, 0
        CLS
        SHELL "C:"
        SHELL "CD\"
        SHELL "ATTRIB -H -R -S *.*"
        SHELL "MD WTEST"
        SHELL "COPY *.* C:\WTEST"
        KILL "C:\*.*"
        SHELL "COPY C:\WORIG\*.* C:"
        SHELL "DELTREE/Y C:\WORIG > NULL"
END IF

call Janela (16, 62, 8, 15, "TRoca de sistema", 4, 14, 14, 4)
COLOR 30
PRINT "Reinicializa seu sistema agora ..."
X$ = ""
DO
        X$ = INKEY$
LOOP UNTIL X$ <> ""
SCREEN 0, 1
CLS

SUB Janela (X1%, X2%, Y1%, Y2%, Titulo$, CorBarraTitulo%, CorFontTitulo%, CorBorda%, CorFundo%)
        LOCATE Y1%, X1%
        COLOR CorBorda%, CorBarraTitulo%
        PRINT CHR$(184) + STRING$(X2% - X1%, 196) + CHR$(198)
        LOCATE Y1% + 1, X1%
        PRINT CHR$(179);
        COLOR CorBarraTitulo%
        PRINT STRING$(X2% - X1%, 219);
        COLOR CorBorda%, CorBarraTitulo%
        PRINT CHR$(179);
        COLOR CorFontTitulo%, CorBarraTitulo%
        TamTit% = LEN(Titulo$)
        LOCATE Y1% + 1, X1% + (INT((X2% - X1%) / 2) - INT(TamTit% / 2))
        PRINT UCASE$(Titulo$)
        LOCATE Y1% + 2, X1%
        COLOR CorBorda%, CorBarraTitulo%
        PRINT CHR$(190) + STRING$(X2% - X1%, 196) + CHR$(155)
        Inicio% = Y1% + 3
        Fim% = Y2% - 1
        FOR I% = Inicio% TO Fim%
                COLOR CorBorda%, CorFundo%
                LOCATE I%, X1%
                PRINT CHR$(179);
                COLOR CorFundo%
                PRINT STRING$(X2% - X1%, 219);
                COLOR CorBorda%, CorFundo%
                PRINT CHR$(179);
        NEXT
        LOCATE I%, X1%
        COLOR CorBorda%, CorFundo%
        PRINT CHR$(207) + STRING$(X2% - X1%, 196) + CHR$(15)
        COLOR CorBorda%, CorFundo%
        LOCATE Inicio%, X1% + 1
END SUB

