 [org 0x100]
jmp start

	String1: db 'hello world',0
	String2: db 'computer science',0

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

isPrasent:
	push bp 
	mov bp,sp
	
	push es
	push di
	push ax
	push cx
	push dx
	
	mov ax,ds
	mov es,ax
	
	mov di,[bp+4]
	mov al,[bp+6]
	mov cx,[bp+8]
	
	mov dx,1
	repne scasb
	
	cmp cx,0
	
	jne e
	mov dx,0
	
	e:
	mov word[bp+10],dx
	
	pop dx
	pop cx
	pop ax
	pop di
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
	push dx
	
	mov ax,ds
	mov es,ax
	
	mov di,[bp+4]
	mov al,[bp+6]
	
	push cx
	push di
	call findLength
	pop cx
	
	mov dx,1
	repne scasb
	
	cmp cx,0
	
	jne e1
	mov dx,0
	
	e1:
	mov word[bp+8],dx
	
	pop dx
	pop cx
	pop ax
	pop di
	pop es
	pop bp
ret 4

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
	
	push cx
	push bx
	call findLength
	pop cx
	
	mov si,0
	loop3:
	cmp cx,si
	jng exit
	
	mov ah,0
	mov al,[bx+si]
	
	cmp al,0x20
	je n
	
	push dx
	mov dx,si
	push dx
	push ax
	push bx
	call isPrasent
	pop dx
	
	cmp dx,1
	je n

	push ax
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
	
	add si,1
	jmp loop3
	
	exit:
	
	pop dx
	pop cx
	pop ax
	pop si
	pop di
	pop es
	pop bp
ret 4

start:
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,23
	
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
	mov bx,String2
	push bx
	call findLength
	pop cx
	
	push cx
	push bx
	call display
	
	mov di,480
	push String2
	push String1
	call findAndDisplay
	
mov ax,0x4c00
int 21h
