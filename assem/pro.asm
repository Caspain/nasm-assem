global printEquation
global printFamily
global printPid
section .data
        sys_write equ 4
        sys_read equ 3
        sys_exit equ 1
        stdin equ 0
        stdout equ 1
section .text

printFamily:
push ebp
mov ebp,esp
mov eax,1
cpuid ;call cpu instruction
shr eax,0x08
and eax,0x0F
mov esp,ebp
pop ebp
ret
printPid:
push ebp                  ; save ebp
mov ebp, esp              ; put the old top of the stack to the bottom

mov eax, 20                ; syscall getpid
int 0x80                  ; execute
mov esp,ebp
pop ebp
ret

printEquation:
;push ebp
;mov ebp,esp
;pushad
mov eax,[esp + 12] ;z
imul eax,[esp + 20] ;z * b
add eax,[esp + 24];  (z * b) + c
mov ecx,eax ; ecx= eax (9)

mov eax,[esp + 16];
mov edx,0 ;a
mov esi,[esp + 8]
div  esi; (a /y)
sub eax,[esp + 4]; (a/y)-x
add ecx,eax
mov eax,ecx


;mov esp,ebp
;pop ebp
;popad
ret	

quit:
    mov eax,sys_exit
    mov ebx,0
    int 0x80
