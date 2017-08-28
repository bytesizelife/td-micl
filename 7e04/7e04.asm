; 7e04.asm
; écrire une fonction affStr qui reçoit comme unique argument l'adresse du
; premier caractère d'une chaîne zéro-terminée, qui affiche cette chaîne sur la
; sortie standard et qui ne retourne rien. La chaîne ne peut être modifiée par
; affStr. En outre, affStr nettoie la pile de son argument.

global affStr

section .rodata
  newLine DB `\n`

section .text
affStr:
  ; sauvegarde du contexte de la pile
  push ebp
  mov  ebp, esp

  ; sauvegarde des registres
  push eax
  push ebx
  push ecx
  push edx

  ; initialisations diverses

  mov  ebx, 1                   ; stdout
  mov  ecx, [ebp+8]             ; adresse du premier caractère

.boucleChaine:
  mov  byte dl, [ecx]
  or   dl, 0                    ; tester ascii 'NUL'
  jz   .finBoucleChaine         ; fin chaîne

  mov  eax, 4                   ; write
  mov  edx, 1                   ; nombre de bytes à écrire
  int  0x80
  inc  ecx                      ; itérer les bytes
  jmp  .boucleChaine

.finBoucleChaine:
  mov  eax, 4                   ; write
  mov  ecx, newLine
  mov  edx, 1                   ; nombre de bytes à écrire
  int  0x80

  ; restauration des registres
  pop  edx
  pop  ecx
  pop  ebx
  pop  eax

  ; restauration du contexte de la pile
  pop  ebp

  ; retour avec destruction du seul argument sur 4 bytes
  ret  4
