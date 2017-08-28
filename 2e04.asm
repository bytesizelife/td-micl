; 2e04.asm
global main

section .text
main:

  mov  bl, 7                    ; on charge un chiffre and BL

  mov  bh, bl                   ; on recopie le chiffre dans BH

                                ; on transforme le chiffre en code ASCII
  and  bh, 0011_1111b           ; on met les bits #8 et #7 à 0
  or   bh, 0011_0000b           ; on met les bits #6 et #5 à 1

  nop                           ; ne fait rien

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
