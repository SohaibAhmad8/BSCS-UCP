[org 0x100]

	jmp start
	num: dw 20
	size: dw 10
	array1: dw 20, 34, 56, 34, 43, 91, 34, 56, 20, 34
	
coutOccurrence:
	push bp
	mov bp, sp
	mov bx,[bp+4]
	mov si,0
	L1:
		cmp si,cx
		je exit
		mov dx,[array1+si]
		xor dx,bx
		cmp dx,0
		jne F1
		add ax,1
		F1:
		add si,2
		jmp L1
		exit:
	pop bp
ret 2
	
start:
	mov ax,0
	mov bx,[num]
	mov cx,[size]
	shl cx,1
	mov dx,0
	
	push bx
	call coutOccurrence
	
mov ax,0x4c00
int 21h