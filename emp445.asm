stack segment stack
	dw 32 dup(?)
stack ends
data segment
	sum db 5 dup(?)
	num_1 db 44h,33h,22h,11h	;低位在前高位在后
	num_2 db 88h,77h,66h,55h
data ends
code segment
	assume cs:code,ss:stack,ds:data,es:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	mov es,ax
	
	lea si,num_1
	lea di,sum
	lea bx,num_2
	mov cx,4
	
	clc
	cld
	
again:
	lodsb num_1
	mov ah,[bx]
	call d_add
	loop again
	
	jc jinwei
	jmp exit
jinwei:
	mov byte ptr[di],1
exit:
	ret
main endp
	
d_add proc near
	adc al,ah
	daa
	stosb
	inc bx
	ret
d_add endp

code ends
	end main