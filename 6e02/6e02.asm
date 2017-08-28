; 6e02.asm
global main

section .bss
  bufferSave   RESB 1           ; mémoire tampon stdin/out
  descrFichier RESD 1           ; descripteur fichier

section .rodata
  nomFichier  DB `brol`, 0
  msgErreur   DB `impossible d'ouvrir le fichier\n`
  msgErreurLg DD $ - msgErreur

section .text
main:
  nop

  mov eax, 5                    ; open
  mov ebx, nomFichier           ; adresse nomFichier
  mov ecx, 0q                   ; RDONLY
  int 0x80

  bt  eax, 31                   ; test signe
  jc  _erreurouverture          ; si eax négatif

  mov [descrFichier], eax       ; sauver descripteur fichier

_while:
  mov eax, 3                    ; read
  mov ebx, [descrFichier]       ; descripteur fichier
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

_erreurouverture:
  mov eax, 4                    ; write
  mov ebx, 1                    ; stdout
  mov ecx, msgErreur            ; adresse message erreur
  mov edx, [msgErreurLg]        ; nombre de bytes
  int 0x80

_erreur:
  mov eax, 1                    ; exit
  mov ebx, 1                    ; erreur
  int 0x80
