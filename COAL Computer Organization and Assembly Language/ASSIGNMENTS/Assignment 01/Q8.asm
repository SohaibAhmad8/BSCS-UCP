[org 0x100]

	mov ax,[num1]
	mov bx,[num2]
	mov cx,0
	mov dx,0
	
	cmp bx,100
	jnl L1
	cmp ax,-100
	jng L1
	cmp ax,bx
	jne N
	mov word[result],ax
	add word[result],bx
	jmp skip
	N:
	mov word[result],ax
	jmp skip
	L1:
	mov word[result],bx
	skip:
	
mov ax,0x4c00
int 21h

	num1 dw 50
	num2 dw 50
	result dw 0