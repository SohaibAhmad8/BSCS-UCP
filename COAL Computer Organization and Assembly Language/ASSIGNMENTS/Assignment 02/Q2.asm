[org 0x100]
	
JMP start
	
	Num1: dd 0x1234ABCD
	Num2: dd 0x45678
	Result: dd 0, 0

Multiply:
	push bp
	mov bp,sp
	L1:
	cmp cx,0
	jne N
	cmp dx,0
	je exit
	N:
	shr cx,1
	rcr dx,1
	jnc L2

	mov ax,word[bp+4]
	add [Result],ax
	jnc F1
	
	mov ax,1
	add [Result+2],ax
	
	F1:
	mov ax,word[bp+6]
	add [Result+2],ax
	jnc F2
	mov ax,1
	add [Result+4],ax
	
	F2:
	mov ax,word[bp+8]
	add [Result+4],ax
	jnc F3
	mov ax,1
	add [Result+6],ax
	
	F3:
	mov ax,word[bp+10]
	add [Result+6],ax
	
	L2:
	shl word[bp+4],1
	rcl word[bp+6],1
	rcl word[bp+8],1
	rcl word[bp+10],1
	jmp L1
	exit:
	pop bp
ret 8
start:
	mov ax,0
	mov bx,0
	mov cx,[Num2+2]
	mov dx,[Num2]
	
	push 0
	push 0
	push word[Num1+2]
	push word[Num1]
	
	call Multiply
	
mov ax, 0x4c00
int 21h
