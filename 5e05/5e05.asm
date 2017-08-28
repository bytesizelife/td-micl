; 5e05.asm
global main

section .rodata
  fichier DB `brol`, 0          ; nom du fichier

section .bss
  descr  RESD 1                 ; descripteur de fichier

section .text
main:

  mov eax, 5                    ; numéro de service: 5 (open)
  mov ebx, fichier              ; adresse du nom du fichier
  mov ecx, 0q                   ; RDONLY
  int 0x80

  bt  eax, 31
  jnc _ok
  jmp _erreur

_ok:
  mov dword [descr], eax        ;sauvegarde eax (descripteur fichier)

  mov eax, 19                   ; lseek(?)
  mov ebx, [descr]              ; descripteur fichier
  mov ecx, 0                    ; offset
  mov edx, 2                    ; SEEK_END
  int 0x80

  bt  eax, 31
  jnc _fermer_ok
  jmp _fermer_erreur

_fermer_ok:
  mov ecx, eax                  ; taille du fichier dans ecx (énoncé)

  mov eax, 6                    ; numéro de service: 6 (close)
  mov ebx, [descr]              ; descripteur de fichier
  int 0x80

  bt  eax, 31
  jnc _fin
  jmp _erreur

_fermer_erreur:
  mov eax, 6                    ; numéro de service: 6 (close)
  mov ebx, [descr]              ; descripteur de fichier
  int 0x80

  jmp _erreur

_fin:
  mov eax, 1                    ; numéro de service: 1 (exit)
  mov ebx, 0                    ; retourner ok (0)
  int 0x80

_erreur:
  mov eax, 1                    ; numéro de service: 1 (exit)
  mov ebx, 1                    ; retourner erreur (1)
  int 0x80
