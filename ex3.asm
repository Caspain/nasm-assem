%include 'funcs.asm'

section .data
 	sys_write equ 4
	sys_read equ 3
	sys_exit equ 1
	stdin equ 0
	stdout equ 1
	msg db 'Enter number:',0x0A,
	mLen equ $ - msg
	msg2 db 'Result',0x0A,
        mLen2 equ $ - msg2


section .bss

input resb 10

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
			mov edx,10
			mov ebx,stdin	
			int 0x80
			
				
	
		convertToInt:
			;convert to decimal by sub '0' then store in eax
			mov eax,[input]
			sub eax,'0'

		mov ecx,1 ;start counting from one

		call looper
		call quit
			
		looper:
		
			cmp ecx,eax
			jg finished
			inc eax
			jmp looper

		finished:
			mov eax,sys_write
                        mov edx,mLen2
                        mov ecx,msg2
                        mov ebx,stdout
                        int 0x80
			ret

	
							
		quit:		
			mov eax,sys_exit
			mov ebx,0
			int 0x80
