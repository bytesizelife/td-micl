; 7e08.asm

global nbPairGen
extern estPair

section .text

; cette fonction nbPairGen reçoit un nombre variable n+1 d'arguments:
; n entiers quelconques et un entier égal à n+1 comme dernier argument.
;
; Cette fonction ne nettoie pas la pile de ses arguments.
;

; plusieurs arguments optionnels: un nombre n d'arguments entiers.
; dernier argument: le nombre n.
; retour: le nombre d'arguments paires (ne teste pas le dernier argument).
;
; nettoyage de la pile: la fonction s'en charge.
; nettoyage des arguments: non.

nbPairGen:
  ; sauvegarde du contexte de la pile
  push ebp
  mov  ebp, esp

  ; sauvegarde des registres
  ;  push eax			; registre de retour (OK pour écraser)
  push ebx
  push ecx
  ;  push edx			; pas utilisé

  ; initialisations diverses
  mov  ebx, 0			; retour initialisé à 0
  mov  ecx, [ebp+8]		; dernier argument = nombre de tests

  ; test 0 arguments
  or   ecx, 0
  jz   .finBoucleTests

  .boucleTests:
  ; test compteur = 0
  or   ecx, 0			; test compteur = 0 
  jz   .finBoucleTests

  push dword [ebp+8+ecx*4]	; le dword entier à tester
  call estPair			; attention! estPair ne nettoie pas l'argument
  add esp, 4			; nettoyer l'argument de la pile
  add ebx, eax			; pair: ebx += 1, impair: ebx += 0

  dec ecx
  jmp .boucleTests
  .finBoucleTests:
  mov eax, ebx			; valeur de retour

  ; restauration des registres
  ;  pop  edx			; pas utilisé
  pop  ecx
  pop  ebx
  ;  pop  eax			; pas pushé (retour)

  ; restauration du contexte de la pile
  pop  ebp

  ; retour sans nettoyage
  ret
