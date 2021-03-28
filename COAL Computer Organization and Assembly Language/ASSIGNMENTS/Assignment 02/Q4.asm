[org 0x100]
	
JMP start
	
	Source: db 3, 5, 7, 4, 2, 8, 6
	Answer: dw 0, 0, 0, 0, 0, 0, 0
	count: dw 7
	
Multiply:
	mov bl,bh
	mov dx,ax
	L1:
	cmp bl,1
	je e1
	add ax,dx
	sub bl,1
	jmp L1
	e1:	
ret
	
Factorial:
	mov ax,1
	mov bh,[Source+si]
	F1:
	cmp bh,1
	je e2
	call Multiply
	sub bh,1
	jmp F1
	e2:
	mov bx,si
	mov word[Answer+bx+si],ax
ret

start:
	mov ax,0
	mov bx,0
	mov cx,[count]
	mov dx,0
	mov si,0
	
	L:
	cmp cx,si
	je exit
	call Factorial
	add si,1
	jmp L
	exit:
	
mov ax, 0x4c00
int 21h
