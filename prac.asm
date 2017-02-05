
section .data
	sys_write equ 4
	sys_read equ 3
	sys_in 	 equ 0
 	sys_out equ 1
	sys_exit equ 1
  
section .bss


section .text
	global _start
		_start:






		mov eax,sys_exit
		mov ebx,0
		int 0x80	
