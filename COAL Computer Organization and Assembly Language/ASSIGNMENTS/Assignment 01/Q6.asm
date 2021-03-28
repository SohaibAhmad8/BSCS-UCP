[org 0x100]

	mov ax,149
	mov bx,-149
	mov cx,50
	mov dx,70
	
	cmp ax,[num1]
	jng L1
	cmp bx,[num1]
	jnl L1
	mov [result],dx
	jmp skip
	L1:
	mov [result],cx
	skip:
	
mov ax,0x4c00
int 21h

	num1 dw 88
	result dw 0

