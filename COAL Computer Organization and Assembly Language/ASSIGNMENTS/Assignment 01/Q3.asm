[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,1

	mov bx,Array
	
	mov si,0
	L1:
	cmp si,20
	jz skip1
	mov ax,[bx+si]
	add [Sum],ax
	add si,2
	jmp L1
	skip1:
	
	mov si,0
	L2:
	cmp si,20
	jz skip2
	mov ax,[bx+si]
	cmp ax,[Sum]
	jl F1
	mov [bx+si],cx
	jmp N
	F1:
	mov [bx+si],dx
	N:
	add si,2
	jmp L2
	skip2:
	
mov ax,0x4c00
int 21h

	Array: dw -10, 25, 0, -9, -124, 10, 90, 20, -50, 100
	Sum: dw 0
