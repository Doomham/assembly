stack segment stack
	dw 32 dup(?)
stack ends
data segment
	buf db '1!QwEr66 6#'	;'A'-'Z':41h-5ah,'0'-'9':30h-39h
	count equ $-buf
	num db 3 dup(0)	;shuzi,zimu,qita
data ends
code segment
	assume cs:code,ds:data,ss:stack,es:data
main proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	mov es,ax
	
	lea si,buf
	lea di,num
	cld
	mov cx,count
again:
	lodsb buf
	cmp al,30h
	jl dbs
	cmp al,39h
	jl shuzi
	cmp al,41h
	jl dbs
	cmp al,5ah
	jl zimu
	jmp dbs
zimu:
	inc byte ptr[di+1]
	jmp exit
shuzi:
	inc byte ptr[di]
	jmp exit
dbs:
	inc byte ptr[di+2]
	jmp exit
exit:
	;inc si
	dec cx
	jnz again
	ret
main endp
code ends
	end main