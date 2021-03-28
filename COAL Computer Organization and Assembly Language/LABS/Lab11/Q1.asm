 [org 0x100]
jmp start

	String1: db 'I am a programmer', 0
	Massage1: db 'Total characters: ', 0
	Massage2: db 'Space characters: ', 0

findLength:
	push bp 
	mov bp,sp
	
	push es
	push di
	push ax
	push cx
	
	
	mov ax,ds
	mov es,ax
	
	mov di,[bp+4]
	
	mov al,0x0
	
	mov cx,0xFFFF
	
	repne scasb
	
	mov ax,0xFFFF
	sub ax,cx
	sub ax,1
	mov word[bp+6],ax
	
	pop cx
	pop ax
	pop di
	pop es
	pop bp
ret 2

clrscr:
	push es
	push ax
	push di 
	push cx
	
	mov ax, 0xB800
	mov es, ax
	mov di, 0
	mov cx, 2000
	mov ax, 0x0720
	
	rep stosw
	
	pop cx
	pop di
	pop ax
	pop es
ret

display:
	push bp
	mov bp,sp
	
	push es
	push ax
	push cx
	push si
	push bx
	
	mov ax, 0xB800
	mov es, ax
	mov bx, [bp+4]
	mov cx, [bp+6]
	
	mov si,0
	mov ah, 0x07

	loop1:
	mov al, [bx+si]
	stosw
	add si,1
	loop loop1
	
	pop bx
	pop si
	pop cx
	pop ax
	pop es
	pop bp
ret 6

displayNum:
	push bp
	mov bp,sp
	
	push es
	push ax
	push cx
	push dx
	push bx
	
	
	mov ax, 0xB800
	mov es, ax
	
	mov al, [bp+4]
	mov cl, 10
	mov bh, 0x07
	
	loop2:
	cmp al,10
	jl exit1
	mov ah, 0
	div cl
	mov bl,al
	add bl,48
	mov [es:di], bx
	
	mov al,ah
	add di, 2
	loop loop2
	
	exit1:
	mov bl,al
	add bl,48
	mov [es:di], bx
	add di, 2
	
	pop bx
	pop dx
	pop cx
	pop ax
	pop es
	pop bp
ret 2

countSpaces:
	push bp 
	mov bp,sp
	
	push es
	push di
	push ax
	push cx
	push bx
	
	
	mov ax,ds
	mov es,ax
	
	mov di,[bp+4]
	
	push cx
	push di
	call findLength
	pop cx
	
	mov bx,0
	mov al,0x20
	
	loop3:
	repne scasb
	cmp cx,0
	je exit2
	
	add bx,1
	add di,1
	
	loop loop3
	
	exit2:
	mov word[bp+6],bx
	
	pop bx
	pop cx
	pop ax
	pop di
	pop es
	pop bp
ret 2

start:
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	
	call clrscr
	
	mov di,160
	
	push cx
	mov bx,String1
	push bx
	call findLength
	pop cx
	
	push cx
	push bx
	call display
	
	mov di,320
	
	push cx
	mov bx,Massage1
	push bx
	call findLength
	pop cx
	
	push cx
	push bx
	call display
	
	push cx
	mov bx,String1
	push bx
	call findLength
	pop cx
	
	push cx
	call displayNum
	
	mov di,480
	
	push cx
	mov bx,Massage2
	push bx
	call findLength
	pop cx
	
	push cx
	push bx
	call display
	
	mov bx,String1
	push cx
	push bx
	call countSpaces
	pop cx
	
	push cx
	call displayNum
	
mov ax,0x4c00
int 21h
