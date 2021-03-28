[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov al,[n1]
	mov bl,[n1]
	
	add al,[n2]
	sub bl,[n2]
	
	cmp al,bl
	jle L1
	mov [result],bl
	jmp skip
	L1:
	mov [result],al
	skip:
	
mov ax,0x4c00
int 21h

	n1 db 88
	n2 db 52
	result db 0

