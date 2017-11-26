stack segment stack
	dw 32 dup(?)
stack ends
data segment
	tips db 'input your score:$'
	message1 db 'F'
	message2 db 'P'
	message3 db 'G'
	score db 50
		  db ?
		  db 50 dup(?)
	huanhang db 0ah,0dh,'$'
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	mov dx,offset tips
	mov ah,09h
	int 21h
	
	mov dx,offset score
	mov ah,0ah
	int 21h
	
	mov bx,dx
	mov ax,[bx+2]
	and ax,0f0fh
	mov cl,04h
	shl al,cl
	add al,ah
	
	push ax
	mov dx,offset huanhang
	mov ah,09h
	int 21h
	pop ax
	cmp al,60h
	jb fail
	cmp al,84h
	jb pass
	mov dl,message3
	mov ah,02h
	int 21h
	jmp exit
fail:
	mov dl,message1
	mov ah,02h
	int 21h
	jmp exit
pass:
	mov dl,message2
	mov ah,02h
	int 21h
	jmp exit
exit:
	ret
main endp
code ends
	end main