; 3e01.asm
global main

section .text
main:

  mov eax, 42                   ; du contenu non-nul

  or  eax, 0
  jz  _else                     ; si EAX nul: sauter
                                ; = si EAX non-nul: MOV EBX, 1
  mov ebx, 1

_else:

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
