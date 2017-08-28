; 3e02.asm
global main

section .text
main:

  mov eax, 43                   ; du contenu pair

  bt  eax, 0                    ; pair ou impair?
  jc  _impair                   ; si EAX pair: MOV EBX, 0
  mov ebx, 0
  jmp _finsi                    ; sauter

_impair:                        ; si EAX impair: MOV EBX, 1
  mov ebx, 1

_finsi:

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
