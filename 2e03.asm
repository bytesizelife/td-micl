; 2e03.asm
global main

section .text
main:
  nop

  mov  al, 'd'                  ; on charge une lettre minuscule dans AL

  btr  ax, 5                    ; 'Bit Test and Reset(?)' sur bit #5
                                ; Seulement sur 16 ou 32 bits! -> AX

  nop                           ; ne fait rien

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
