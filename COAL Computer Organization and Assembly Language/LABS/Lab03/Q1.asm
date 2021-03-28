[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov al,[A]
	mov bl,[B]
	add ax,bx
	mov cl,[C]
	add ax,cx
	
	mov bx,0
	mov cx,0
	
	mov cl,[A]
	mov bl,[C]
	sub cx,bx
	
	mov bx,0
	
	mov dh,ah
	sub dh,cl
	
mov ax,0x4c00
int 21h

	A: db 150
	B: db 30
	C: db 20