stack segment stack
	dw 32 dup(?)
stack ends
data segment
	message1 db 'entered Y$'
	message2 db 'entered N$'
	message3 db 'please enter Y/N!$'
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	mov ah,01h
	int 21h
	PUSH AX
	mov dl,0ah
	mov ah,02h
	int 21h
	POP AX
	cmp al,'Y'
	jz yes
	cmp al,'N'
	jz no
	jmp erro
yes:
	mov dx,offset message1
	mov ah,09h
	int 21h
	jmp exit
no:
	mov dx,offset message2
	mov ah,09h
	int 21h
	jmp exit
erro:
	mov dx,offset message3
	mov ah,09h
	int 21h
	jmp exit
exit:
	ret
main endp
code ends
	end main