       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAPTURA.
      *------------------------------------------
       ENVIRONMENT DIVISION.
      *------------------------------------------ 
       INPUT-OUTPUT SECTION.
      *------------------------------------------
       FILE-CONTROL.
           SELECT AMIGOS ASSIGN TO RANDOM "AMIGOS.DAT"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY IS CODIGO.
      *******************************************
       DATA DIVISION.
      *------------------------------------------
       FILE SECTION.
      *------------------------------------------
       FD AMIGOS.
       01 REG-AMIGOS.
        02 CODIGO   PIC 9(5).
        02 NOMBRE   PIC X(30).
        02 TELEFONO PIC X(20).
      *------------------------------------------
       WORKING-STORAGE SECTION.
       01 VARIABLES.
        02 SW PIC 9.
        02 TECLA PIC X.
      *------------------------------------------
       PROCEDURE DIVISION.
       PRINCIPAL.
           PERFORM ABRIR-ARCHIVO.
           PERFORM PROCESAR UNTIL SW = 1.
           PERFORM CERRAR-ARCHIVO.
           STOP RUN.
      *------------------------------------------   
       ABRIR-ARCHIVO.
           OPEN I-O AMIGOS.
      *------------------------------------------
       LIMPIAR-PANTALLA.
           DISPLAY " " LINE 1 POSITION 1 ERASE EOS.
      *------------------------------------------
       PROCESAR.
           PERFORM LIMPIAR-PANTALLA.
           DISPLAY "Código..." LINE 10 POSITION 10.
           DISPLAY "Nombre..." LINE 11 POSITION 10.
           DISPLAY "Telefono..." LINE 12 POSITION 10.
           ACCEPT CODIGO LINE 10 POSITION 30 PROMPT NO BEEP.
           ACCEPT NOMBRE LINE 11 POSITION 30 PROMPT NO BEEP.
           ACCEPT TELEFONO LINE 12 POSITION 30 PROMPT NO BEEP.
           WRITE REG-AMIGOS
                 INVALID KEY
                   DISPLAY "No pude grabar" LINE 23 POSITION 30
                   ACCEPT TECLA LINE 23 POSITION 78 PROMPT
                 NOT INVALID KEY
                   DISPLAY "Registro grabado" LINE 23 POSITION 30
                   ACCEPT TECLA LINE 23 POSITION 78 PROMPT
                END-WRITE.
                DISPLAY "Desea Grabar Otro Cliente ?" LINE 23 POSITION 30
                ACCEPT TECLA LINE 23 POSITION 78 PROMPT
                IF TECLA = "N" OR "n" THEN
                   MOVE 1 TO SW
                END-IF.
      *------------------------------------------
       CERRAR-ARCHIVO.
           CLOSE AMIGOS.