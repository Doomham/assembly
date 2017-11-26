stack segment stack
	dw 32 dup(?)
stack ends
data segment
	sum db 5 dup(?)	;低位在前高位在后
	data_a db 44h,33h,22h,11h
	data_b db 88h,77h,66h,55h
data ends
code segment
	assume ds:data,ss:stack,es:data,cs:code
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	mov es,ax
	
	lea si,data_a
	lea bx,data_b
	lea di,sum
	cld
	clc
	mov cx,4
again:
	lodsb data_a
	mov ah,[bx]
	adc al,ah
	daa
	stosb
	inc bx
	dec cx
	jnz again
	jc jinwei
	jmp exit
jinwei:
	mov byte ptr[di],1
	
exit:
	ret
main endp
code ends
	end main