[org 0x100]
	
JMP start
	
	Array1: dw 0xAB00, 0X1200, 0XEF00, 0X6500, 0X5A00, 0X7700, 0X7F00, 0X6400, 0X3F00, 0X0900
	size: dw 10
	Array2: dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	
copy:
	push bp
	mov bp,sp
	mov bx,Array2
	F1:
	cmp si,0
	jl exit
	mov dx,[bp+4]
	add bp,2
	cmp dx,25600
	jg F2
	mov [bx+si+4],dx
	F2:
	sub si,2
	jmp F1
	exit:
	pop bp
RET

start:
	mov ax,0
	mov bx,Array1
	mov cx,[size]
	shl cx,1
	sub cx,2
	mov si,0
	
	L1:
	cmp si,cx
	jg L2
	push word[bx+si]
	add si,2
	jmp L1
	
	L2:
	sub si,2
	call copy
	
mov ax, 0x4c00
int 21h