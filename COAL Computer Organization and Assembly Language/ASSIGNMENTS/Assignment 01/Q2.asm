[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov bx,Array
	mov si,0
	
	L1:
	cmp si,20
	jz skip
	mov ax,[bx+si]
	add [Count],ax
	add si,2
	jmp L1
	skip:
	
mov ax,0x4c00
int 21h

	Array: dw -22, 30, 0, 20, -120, -10, -70, 1000, 50, -100
	Count: dw 0