; 7e07.asm
; écrire une fonction nbPair, qui reçoit 2 entiers codés sur 4 octets.
; La fonction retourne: 0 si aucune des valeurs n'est paire.
;                       1 si une seule est paire.
;			2 si elles sont toutes les 2 paires.
;
; Cette fonction nettoie la pile de ses 2 arguments.
;
; aide: Utiliser la fonction estPair de l'ex 6.
;

global nbPair
extern estPair

section .text

; fonction qui retourne reçoit 2 arguments entiers sur 4 octets et retourne:
;	0 si aucune des valeurs n'est paire.
;       1 si une seule est paire.
;       2 si elles sont toutes les 2 paires.
;
; argument 1: un entier sur 4 octets (dword).
; argument 2: un entier sur 4 octets (dword).
; retour: le nombre d'arguments paires.
;
; nettoyage de la pile: la fonction s'en charge.
; nettoyage des arguments: la fonction s'en charge.

nbPair:
  ; sauvegarde du contexte de la pile
  push ebp
  mov  ebp, esp

  ; sauvegarde des registres
  ;  push eax			; registre de retour (OK pour écraser)
  push ebx
  push ecx
  ;  push edx			; pas modifié

  ; initialisations diverses

  mov  ebx, 0			; retour initialisé à 0

  ; test de parité (test1)
  push dword [ebp+12]		; premier des deux dword entiers à tester
  call estPair			; attention! estPair ne nettoie pas l'argument
  add esp, 4			; nettoyer l'argument de la pile
  add ebx, eax			; pair: ebx += 1, impair: ebx += 0

  ; test de parité (test2)
  push dword [ebp+8]		; deuxième des deux dword entiers à tester
  call estPair
  add esp, 4			; nettoyer l'argument de la pile
  add ebx, eax

  .fin:

  ; restauration des registres
  ;  pop  edx			; pas pushé (pas modifié)
  pop  ecx
  pop  ebx
  ;  pop  eax			; pas pushé (retour)

  ; restauration du contexte de la pile
  pop  ebp

  ; retour et nettoyage de 2 arguments de 4 octets
  ret  2*4			; retour et esp += 8 (nettoie les arguments)
