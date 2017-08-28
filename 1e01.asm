; 1e01.asm
global main

section .text
main:
  nop                           ; ne fait rien

  mov eax, 234

  mov  al, -1                   ;
  mov  ah, 0xA2
  mov  bx, 0xA2FF               ; bx possède la même valeur que ax
  mov ecx, 123456
  mov  dh, 100q
  mov  dl, 10001010b
  mov  ah, 0x0B                 ; on écrase l'ancien contenu de AH
  mov  al, -130
  mov  al, 'd'                  ; AL reçoit le code ASCII du caractère 'd'
  ; mov eip, 0                  ; erreur de compilation : eip inaccessible

  ; fin
  mov eax, 1
  mov ebx, 0
  int 0x80
