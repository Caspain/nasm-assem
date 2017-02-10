
;global add
;extern printf
global printFamily
global printPid
section .data
        sys_write equ 4
        sys_read equ 3
        sys_exit equ 1
        stdin equ 0
        stdout equ 1
section .text

;add:
    ;enter
  ;pushad
    ;mov   eax, [esp+4]   ; argument 1
    ;add   eax, [esp+8]   ; argument 2
    ;popad
    ;leave
    ;ret
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

quit:
    mov eax,sys_exit
    mov ebx,0
    int 0x80
