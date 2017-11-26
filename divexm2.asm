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
	
	mov ah,00h
	mov al,d1
	and al,0f0h
	mov cl,04h
	rol al,cl
	div d2	;yushu ah=1,shang al=1
	
	mov shang+1,al
	mov al,d1
	and al,0fh
	aad
	div d2
	mov shang,al
	mov yushu,ah
	
	ret
	
main endp
code ends
	end main