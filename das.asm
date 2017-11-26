stack segment stack
	dw 32 dup (?)
stack ends
data segment
string db 2 dup(?),'$'
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	;56h-98h
	mov al,56h
	mov cl,98h
	sub al,cl
	das	;al=58h
	
	push ax
	
	and al,0f0h
	cbw
	mov cl,04h
	shr ax,cl
	or al,30h
	mov string,al
	
	pop ax
	and al,0fh
	cbw
	or al,30h
	mov string+1,al
	
	mov dx,offset string
	mov ah,09h
	int 21h
	
	ret
	
main endp
code ends
	end main