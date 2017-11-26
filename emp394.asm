stack segment stack
	dw 32 dup(?)
stack ends
data segment
	sound db 20 dup(?)
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	in al,61h
	and al,0fch
more:
	xor al,02h
	out 61h,al
	mov cx,26000
delay:
	loop delay
	jmp more

ret
main endp
code ends
	end main