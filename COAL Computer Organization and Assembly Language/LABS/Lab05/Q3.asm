[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov bx,Value
	
	mov si,0
	mov di,9
	
	L:
	cmp si,di
	jae skip
	mov al,[bx+si]
	mov cl,[bx+di]
	mov [bx+si],cl
	mov [bx+di],al
	INC SI
	sub di,1
	jmp L
	skip:
	
mov ax,0x4c00
int 21h

	Value: db 0x5A, 0X6B, 0X24, 0X8D, 0X35, 0X0F, 0X90, 0X34, 0X73, 0X66
