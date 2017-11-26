stack segment stack
	dw 32 dup(?)
stack ends
data segment
	b_data dw 10010010000010B	;9346
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	mov ax,b_data
	
	mov cx,1000
	div cx	;dx=346,ax=9
	mov bx,ax
	mov cl,4
	rol bx,cl	;bx=0090h
	
	mov ax,dx
	sub dx,dx	;忘记dx置零
	mov cx,100
	div cx	;dx=46,ax=3
	add bx,ax
	mov cl,4
	rol bx,cl	;bx=0930h
	
	mov ax,dx
	sub dx,dx
	mov cx,10
	div cx	;dx=6,ax=4
	add bx,ax
	mov cl,4
	rol bx,cl	;bx=9340h
	
	add bx,dx
	
	ret
main endp
code ends
	end main