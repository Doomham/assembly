stack segment stack
	dw 32 dup(?)
stack ends
data segment
	d1 db 75h
	d2 db 06h
	
	shang db 2 dup(?)
	yushu db 1 dup(?)
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	mov bx,offset d1
	mov al,[bx]
	and al,0f0h
	mov cl,04h
	ror al,cl
	cbw
	mov bx,offset d2
	mov bl,[bx]
	div bl	;ah=01h,al=01h
	mov bx,offset shang
	mov [bx+1],al
	mov bx,offset d1
	mov al,[bx]
	and al,0fh
	aad	;al=0fh
	cbw
	div d2	;ah=3,al=2
	mov bx,offset shang
	mov [bx],al
	mov bx,offset yushu
	mov [bx],ah
	
	ret
main endp
code ends
	end main