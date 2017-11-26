stack segment stack
	dw 32 dup(?)
stack ends
data segment
	array db 12h,7h,19h,8h,24h
data ends
code segment
	assume cs:code,es:data,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	cld
	mov cl,5
	mov ch,1
big_xunhuan:
	lea si,array
	sub cl,ch
again:
	lodsb array
	cmp al,[si]
	jb exchange
	jmp exit
exchange:
	xchg al,[si]
	mov [si-1],al
	jmp exit
exit:
	dec cl
	jnz again
	
	mov cl,5
	inc ch
	cmp ch,5
	jnz big_xunhuan
ret
main endp
code ends
	end main