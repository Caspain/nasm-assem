
extern  printf

SECTION .data
  msg: db "PID= %d",10,0    ; 10 for \n, 0 and of the string, require for printf

SECTION .text
global main
main:

  push ebp                  ; save ebp
  mov ebp, esp              ; put the old top of the stack to the bottom
  sub esp, 8              ; increase the stack of 100 byte

             
  mov eax, 20                ; syscall getpid
  int 0x80                  ; execute

  push eax                  ; put the return of the getpid on the stack
  push dword msg            ; put the string on the stack
  call printf
  mov esp,ebp
  pop ebp                ; decrease esp of 8, 2 push
 ; leave                     ; destroy the stack

  mov eax,0             ;
  mov ebx,1              ; for exit (0)                 ; syscall for exit
  int 0x80                  ; execute
