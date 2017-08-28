; 6e01.asm
global main

section .bss
  bufferSave RESB 1             ; mémoire tampon stdin/out

section .text
main:
  nop

_while:
  mov eax, 3                    ; read
  mov ebx, 0                    ; stdin
  mov ecx, bufferSave           ; adresse du buffer
  mov edx, 1                    ; nombre de bytes
  int 0x80

  bt  eax, 31                   ; test signe
  jc  _erreur                   ; si eax négatif

  or  eax, 0                    ; si 0 caractère lu
  jz  _eot                      ; alors End Of Transmission (Ctrl-D)

  mov eax, 4                    ; write
  mov ebx, 1                    ; stdout
  mov ecx, bufferSave           ; adresse du buffer
  mov edx, 1                    ; nombre de bytes
  int 0x80

  bt  eax, 31                   ; test signe
  jc  _erreur                   ; si eax négatif

  jmp _while                    ; boucle 'infinie' (on utilise des break (jz, jc))

_eot:
  mov eax, 1                    ; exit
  mov ebx, 0                    ; ok
  int 0x80

_erreur:
  mov eax, 1                    ; exit
  mov ebx, 1                    ; erreur
  int 0x80
