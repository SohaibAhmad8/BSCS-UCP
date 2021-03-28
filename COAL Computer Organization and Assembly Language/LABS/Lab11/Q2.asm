 [org 0x100]
jmp start

	Array1: db 'Computer Organization and Assembly Language',0
	Array2: times 26 db 0

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

copyArray:
	push bp 
	mov bp,sp
	
	push es
	push ax
	push di
	push cx
	push si
	
	mov ax,ds
	mov es,ax
	
	mov cx,[bp+8]
	mov si,[bp+6]
	mov di,[bp+4]
	
	rep movsb
	
	pop si
	pop cx
	pop di
	pop ax
	pop es
	pop bp
ret 6

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

start:
	mov ax,Array2
	mov bx,Array1
	mov cx,26
	mov dx,0
	
	call clrscr
	
	mov di,160
	
	push cx
	push bx
	push ax
	call copyArray
	
	push cx
	push ax
	call display
	
mov ax,0x4c00
int 21h
