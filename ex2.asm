%include 'funcs.asm'
section .data
 	sys_write equ 4
	sys_read equ 3
	sys_exit equ 1
	stdin equ 0
	stdout equ 1
	valA equ 10
	valB equ 15
	msg1 db 'valA is greater than valB',0x0A,0h
	l1 equ $-msg1
	msg2 db 'valA is less than valB',0X0A,0h
	l2 equ $-msg2
	msg3 db 'valA is equal to valB',0X0A,0h
	l3 equ $-msg3

section .bss
input resb 255

section .text
	global _start
		_start:
					mov eax,15
					mov ecx,15
					cmp eax,ecx
					jg printGreater
					
					cmp eax,ecx
					jl printLess
					
					cmp eax,ecx
					je printEqual
					
		
			printGreater:	
					mov eax,sys_write
					mov ecx,msg1
					mov edx,l1
					mov ebx,stdout
					int 0x80
					call quit
			printLess:
                                        mov eax,sys_write
                                        mov ecx,msg2
                                        mov edx,l2
                                        mov ebx,stdout
                                        int 0x80
					call quit
			printEqual:
                                        mov eax,sys_write
                                        mov ecx,msg3
                                        mov edx,l3
                                        mov ebx,stdout
                                        int 0x80
					call quit


		
		quit:			
		mov eax,sys_exit
		mov ebx,0
		int 0x80
