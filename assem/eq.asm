section .data

section .bss


setion .text
	global _start
	_start:


        execute:	
		push 1
		push 2
		push 3
		
   		pop eax


	

	mov eax,1
	mov ebx,0
	int 0x80
