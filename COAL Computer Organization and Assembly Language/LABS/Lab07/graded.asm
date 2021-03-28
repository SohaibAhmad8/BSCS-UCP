[org 0x100]
	
JMP start
	
	num: dw 4
	
is_prime:
	push bp
	mov bp,sp
	mov dx,[bp+4]
	F:
	cmp dx,0
	je L1
	jl e
	sub dx,si
	jmp F
	e:
	pop bp
RET

L1:
	mov ax,0
	jmp exit
	
start:
	mov ax,1
	mov bx,[num]
	mov cx,bx
	shr cx,1
	mov si,2
	
	L:
	cmp si,cx
	jg exit
	push bx
	call is_prime
	pop bx
	add si,1
	jmp L
	
	exit:
mov ax, 0x4c00
int 21h