; 7e06.asm
; écrire une fonction estPair, qui reçoit comme unique argument un entier
; codé sur 4 octets et qui retourne 1 si l'entier est pair, 0 sinon.
; Cette fonction ne nettoie pas la pile de son argument.

global estPair

section .text

; fonction qui retourne 1 si l'argument est pair, 0 sinon.
;
; argument 1: un entier sur 4 octets (dword).
; retour: 1 si pair, 0 si impair.
;
; nettoyage de la pile: la fonction s'en charge.
; nettoyage des arguments: l'argument reste sur la pile.

estPair:
  ; sauvegarde du contexte de la pile
  push ebp
  mov  ebp, esp

  ; sauvegarde des registres
;  push eax                     ; registre de retour (OK pour écraser)
  push ebx
;  push ecx                     ; pas modifié
;  push edx                     ; pas modifié

  ; initialisations diverses

  mov  eax, 0                   ; retour initialisé à 'impair'
  mov  ebx, [ebp+8]             ; dword entier à tester

  ; test de parité
  bt   ebx, 0                   ; test bit de poid faible
  jc   .fin                     ; saut si impair
  mov  eax, 1			; sinon, retour assigné 'pair'

.fin:

  ; restauration des registres
;  pop  edx                     ; pas pushé (pas modifié)
;  pop  ecx                     ; pas pushé (pas modifié)
  pop  ebx
;  pop  eax                     ; pas pushé (retour)

  ; restauration du contexte de la pile
  pop  ebp

  ; retour. Pas de destruction d'arguments
  ret
