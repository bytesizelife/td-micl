; 3e04.asm
global main

section .text
main:

  mov edi, 1336                 ; un nombre

  bt  edi, 0                    ; test si multiple de 2
  jnc _multiple2
  mov esi, 0                    ; EDI impair
  jmp _finsi                    ; sauter

_multiple2:

  bt  edi, 1                    ; test si multiple de 4
  jnc _multiple4
  mov esi, 1                    ; EDI multiple de 2
  jmp _finsi                    ; sauter

_multiple4:

  bt  edi, 2                     ; test si multiple de 8
  jnc _multiple8
  mov esi, 2                    ; EDI multiple de 4
  jmp _finsi

_multiple8:

  mov esi, 3                    ; EDI multiple de 8

_finsi:

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
