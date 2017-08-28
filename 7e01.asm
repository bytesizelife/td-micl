; 7e01.asm
; échange le contenu des registres eax et ebx en utilisant
; une variable locale créée sur la pile.

global main

section .text
main:

  mov  eax, 42
  mov  ebx, 1337

;échange
  push eax                      ; on met 42 sur la pile (4 bytes)
  mov  eax, ebx                 ; on met 1337 dans eax
  pop  ebx                      ; on récupère 42 depuis la pile vers ebx

;fin
  mov  eax, 1                   ; exit
  mov  ebx, 0                   ; ok
  int 0x80
