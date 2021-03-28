[org 0x100]

	jmp start
	size: dw 10
	array1: dw 4, 24, 13, 11, 19, 25, 38, 99, 75, 17
	array2: dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

digitsSum:
	push bp
	mov bp,sp
	mov bx,[bp+4]
	mov ax,0
	mov dx,0
	
	L2:
	cmp bx,10
	jl e
	add dx,1
	sub bx,10
	jmp L2
	
	e:
	add dx,bx
	cmp dx,10
	jng F
	mov ax,1
	F:
	pop bp
ret 2
	
start:
	mov ax,0
	mov bx,0
	mov cx,[size]
	shl cx,1
	mov dx,0
	mov si,0
	L1:
		cmp si,cx
		je exit
		mov ax,[array1+si]
		push ax
		call digitsSum
		mov [array2+si],ax
		add si,2
		jmp L1	
	exit:
	
mov ax,0x4c00
int 21h