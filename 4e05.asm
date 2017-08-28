; 4e05.asm
global main

section .bss
  tab1 RESW 10

section .text
main:

  mov eax, tab1                 ; adresse de tab1 pour débugger

  mov word [tab1 + 2 * 2], 3         ; on assigne la valeur 3 à la 3ème case
  mov word [tab1 + 2 * 7], 8         ; on assigne la valeur 8 à la 8ème case

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
