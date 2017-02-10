%include 'funcs.asm'
section .data
 	sys_write equ 4
	sys_read equ 3
	sys_exit equ 1
	stdin equ 0
	stdout equ 1
	msg db 'Enter string to print',0x0A
	mLen equ $ - 

section .bss
input resb 25

section .text
	global _start
		_start:
		
			
			
			
		mov eax,sys_exit
		mov ebx,0
		int 0x80
