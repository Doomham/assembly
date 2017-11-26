stack segment stack
	dw 32 dup(?)
stack ends
data segment
	b_data dw 1111111111111110B	;'A'=41H,'0'=30H
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
	mov cx,4
again:	
	push cx
	mov cl,4
	rol ax,cl
	push ax
	and ax,000fh
	cmp ax,9
	ja zimu
	jmp shuzi
zimu:
	add al,31h
	daa
	jmp show
shuzi:
	add al,30h
	jmp show
show:
	mov dl,al
	mov ah,02h
	int 21h
	jmp exit
exit:
	pop ax
	pop cx
	dec cx
	jnz again
ret
main endp
code ends
	end main