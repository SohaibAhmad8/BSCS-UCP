[org 0x100]

	mov ax,[num1]
	mov bx,0
	mov cx,0
	mov dx,0
	
	cmp ax,50
	jnl L1
	cmp ax,10
	jng L1
	mov word[result],60
	jmp skip
	L1:
	cmp ax,10
	jnle L2
	mov word[result],10
	jmp skip
	L2:
	cmp ax,50
	jnge skip
	mov word[result],50
	skip:
	
mov ax,0x4c00
int 21h

	num1 dw 40
	result dw 0

