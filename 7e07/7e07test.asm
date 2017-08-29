; 7e07test.asm
global main
extern nbPair

section .text
main:
  push dword 1337		; argument 1 (impair)
  push dword 42			; argument 2 (pair)
  call nbPair
  nop                           ; debug: eax = 1 ?

  push dword 42			; argument 1 (pair)
  push dword 1337		; argument 2 (impair)
  call nbPair
  nop                           ; debug: eax = 1 ?

  push dword 33			; argument 1 (impair)
  push dword 1337		; argument 2 (impair)
  call nbPair
  nop                           ; debug: eax = 0 ?

  push dword 42			; argument 1 (pair)
  push dword 88			; argument 2 (pair)
  call nbPair
  nop                           ; debug: eax = 2 ?

  mov  eax, 1                   ; exit
  mov  ebx, 0                   ; ok
  int  0x80
