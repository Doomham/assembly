stack segment stack
	dw 32 dup(?)
stack ends
data segment
	old db 83h,76h,65h,84h
		db 71h,49h,62h,58h
	new db 8 dup(?)
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
	
	lea si,old
	mov cx,8
	lea di,new
	cld
again:
	lodsb old
	add al,07h
	daa
	stosb
	loop again
ret
main endp
code ends
	end main