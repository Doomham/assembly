stack segment stack
	dw 32 dup(?)
stack ends
data segment
	tips db 'input a number(0~65535):$'	;dl=10时错误，数值达到一定程度后ax*10出现问题,cx=10时正确
										
	message db 'your number in binary is:$'
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
	
	mov dx,offset tips	;tips :input a number
	mov ah,09h
	int 21h

	mov bx,0000h

again:	
	mov ah,01h
	int 21h
	
	cmp al,0dh
	jz next
	sub al,30h
	cmp al,0
	jl exit
	cmp al,9
	jg exit
	cbw
	xchg ax,bx
	mov cx,10	;这里换成dl不正确,键入65534/4096等得不到正确答案
	mul cx
	xchg bx,ax
	add bx,ax
	jmp again

next:	
	mov dx,offset message
	mov ah,09h
	int 21h

show:
	mov cx,16
print:
	rcl bx,1
	jc print1
	jmp print0
print0:
	mov dl,30h
	mov ah,02h
	int 21h
	dec cx
	jnz print
	jmp exit
print1:
	mov dl,31h
	mov ah,02h
	int 21h
	dec cx
	jnz print
	jmp exit
	
exit:
	ret
	
main endp
code ends
	end main