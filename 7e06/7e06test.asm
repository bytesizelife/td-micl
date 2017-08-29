; 7e06test.asm
global main
extern estPair

section .text
main:
  push dword 1337
  call estPair
  nop                           ; debug: check valeur retour dans eax

  push dword 42
  call estPair
  nop                           ; debug: check valeur retour dans eax

  mov  eax, 1                   ; exit
  mov  ebx, 0                   ; ok
  int  0x80
