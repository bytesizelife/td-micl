; 4e02.asm
global main

section .data
  var1 DD 42                    ; on déclare une variable entière de 4 bytes

section .text
main:

  mov eax, var1                 ; on met son adresse dans eax
  mov ebx, [var1]               ; on met son contenu dans ebx

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
