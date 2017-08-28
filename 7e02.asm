; 7e02.asm
; échange le contenu de deux variables déclarées dans la
; section .data en utilisant une variable créée sur la pile.

global main

section .data
  var1 DW 42
  var2 DW 1337

section .text
main:

  nop

;échange
  push word [var1]              ; on met 42 sur la pile (2 bytes)
  push word [var2]              ; on met 1337 sur la pile (2 bytes)
  pop  word [var1]              ; on récupère 1337 depuis la pile vers var1
  pop  word [var2]              ; on récupère 42 depuis la pile vers var2

;fin
  mov  eax, 1                   ; exit
  mov  ebx, 0                   ; ok
  int 0x80
