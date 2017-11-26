stack segment stack
	dw 32 dup(?)
stack ends
data segment
	message db 'hello world!$'
data ends
code segment
	assume cs:code,ss:stack,es:data,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	mov es,ax
	
	mov di,offset message
	mov cx,000dh
	mov al,'o'
	cld
	
	repnz scasb
	jz find
	mov di,0
find:
	mov bx,di
	
	ret
main endp
code ends
	end main