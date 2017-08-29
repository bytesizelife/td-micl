; 7e08test.asm
global main
extern nbPairGen

section .text
main:
  push dword 1337		; argument 1 (impair)
  push dword 42			; argument 2 (pair)
  push dword 5			; argument 3 (impair)
  push dword 17			; argument 4 (impair)
  push dword 11			; argument 5 (impair)
  push dword 10			; argument 6 (pair)
  push dword 41			; argument 7 (impair)
  push dword 97			; argument 8 (impair)
  push dword 0			; argument 9 (pair)
  push dword 7			; argument 10 (impair)
  push dword 101		; argument 11 (impair)
  push dword 32			; argument 12 (pair)
  push dword 81			; argument 13 (impair)
  push dword 78299		; argument 14 (impair)
  push dword 842		; argument 15 (pair)
  push dword 21			; argument 16 (impair)
  push dword 501		; argument 17 (impair)
  push dword 12			; argument 18 (pair)
  push dword 28			; argument 19 (pair)
  push dword 1			; argument 20 (impair)
  push dword 20			; argument 21 (le nombre des autres arguments)
  call nbPairGen
  nop                           ; debug: eax = 7 ?

  add  esp, 4*21		; nettoyer la pile de ses arguments

  mov  eax, 1                   ; exit
  mov  ebx, 0                   ; ok
  int  0x80
