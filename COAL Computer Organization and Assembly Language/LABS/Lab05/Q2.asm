[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov bx,arr
	mov si,0
	
	L1:
	cmp si,[size]
	jz skip
	mov al,[bx+si]
	add [sum],ax
	add [sum],si
	add word[sum],1
	INC SI
	jmp L1
	skip:
	
mov ax,0x4c00
int 21h

	arr: db 32,-84,39,56,23,56,33,-1,17,30
	size: dw 10
	sum: dw 0