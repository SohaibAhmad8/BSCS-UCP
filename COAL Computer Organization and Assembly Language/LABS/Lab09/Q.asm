[org 0x0100]
jmp start
	size: dw 40 ; 20-40
clrscr:
	push es
	push ax
	push di
	
	mov ax, 0xB800
	mov es, ax
	mov di, 0
	
	nextloc:
	mov word[es:di], 0x0720
	add di, 2
	cmp di, 4000
	jne nextloc
	
	pop di
	pop ax
	pop es
ret

generate_binary:
	push cx
	mov ah, 00h
	int 1Ah
	pop cx
	
	mov bl, 0x30
	rcr dx,1
	jc n
	mov bl, 0x31
	n:
ret

print:
	push bp
	mov bp,sp
	
	push es
	push ax
	push di
	push cx
	push bx
	
	mov ax, 0xB800
	mov es, ax
	mov di, [bp+4]
	mov cx, [bp+6]
	
	mov bh, 0x0F
	
	loop1:
	call generate_binary
	mov [es:di], bx
	add di, 2
	loop loop1
	
	pop bx
	pop cx
	pop di
	pop ax
	pop es
	pop bp
ret 4

print_up:
	push bp
	mov bp,sp
	
	push di
	push cx
	
	mov di, [bp+4]
	mov cx, [bp+6]
	
	loop2:
	push cx
	push di
	call print
	sub di, 160
	loop loop2
	
	pop cx
	pop di
	pop bp
ret 4

print_down:
	push bp
	mov bp,sp
	
	push di
	push cx
	
	mov di, [bp+4]
	mov cx, [bp+6]
	
	loop3:
	push cx
	push di
	call print
	add di, 160
	loop loop3
	
	pop cx
	pop di
	pop bp
ret 4

print_shape:
	mov ax, [size]
	shr ax,2
	sub ax,3
	push ax
	push 1610
	call print_up
	
	mov ax, [size]
	shr ax,2
	push ax
	mov dx, ax
	mov ax,1610
	mov bx,0
	add bx, [size]
	add bx,18
	sub bx,dx
	sub bx,3
	shl bx,1
	add ax, bx
	push ax
	call print_up
	
	
	mov ax, [size]
	add ax,18
	push ax
	push 1770
	call print
	
	mov ax, [size]
	add ax,20
	push ax
	push 1932
	call print
	
	mov ax, [size]
	add ax,18
	push ax
	push 2090
	call print
	
	mov ax, [size]
	shr ax,2
	sub ax,3
	push ax
	push 2250
	call print_down
	
	mov ax, [size]
	shr ax,2
	push ax
	mov dx, ax
	mov ax,2250
	mov bx,0
	add bx, [size]
	add bx,18
	sub bx,dx
	sub bx,3
	shl bx,1
	add ax, bx
	push ax
	call print_down
ret

start:
	call clrscr
	call print_shape
	
mov ax,0x4c00
int 0x21