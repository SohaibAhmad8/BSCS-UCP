[org 0x100]
	
JMP start
	
	Num1: dw 0x12
	Num2: dw 0x64

Multiply:
	push bp
	mov bp,sp
	mov cx,[bp+4]
	mov dx,[bp+6]
	L1:
	cmp cx,0
	je exit
	add ax,dx
	sub cx,1
	jmp L1
	exit:
	pop bp
ret

start:
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	
	push word[Num1]
	push word[Num2]
	call Multiply
	
mov ax, 0x4c00
int 21h
