stack segment stack
	dw 32 dup(?)
stack ends
code segment
	assume cs:code,ss:stack
main proc far
	push ds
	sub ax,ax
	push ax

	mov dl,01h
	mov ah,02h
	int 21h
	
	ret
main endp
code ends
	end main