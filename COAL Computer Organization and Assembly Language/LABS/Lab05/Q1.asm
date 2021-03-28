[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov bx,Value
	
	mov al,[bx]
	mov [minimum],al
	
	mov si,1
	L:
	cmp si,[Size]
	jz skip
	mov al,[bx+si]
	cmp al,[minimum]
	jl F1
	INC SI
	jmp L
	F1:
	mov byte[minimum],al
	INC SI
	jmp L
	skip:
	
mov ax,0x4c00
int 21h

	Value: db 0xAB, 0X12, 0XEF, 0X87, 0XAA, 0X77, 0X7F, 0XF3, 0X3F, 0XAB
	Size: dw 10
	minimum: db 0
