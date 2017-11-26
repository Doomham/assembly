stack segment stack 
	dw 32 dup(?)
stack ends
data segment
	STRING DB 'HELLO WORLD!$'
data ends
code segment
	assume cs:code,ds:data,ss:stack
begin proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	mov dx,offset STRING
	mov ah,09h
	int 21h
	ret
begin endp
code ends
	end begin