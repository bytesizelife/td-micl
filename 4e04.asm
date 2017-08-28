; 4e04.asm
global main

section .data
  b1 DB 0
  b2 DB 0
  b3 DB 0
  b4 DB 0

section .rodata
  nb DD 0x12345678

section .text
main:

  mov eax, b1                   ; adresse de b1 pour débugger

  mov  bl, [nb+3]               ; on met le byte de poids fort (0x12) dans b1
  mov [b1],  bl                 ; il faut procéder en 2 étapes

  mov  bl, [nb+2]               ; on met le byte 0x34 dans b2
  mov [b2],  bl

  mov  bl, [nb+1]               ; on met le byte 0x56 dans b3
  mov [b3],  bl

  mov  bl, [nb]                 ; on met le byte de poids faible (0x78) dans b4
  mov [b4],  bl

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
