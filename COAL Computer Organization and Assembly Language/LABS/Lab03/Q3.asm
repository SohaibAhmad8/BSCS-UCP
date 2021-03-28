[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov bx,Num1
	mov al,[bx]
	mov cl,[bx+1]
	add ax,cx
	mov cl,[bx+2]
	add ax,cx
	mov cl,[bx+3]
	add ax,cx
	mov cl,[bx+4]
	add ax,cx
	
	mov cl,[bx+1]
	mov dl,[bx+4]
	sub cx,dx
	
	mov dx,0
	
	mov dl,cl
	sub dl,ah
	
mov ax,0x4c00
int 21h

	Num1: db 10
	Num2: db 30h
	Num3: db 0x90
	Num4: db 0x1A
	Num5: db 29