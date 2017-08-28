; 2e02.asm
global main

section .text
main:
  nop

  mov al, 'd'                   ; on charge une lettre minuscule dans al

; and al, 11011111b             ; masque 'AND' (mettre à 0: seulement bit #5)
                                ; minuscule -> majuscule

  xor al, 00100000b             ; masque 'XOR' (inverser: seulement bit #5)
                                ; minuscule <-> majuscule

  nop                           ; ne fait rien

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
