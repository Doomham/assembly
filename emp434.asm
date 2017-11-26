stack segment stack
	dw 32 dup(?)
stack ends
data segment
	tip db 'please input a number(0~9):$'
	table db 00h,01h,04h,09h,16h,25h,36h,49h,64h,81h
data ends
code segment
	assume cs:code,ds:data,ss:stack
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	mov dx,offset tip
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	push ax
	mov dl,0ah
	mov ah,02h
	int 21h
	pop ax
	and al,0fh
	lea bx,table
	xlat
	mov ah,00h
	mov cl,4
	
	shl ax,cl
	shr al,cl
	or ax,3030h
	push ax
	mov dl,ah
	mov ah,02h
	int 21h
	pop ax
	mov dl,al
	mov ah,02h
	int 21h
ret
main endp
code ends
	end main