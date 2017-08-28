; 5e02.asm
global main

section .bss
  nbchar RESB 2

section .text
main:
  mov esi, 5
  mov eax, esi
  mov [nbchar],  al
  and byte [nbchar], 0011_1111b
  or  byte [nbchar], 0011_0000b
  mov byte [nbchar+1], `\n`

  mov eax, 4                    ; numéro de service: 4 (write)
  mov ebx, 1                    ; descripteur de fichier: 1 (écran)
  mov ecx, nbchar               ; adresse de ce qui doit être écrit
  mov edx, 2                    ; la tête de lecture est avancée du nombre de bytes écrits
  int 0x80

 ;fin
  mov eax, 1                    ; numéro de service: 1 (exit)
  mov ebx, 0                    ; retourner ok (0)
  int 0x80
