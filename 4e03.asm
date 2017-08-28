; 4e03.asm

global main

section .bss
  var1 RESD 1                   ; on déclare une variable sur 4 bytes
                                ; implicitement initialisée à 0.

section .text
main:

  mov dword [var1], 42          ; on lui assigne la valeur 42.

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
