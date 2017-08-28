; 3e03.asm
global main

section .text
main:

  mov eax, 1337                 ; un nombre
  mov ebx, 42                   ; un autre nombre

  mov ecx, eax                  ; sauvegarde EAX dans ECX

  xor ecx, ebx                  ; comparer les deux (MODIFIE ECX!!!)

  jz  _pareil

                                ; XOR SWAP (plus besoin de 3ème registre!)
  xor eax, ebx
  xor ebx, eax
  xor eax, ebx

  jmp _finsi

_pareil:                        ; On met les deux à 0.
  mov eax, 0
  mov ebx, 0

_finsi:

  ;fin
  mov eax, 1
  mov ebx, 0
  int 0x80
