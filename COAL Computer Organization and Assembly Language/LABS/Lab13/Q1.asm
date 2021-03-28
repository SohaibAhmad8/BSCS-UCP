[org 100h]
jmp Start

Start:
	mov ax, 0
	mov bx, 0
	mov cx, 0
	mov dx, 0
	
		mov ah, 0
		int 16h
		mov ah, 0Eh
		int 10h
		sub al, 0x30
		mov bl, al
		
		
		mov ah, 0
		int 16h
		mov ah, 0Eh
		int 10h
		sub al, 0x30
		mov cl, al
	
	mov ax, 0
	mov al, bl
	add al, cl
	mov dl, 10
	div dl
	mov cx, ax
	
	mov ax, 0xB800
	mov es, ax
	mov di, 0
	mov ah, 0x07
	
	mov al, cl
	add al,48
	STOSW
	
	mov al, ch
	add al,48
	STOSW
	

mov ax,0x4c00
int 21h