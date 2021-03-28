[org 0x100]
	
JMP start
	
	Number: dw 3, 5, 7, 4, 2, 8, 6
	count: dw 7
	
CountOdd:
	mov si,0
	L:
	cmp cx,si
	je exit
	mov dx,[bx+si]
	shr dx,1
	jnc F
	add ax,1
	F:
	add si,2
	jmp L
	exit:
ret

start:
	mov ax,0
	mov bx,Number
	mov cx,[count]
	shl cx,1
	mov dx,0
	
	call CountOdd
	
mov ax, 0x4c00
int 21h
