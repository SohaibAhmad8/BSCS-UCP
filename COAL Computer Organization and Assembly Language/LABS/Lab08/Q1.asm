[org 0x100]

	jmp start
	num: dw 15
	size: dw 10
	array1: dw 20, 60, 10, 15, 90, 30, 70, 50, 40, 100
	array2: dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	
subtract:
	push bp
	mov bp, sp
	mov bx,[bp+4]
	mov si,0
	L1:
		cmp si,cx
		je exit
		mov ax,[array1+si]
		sub ax,bx
		mov [array2+si],ax
		add si,2
		jmp L1
		exit:
	pop bp
ret 2
	
start:
	mov ax,0
	mov bx,0
	mov cx,[size]
	shl cx,1
	mov dx,0
	
	push word[num]
	call subtract
	
mov ax,0x4c00
int 21h