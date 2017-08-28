; 4e06.asm
global main

section .rodata
  chn1 DB `Helllo, World !\n`   ; accents graves -> \n = 1 caractère
  chn2 DB 'nothing interesting' ; quotes ou double quotes -> \n = 2 caractères

section .text
main:

  mov ebx, chn1                 ; adresse de chn1 pour débugger
  mov eax, chn2 - chn1          ; la taille de la chaîne 1

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
