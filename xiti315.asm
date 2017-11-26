stack segment stack
	dw 32 dup(?)
stack ends
data segment
	score db 60h,63h,66h,69h,72h,77h,75h
	new db 7 dup(?)
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
	
	lea si,score
	lea di,new
	mov cx,7
again:
	lodsb score
	add al,05h
	daa
	stosb
	loop again
ret
main endp
code ends
	end main