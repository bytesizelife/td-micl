; 7e03.asm
; créé sur la pile une variable locale de taille 4 bytes et
; met:
; - son bit de rang 0
;   - à 0 si le contenu de edi est impair
;   - à 1 si le contenu de edi est pair
; - son bit de rang 31
;   - à 0 si edi contient un nombre impair de bits à 1
;   - à 1 si edi contient un nombre pair de bits à 1
; - ses bits de rang 1 à 30 à 0
;
; le contenu d'edi doit être préservé.

global main

section .text
main:

  nop

  mov  edi, 00100000000000000001000101100010b ; pair, 6 bits à 1

  push dword 0                  ; on rempli 4 bytes sur la pile avec des zéros

  bt   edi, 0
  jc   _ediImpair

  bts  dword [ss:esp], 0        ; edi pair: bit #0 à 1

_ediImpair:                     ; ne rien faire

  mov  esi, 32                  ; boucler de 32 à 1 (stop quand esi = 0)
  mov  eax, 0                   ; compteur de bits à 1

_boucle32Bits:
  dec  esi                      ; esi--
  bt   edi, esi                 ; check bit #esi d'edi
  jc   _bitAUn
  jmp  _bitAZero

_bitAUn:
  inc  eax                      ; eax++
  jmp  _finTestBit

_bitAZero:
  jmp  _finTestBit

_finTestBit:
  or   esi, 0
  jnz  _boucle32Bits
  bt   eax, 0
  jc   _nbBitsA1Impair

  bts  dword [ss:esp], 31        ; nb bits à 1 pair: bit #31 à 1

_nbBitsA1Impair:                ; ne rien faire

  pop  eax                      ; pour vérifier résultat

;fin
  mov  eax, 1                   ; exit
  mov  ebx, 0                   ; ok
  int  0x80
