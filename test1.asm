stack segment stack
	dw 32 dup(?)
stack ends
data segment
	D1 DB 12H,34H,54H,0BCH,76H,0FEH,5AH,33H
	D2 DB 98H,3DH,3FH,9DH,0DEH,0ADH,0ECH,2FH
data ends
code segment
	assume cs:code,ds:data,ss:stack
begin proc far
	push ds
	sub ax,ax
	push ax
	mov ax,data
	mov ds,ax
	lea DI,D1
	mov ax,[DI]
	mov bx,[DI+2]
	mov cx,[DI+4]
	mov SI,[DI+6]
	lea DI,D2
	ADD ax,[DI]
	ADC bx,[DI+2]
	ADC cx,[DI+4]
	ADC SI,[DI+6]
	mov al,0
	adc al,0
	ret
begin endp
code ends
	end begin