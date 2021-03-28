[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov al,[a]
	mov bl,[b]
	add ax,bx
	mov cx,[c]
	sub ax,cx
	mov [g],ax
	
	mov ax,0
	mov bx,0
	mov cx,0
	
	mov ax,[c]
	mov bl,[f]
	add ax,bx
	mov [b],ax
	
	mov ax,0
	mov bx,0
	
	mov al,[e]
	mov bx,[g]
	sub ax,bx
	mov [d],ax
	
	mov cl,[b]
	mov dl,[d]
	add cx,dx
	mov [c],cx
	
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	
	mov al,[a]
	mov bx,[g]
	add ax,bx
	mov [e],ax
	
mov ax,0x4c00
int 21h

	a: db 01110111b
	b: db 95
	c: dw 280
	d: db 77h
	e: db 0x42
	f: db 0xE4
	g: dw 0
