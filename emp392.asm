stack segment stack
	dw 32 dup(?)
stack ends
data segment
	table db 01h,80h,0f5h,32h,86h
		  db 74h,49h,0afh,25h,40h
	plus db ?
	negtive db ?
	zero db ?
data ends
code segment
	assume cs:code,ss:stack,ds:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	mov cx,10
	mov si,offset table
	
again:
	lodsb table
	test al,80h
	jz porz
	inc negtive
	jmp exit
porz:
	cmp al,0
	je zp
	inc plus
	jmp exit
zp:
	inc zero
	jmp exit
exit:
	dec cx
	jnz again
ret
main endp
code ends
	end main