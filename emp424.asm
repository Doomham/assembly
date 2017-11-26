stack segment stack
	dw 32 dup(?)
stack ends
data segment
	string db 0ch,'right!',0dh,0ah,'$'
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	lea si,string
again:
	lodsb string
	cmp al,'$'
	jnz show
	jmp exit
show:
	mov dl,al
	mov ah,02h
	int 21h
	jmp again
exit:
	ret
main endp
code ends
	end main