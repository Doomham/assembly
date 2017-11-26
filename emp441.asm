stack segment stack
	dw 32 dup(?)
stack ends
data segment
	num db 01100010b	;62h=98d
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	mov al,num
	
	mov dl,10
	cbw
	div dl	;ah余数,al商,ax=0809h
	
	or ax,3030h
	
	push ax
	mov dl,al
	mov ah,02h
	int 21h
	pop ax
	mov dl,ah
	mov ah,02h
	int 21h

	ret
main endp
code ends
	end main