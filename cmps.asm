stack segment stack
	dw 32 dup (?)
stack ends
data segment
	message db 'please input password:',0dh,0ah,'$'
	erro db 'invalid password!$'
	correct db 'yes it is!$'
	password db 'nmsl'
	in_word db 50
			db ?
			db 50 dup(?)
data ends
code segment
	assume ss:stack,cs:code,ds:data,es:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	mov es,ax
	
	lea si,password
	lea di,in_word + 2
	
	mov dx,offset message
	mov ah,09h
	int 21h
	
	mov dx,offset in_word
	mov ah,0ah
	int 21h
	mov dl,0ah
	mov ah,02h
	int 21h
	mov dl,0dh
	int 21h
	cld
	mov cx,0004h
	repz cmpsb
	jnz show_erro
	mov dx,offset correct
	mov ah,09h
	int 21h
	jmp exit
	
show_erro:
	mov dx,offset erro
	mov ah,09h
	int 21h
exit:
	ret
main endp
code ends
	end main