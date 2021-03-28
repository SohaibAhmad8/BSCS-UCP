[org 100h]
jmp Start

Start:
	mov ax, 0
	mov bx, 0
	mov cx, 0
	mov dx, 0
	mov dh, 10
	
	mov ah, 0
	int 16h
	
	mov ah, 0Eh
	int 10h
	
	cmp al, 37
	je exit1
	
	mov dl, al
	sub dl, 0x30
	mov bl, dl
	
	loop1:
		mov ah, 0
		int 16h
		
		mov ah, 0Eh
		int 10h
		
		cmp al, 37
		je exit1
		
		mov dl, al
		mov ax, bx
		mul dh
		sub dl, 0x30
		add al,dl
		mov bx, ax
		
		jmp loop1
	exit1:
	
	
	mov ax, 0xB800
	mov es, ax
	mov di, 0
	mov ah, 0x07
	
	cmp bx, 100
	jg exit2
	
	cmp bx, 90
	jl n1
	mov al, 65
	STOSW
	jmp exit2
	
	n1:
	cmp bx, 80
	jl n2
	mov al, 66
	STOSW
	jmp exit2
	
	n2:
	cmp bx, 70
	jl n3
	mov al, 67
	STOSW
	jmp exit2
	
	n3:
	cmp bx, 60
	jl n4
	mov al, 68
	STOSW
	jmp exit2
	
	n4:
	cmp bx, 50
	jl n5
	mov al, 69
	STOSW
	jmp exit2
	
	n5:
	mov al, 70
	STOSW
	
	exit2:
	
mov ax,0x4c00
int 21h