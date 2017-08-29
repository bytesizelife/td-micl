; 7e05.asm
; écrire une fonction lgrStr, qui reçoit comme unique argument l'adresse du
; premier caractère d'une chaîne zéro-terminée et qui retourne la taille en
; octets de la chaîne, sans compter le zéro final. La chaîne ne peut être
; modifiée par lgrStr. lgrStr *ne* nettoie *pas* la pile de son argument.

global lgrStr

section .text

; fonction qui retourne la taille en octet d'une chaîne de caractères
; zéro-terminée (sans compter le caractère 'NUL' de fin de chaîne)
;
; argument 1: l'adresse du premier caractère d'une chaîne zéro-terminée.
; retour: la taille de cette chaîne en octets.
;
; nettoyage de la pile: la fonction s'en charge.
; nettoyage des arguments: l'argument reste sur la pile.

lgrStr:
  ; sauvegarde du contexte de la pile
  push ebp
  mov  ebp, esp

  ; sauvegarde des registres
;  push eax                     ; registre de retour (OK pour écraser)
  push ebx
  push ecx
;  push edx                     ; pas modifié

  ; initialisations diverses

  mov  eax, 0                   ; compteur d'octets
  mov  ebx, [ebp+8]             ; adresse du premier caractère

.boucleChaine:
  mov  byte cl, [ebx]
  or   cl, 0                    ; tester ascii 'NUL'
  jz   .finBoucleChaine         ; fin chaîne

  inc  eax                      ; incrémenter compteur
  inc  ebx                      ; itérer les caractères (octets)
  jmp  .boucleChaine

.finBoucleChaine:

  ; restauration des registres
;  pop  edx                     ; pas pushé (pas modifié)
  pop  ecx
  pop  ebx
;  pop  eax                     ; pas pushé (retour)

  ; restauration du contexte de la pile
  pop  ebp

  ; retour. Pas de destruction d'arguments
  ret
