; 6e03.asm
global main

section .bss
  bufferSave    RESB 1          ; mémoire tampon stdin/out
  descrFichier1 RESD 1          ; descripteur fichier 1
  descrFichier2 RESD 1          ; descripteur fichier 2

section .rodata
  nomFichier1 DB `brol1`, 0
  nomFichier2 DB `brol2`, 0
  msgErreur   DB `impossible d'ouvrir le fichier\n`
  msgErreurLg DD $ - msgErreur

section .text
main:
  nop

  mov eax, 5                    ; open
  mov ebx, nomFichier1          ; adresse nomFichier1
  mov ecx, 02q | 02000q         ; RDWR & APPEND
  int 0x80

  bt  eax, 31                   ; test signe
  jc  _erreurouverture          ; si eax négatif

  mov [descrFichier1], eax      ; sauver descripteur fichier 1

  mov eax, 5                    ; open
  mov ebx, nomFichier2          ; adresse nomFichier2
  mov ecx, 0q                   ; RDONLY
  int 0x80

  bt  eax, 31                   ; test signe
  jc  _erreurouverture          ; si eax négatif

  mov [descrFichier2], eax      ; sauver descripteur fichier 2

_while:
  mov eax, 3                    ; read
  mov ebx, [descrFichier2]      ; descripteur fichier 2
  mov ecx, bufferSave           ; adresse du buffer
  mov edx, 1                    ; nombre de bytes
  int 0x80

  bt  eax, 31                   ; test signe
  jc  _erreur                   ; si eax négatif

  or  eax, 0                    ; si 0 caractère lu
  jz  _eot                      ; alors End Of Transmission (Ctrl-D)

  mov eax, 4                    ; write
  mov ebx, [descrFichier1]      ; descripteur fichier 1
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
