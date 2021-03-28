 [org 0x100]
jmp start

	String: db 'if(x>3){cout<<"I am student of UCP"<<endl;}else{cout<<"Who am i?"<<endl;if(y>0){cout<<"I am Teacher"<<endl;}}',0

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
	push bx
	push di
	
	mov ax, 0xB800
	mov es, ax
	mov bx, [bp+4]
	mov di, [bp+6]
	
	mov ah, 0x07
	
	loop1:
	mov al,[bx+si]
	
	cmp al,0x0
	je e
	
	cmp al,0x7B
	je e
	
	cmp al,0x7D
	je e
	
	cmp al,0x29
	je e1
	
	cmp al,0x3B
	je e1
	
	mov [es:di],ax
	add di,2
	
	inc si
	jmp loop1
	
	e1:
	mov [es:di],ax
	add di,2
	inc si
	
	e:
	
	pop di
	pop bx
	pop ax
	pop es
	pop bp
ret 4

displayCode:
	push bp 
	mov bp,sp
	
	push es
	push di
	push si
	push ax
	push cx
	push bx
	
	
	mov ax,0xB800
	mov es,ax
	
	mov bx,[bp+4]
	mov cx,[bp+6]
	mov si,0
	mov di,0
	
	mov ah, 0x07
	mov al,[bx+si]
	cmp al,0x0
	je e2
	
	loop2:
	mov al,[bx+si]
	cmp al,0x0
	je e2
	
	cmp al,0x7B
	jne n1
	add di,160
	mov [es:di],ax
	add di,8
	add si,1
	jmp n3
	
	n1:
	cmp al,0x7D
	jne n2
	add di,160
	sub di,8
	mov [es:di],ax
	add si,1
	jmp n3
	
	n2:
	add di,160
	push di
	push bx
	call display
	
	n3:
	jmp loop2
	
	e2:
	
	pop bx
	pop cx
	pop ax
	pop si
	pop di
	pop es
	pop bp
ret 4

start:
	mov ax,0
	mov bx,String
	mov cx,0
	mov dx,0
	
	call clrscr
	
	push cx
	push bx
	call displayCode
	
mov ax,0x4c00
int 21h
