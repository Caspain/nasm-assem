section .data
 	sys_write equ 4
	sys_read equ 3
	sys_exit equ 1
	stdin equ 0
	stdout equ 1
	msg db 'Enter string to print',0x0A
	mLen equ $ - msg

section .bss
input resb 255

section .text
	global _start
		_start:
			mov eax,sys_write
			mov edx,mLen
			mov ecx,msg
			mov ebx,stdout
			int 0x80
		
			
			mov eax,sys_read
			mov ecx,input
			mov edx,255
			mov ebx,stdin	
			int 0x80
			
				
		print:	
			mov eax,sys_write
			mov ebx,stdout
			mov edx,255
			mov ecx,input
			int 0x80
			
		mov eax,sys_exit
		mov ebx,0
		int 0x80
