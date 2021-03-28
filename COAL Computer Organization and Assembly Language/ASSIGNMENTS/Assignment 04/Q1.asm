[org 0x100]
jmp start
	; Press Esc for terminate 
	String: times 100 db 0
	
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
	
start:
	mov ax,0
	mov bx,String
	mov cx,0
	mov dx,0
	mov si,0
	
	loop1:
	mov ah,1
	int 21h
	
	cmp al,27 ; Press Esc for terminate 
	je exit
	
	mov byte[bx+si],al
	add si,1
	jmp loop1
	exit:
	
	call clrscr
	
	mov ah,0x13
	mov al,1
	mov bh,0
	mov bl,7
	mov dx,0x0A00
	mov cx,si
	push cs
	pop es
	mov bp,String
	int 0x10
	
mov ax,0x4c00
int 21h
