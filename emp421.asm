stack segment stack
	dw 32 dup(?)
stack ends
data segment
	buf db 50
		db ?
		db 50 dup(?)
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	mov dx,offset buf
	mov ah,0ah
	int 21h
	
	lea si,buf
	mov al,[si+1]
	cbw
	mov bx,ax
	mov byte ptr[bx+si+2],'$'
	mov dl,0ah
	mov ah,02h
	int 21h
	add si,2
	mov dx,si
	mov ah,09h
	int 21h
	ret
main endp
code ends
	end main