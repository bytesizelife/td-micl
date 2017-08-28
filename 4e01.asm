; 4e01.asm
global main

section .data
  var1 DB 1
  var2 DB 2
  var3 DW 0x0304
  ; la section des données occupe 4 bytes
  ; son contenu est 0x01, 0x02, 0x04, 0x03

section .text
main:

  mov  al, [var1]               ; al contient 0x01
  mov eax, var1                 ; eax contient l'adresse de var1
  mov  ax, [var1]               ; ax contient 0x0201
  mov  al, [var3]               ; al contient 0x04

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
