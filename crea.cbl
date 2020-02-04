       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREA.
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
       PROCEDURE DIVISION.
       PRINCIPAL.
           OPEN OUTPUT AMIGOS.
           CLOSE AMIGOS.

           STOP RUN.