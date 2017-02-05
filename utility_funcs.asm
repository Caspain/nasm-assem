;...................int slen(String message)
;calculates the length of a string

slen:
	mov ebx,eax
	push ebx

nextChar:
	cmp byte[eax],0
	jz done
	inc eax
	jmp nextChar
done:
	pop ebx
	sub eax,ebx
	ret
