; 5e04.asm
global main

section .rodata
  chpair     DB `pair\n`
  chpairlg   DD $ - chpair
  chimpair   DB `impair\n`
  chimpairlg DD $ - chimpair
  fichier    DB `resultat`, 0

section .bss
  nombre RESD 1
  descr  RESD 1

section .text
main:

  mov edx, 53                   ; un nombre

  mov dword [nombre], edx       ; sauvegarde edx (nombre)

  mov eax, 5                    ; numéro de service: 5 (open)
  mov ebx, fichier              ; adresse du nom du fichier
  mov ecx, 100q | 2q            ; CREATE | RDWR
  int 0x80

  bt  eax, 31
  jnc _ok
  jmp _erreur

_ok:
  mov dword [descr], eax        ; sauvegarde eax (descripteur fichier)
  mov eax, [nombre]
  bt  eax, 0
  jc  _impair

  ;pair
  mov eax, 4                    ; numéro de service: 4 (write)
  mov ebx, [descr]              ; descripteur de fichier
  mov ecx, chpair               ; adresse de ce qui doit être écrit
  mov edx, [chpairlg]           ; la tête de lecture est avancée du nombre de bytes à écrire
  int 0x80

  bt  eax, 31
  jnc _fermer
  jmp _erreur

_impair:
  mov eax, 4                    ; numéro de service: 4 (write)
  mov ebx, [descr]              ; descripteur de fichier
  mov ecx, chimpair             ; adresse de ce qui doit être écrit
  mov edx, [chimpairlg]         ; la tête de lecture est avancée du nombre de bytes à écrire
  int 0x80

  bt  eax, 31
  jnc _fermer
  jmp _erreur

_fermer:
  mov eax, 6                    ; numéro de service: 6 (close)
  mov ebx, [descr]              ; descripteur de fichier
  int 0x80

  bt  eax, 31
  jnc _fin
  jmp _erreur

_fin:
  mov eax, 1                    ; numéro de service: 1 (exit)
  mov ebx, 0                    ; retourner ok (0)
  int 0x80

_erreur:
  mov eax, 1                    ; numéro de service: 1 (exit)
  mov ebx, 1                    ; retourner erreur (1)
  int 0x80
