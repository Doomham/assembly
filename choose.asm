stack segment stack
	dw 32 dup (?)
stack ends
data segment
	block db 83h,52h,0a6h,44h,0ffh
data ends
extra segment
	plus_data db 5 dup(?)
	minus_data db 5 dup(?)
extra ends
code segment
	assume cs:code,ss:stack,es:extra,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	mov ax,extra
	mov es,ax
	
	lea si,block
	mov cx,0005h
	lea di,plus_data
	lea bx,minus_data
	cld
go_on:
	lods block
	test al,80h	;al and 80h,0 plus_data/1 minus_data
	jnz minus
	stosb
	jmp again
minus:
	xchg di,bx
	stosb
	xchg bx,di
again:
	dec cx
	jnz go_on
	
	ret
main endp
code ends
	end main