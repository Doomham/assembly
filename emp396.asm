stack segment stack
	dw 32 dup(?)
stack ends
data segment
	string db 'Personal Computer'
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	mov cx,17
	lea si,string
again:
	lodsb string
	cmp al,20h
	loopnz again
ret
main endp
code ends
	end main