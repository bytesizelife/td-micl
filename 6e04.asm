;6e04.asm
global main

section .rodata
  aLaLigne DB `\n`

section .data
  monChar  DB `0`

section .text
main:
  nop

  mov esi, 10                   ; pour i de 10 (à 1 par -1)

_while:
  mov eax, 4                    ; write
  mov ebx, 1                    ; stdout
  mov ecx, monChar              ; adresse de monChar
  mov edx, 1                    ; nombre de bytes
  int 0x80

  mov eax, 4                    ; write
  mov ebx, 1                    ; stdout
  mov ecx, aLaLigne             ; adresse de aLaLigne
  mov edx, 1                    ; nombre de bytes
  int 0x80

  inc byte [monChar]            ; monChar++
  dec esi                       ; esi--

  or  esi, 0                    ; test nullité
  jz  _fin                      ; jump si zéro
  jmp _while                    ; boucler

_fin:
  mov eax, 1                    ; exit
  mov ebx, 0                    ; ok
  int 0x80
