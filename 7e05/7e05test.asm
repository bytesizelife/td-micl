; 7e05test.asm
global main
extern lgrStr

section .rodata
  uneChaine DB `Vive les vacances!`, 0

section .text
main:
  push dword uneChaine
  call lgrStr

  nop                           ; debug: check valeur retour dans eax

  mov  eax, 1                   ; exit
  mov  ebx, 0                   ; ok
  int  0x80
