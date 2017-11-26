stack segment stack
	dw 32 dup(?)
stack ends
data segment
	A1 db 56h,78h
	A2 db 4fh,9ah
	sum db 3 dup(?)
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
	lea si,A1
	lea bx,A2
	
	mov cl,[si]
	mov ch,[bx]
	add cl,ch
	lea di,sum
	mov [di],cl
	
	mov cl,[si+1]
	mov ch,[bx+1]
	adc cl,ch
	mov [di+1],cl
	
	jc	jinwei
	jmp exit
jinwei:
	mov byte ptr[di+2],1
exit:
	ret
main endp
code ends
	end main