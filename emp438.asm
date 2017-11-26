stack segment stack
	dw 32 dup(?)
stack ends
data segment
	my_data dw 1234h,3200h,2400h,4832h,5600h,3600h
	count equ ($-my_data)/2
	max dw 1 dup(?)
data ends
code segment
	assume cs:code,ss:stack,ds:data,es:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds, ax
	mov es,ax
	
	lea si,my_data
	lea di,max
	mov cx,count
	mov ax,[si]
	mov [di],ax
again:
	lodsw my_data
	cmp ax,max
	ja exchange
	jmp exit
exchange:
	mov max,ax
	jmp exit
exit:
	dec cx
	jnz again
ret
main endp
code ends
	end main