[org 0x100]
	
JMP start
	
	Num1: dd 0x1234ABCD
	Num2: dw 64
	Result: dd 0, 0

start:
	mov ax,0
	mov bx,[Num1+2]
	mov cx,[Num1]
	mov dx,[Num2]
	
	mov si,1
	L1:
	cmp dx,0
	je exit
	shr dx,1
	jnc L2
	add [Result],cx
	jnc F1
	add [Result+2],si
	F1:
	add [Result+2],bx
	jnc F2
	add [Result+4],si
	F2:
	add [Result+4],ax
	
	L2:
	shl cx,1
	rcl bx,1
	rcl ax,1
	jmp L1
	
	exit:
	
mov ax, 0x4c00
int 21h
