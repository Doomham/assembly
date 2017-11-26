stack segment stack
	dw 32 dup(?)
stack ends
data segment
	tips db 'input a number:$'
	message db 'your number in hex:$'
data ends
code segment
	assume cs:code,ds:data,ss:stack
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	mov cx,3
next:
	mov dx,offset tips
	mov ah,09h
	int 21h
	call get_data
	call show
	mov dl,0ah
	mov ah,02h
	int 21h
	loop next
ret
main endp

get_data proc near
	mov bx,0
input:
	mov ah,01h
	int 21h
	cmp al,0dh
	jz exit
	sub al,30h
	cbw
	xchg ax,bx
	mov dx,10
	mul dx
	add bx,ax
	jmp input
exit:
	ret
get_data endp

show proc near
	push cx
	mov ch,4
again:
	mov cl,4
	rol bx,cl
	push bx
	and bx,000fh
	cmp bx,9
	ja zimu
	jmp shuzi
zimu:
	mov al,bl
	add al,31h
	daa
	mov dl,al
	mov ah,02h
	int 21h
	jmp chukou
shuzi:
	add bl,30h
	mov dl,bl
	mov ah,02h
	int 21h
	jmp chukou
chukou:
	dec ch
	pop bx
	jnz again
pop cx
ret
show endp

code ends
	end main