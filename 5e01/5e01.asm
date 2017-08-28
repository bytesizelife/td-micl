; 5e01.asm
global main

section .bss
  descr RESD 1

section .rodata
  nomfich  DB `brol`, 0
  chnok    DB `fichier ouvert avec succès\n`
  chnoklg  DD $ - chnok
  chnerr   DB `échec lors de l'ouverture du fichier\n`
  chnerrlg DD $ - chnerr

section .text
main:

  mov eax, 5                    ; numéro de service: 5 - open
  mov ebx, nomfich              ; ADRESSE du nom du fichier, zero-terminé
  mov ecx, 0q                   ; O_RDONLY - 00
  int 0x80                      ; appel système

  bt  eax, 31                   ; bit de signe - CF
  jc  _erreur                   ; sauter si eax négatif


_ok:
  mov dword [descr], eax        ; sauvegarde descripteur fichier brol
  mov eax, 4                    ; numéro de service: 4 - write
  mov ebx, 1                    ; descripteur de fichier: 1 (écran)
  mov ecx, chnok                ; adresse de ce qui doit être écrit
  mov edx, [chnoklg]            ; la tête de lecture est avancée du nombre de bytes écrits
  int 0x80

  mov eax, 6                    ; numéro de service: 6 (close)
  mov ebx, [descr]              ; descripteur fichier brol
  int 0x80
  jmp _fin

_erreur:
  mov eax, 4                    ; numéro de service: 4 (write)
  mov ebx, 1                    ; descripteur de fichier: 1 (écran)
  mov ecx, chnerr               ; adresse de ce qui doit être écrit
  mov edx, [chnerrlg]           ; la tête de lecture est avancée du nombre de bytes écrits
  int 0x80

  mov eax, 1                    ; numéro de service: 1 (exit)
  mov ebx, 1                    ; retourner erreur (1)
  int 0x80

_fin:
  mov eax, 1                    ; numéro de service: 1 (exit)
  mov ebx, 0                    ; retourner ok (0)
  int 0x80
