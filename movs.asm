stack segment stack
	dw 32 dup(?)
stack ends
data segment
	my_data dw 1234h
	message db 'hello world!$'
data ends
extra segment
	cp_message db 50,?,50 dup(?)
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
	
	cld	;df=0
	lea si,message
	lea di,cp_message+2
	mov cx,0dh
	rep movsb
	
	ret
main endp
code ends
	end main