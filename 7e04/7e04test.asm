; 7e04test.asm
global main
extern affStr

section .rodata
  uneChaine DB `Vive les vacances!`, 0

section .text
main:
  push dword uneChaine
  call affStr

  mov  eax, 1                   ; exit
  mov  ebx, 0                   ; ok
  int  0x80
