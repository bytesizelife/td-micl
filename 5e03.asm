; 5e03.asm
global main

section .rodata
  chpair     DB `pair\n`
  chpairlg   DD $ - chpair
  chimpair   DB `impair\n`
  chimpairlg DD $ - chimpair

section .text
main:
  mov edx, 23
  bt  edx, 0
  jc  _impair

  ;pair
  mov eax, 4                    ; numéro de service: 4 (write)
  mov ebx, 1                    ; descripteur de fichier: 1 (écran)
  mov ecx, chpair               ; adresse de ce qui doit être écrit
  mov edx, [chpairlg]           ; la tête de lecture est avancée du nombre de bytes à écrire
  int 0x80
  jmp _fin                      ; sauter

_impair:
  mov eax, 4                    ; numéro de service: 4 (write)
  mov ebx, 1                    ; descripteur de fichier: 1 (écran)
  mov ecx, chimpair             ; adresse de ce qui doit être écrit
  mov edx, [chimpairlg]         ; la tête de lecture est avancée du nombre de bytes à écrire
  int 0x80

_fin:
  mov eax, 1                    ; numéro de service: 1 (exit)
  mov ebx, 0                    ; retourner ok (0)
  int 0x80
