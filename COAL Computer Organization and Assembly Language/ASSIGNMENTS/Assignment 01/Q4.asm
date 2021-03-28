[org 0x100]

	mov ax,0
	mov bx,Array
	mov cx,[num]
	mov dx,0

	mov si,0
	
	L1:
	cmp si,[size]
	jz skip
	mov dx,[bx+si]
	cmp cx,dx
	jz N
	add si,2
	jmp L1
	N:
	mov ax,1
	skip:
	
mov ax,0x4c00
int 21h

	num: dw 7
	Array: dw 2, 3, 0, 5, 1, 4, 7, 9, 8, 6
	size: dw 20