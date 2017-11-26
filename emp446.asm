stack segment stack
	dw 32 dup(?)
stack ends
data segment
	sum	 dw 1 dup(?)
	array db 01,02,03,04,05,06,07,08,09,10
		  db 11,12,13,14,15,16,17,18,19,20
	count equ $-array
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	mov ax,data
	mov ds,ax
	
	lea si,array
	clc
	cld
	
	call func
	mov sum,bx
	ret
main endp

func proc near
	mov bx,0
	mov cx,count
again:
	lodsb array
	cbw
	adc bx,ax
	loop again
	ret
func endp

code ends
	end main