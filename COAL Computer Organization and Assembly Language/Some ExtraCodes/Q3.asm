 [org 0x100]
jmp start

	String1: db 'hello world',0
	String2: db 'computer science',0
	
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

findChar:
	push bp 
	mov bp,sp
	
	push es
	push di
	push ax
	push cx
	
	
	mov ax,ds
	mov es,ax
	
	mov di,[bp+4]
	mov al,[bp+6]
	
	push di
	call findLength
	pop cx
	
	mov ax,1
	repne scasb
	
	cmp cx,0
	
	jne exit
	mov ax,0
	
	exit:
	mov word[bp+8],ax
	
	pop cx
	pop ax
	pop di
	pop es
	pop bp
ret 2

findAndDisplay:
	push bp 
	mov bp,sp
	
	push es
	push di
	push si
	push ax
	push cx
	push dx
	
	
	mov ax,0xB800
	mov es,ax
	
	mov bx,[bp+4]
	
	push bx
	call findLength
	pop cx
	
	mov si,0
	loop3:
	cmp cx,si
	je exit
	
	mov ah,0
	mov al,[bx+si]
	push ax
	push word[bp+6]
	
	call findChar
	pop ax
	cmp ax,1
	jne n
	mov ah,0x07
	mov al,[bx+si]
	mov [es:di],ax
	add di,2
	n:
	
	add si
	jmp loop3
	
	pop dx
	pop cx
	pop ax
	pop si
	pop di
	pop es
	pop bp
ret 2

start:
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov di,160
	
	call clrscr
	
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
	mov bx,String2
	push bx
	call findLength
	pop cx
	
	push cx
	push bx
	call display
	
mov ax,0x4c00
int 21h
