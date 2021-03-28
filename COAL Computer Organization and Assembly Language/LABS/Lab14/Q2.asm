[org 0x100]
jmp start
	
	first: db 'Computer',0
	second: db 'Science',0
	Final: times 20 db 0

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

start:
	mov ax, 0
	mov bx, 0
	mov cx, 0
	mov dx, 0
	
	push cs
	pop es
	
	mov si,second
	mov di,Final
	add di,1
	
	push cx
	push si
	call findLength
	pop cx
	
	
	loop1:
		cmp ax,cx
		je exit1
		
		movsb
		
		add di,1
		add ax,1
		jmp loop1
	exit1:
	
	
	mov si,first
	mov di,Final
	
	push cx
	push si
	call findLength
	pop cx
	
	add si,cx
	sub si,1
	
	mov bx, 0
	loop2:
		cmp bx,cx
		je exit2
		
		lodsb
		stosb
		
		add di,1
		sub si,2
		add bx,1
		jmp loop2
	exit2:

mov ax,0x4c00
int 21h