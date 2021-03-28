[org 0x100]
jmp start
old_data: dd 0


printNumbr:
	push ax
	push bx
	push cx
	push dx
	
	mov bx,10
	mov cx,0
	
	loop3:
	cmp ax,0
	jle exit3
	mov dx,0
	div bx
	push dx
	add cx,1
	jmp loop3
	exit3:
	
	
	loop4:
	pop ax
	mov ah, 0x07
	add al,48
	STOSW
	loop loop4
	
	pop dx
	pop cx
	pop bx
	pop ax
ret

print:
	push ax
	push bx
	push cx
	push dx
	
	call printNumbr
	mov bx,ax
	mov ah, 0x07
	
	mov al,62
	STOSW
	
	mov al, bl
	STOSW
	
	mov al,32
	STOSW
	
	pop dx
	pop cx
	pop bx
	pop ax
ret


ISR0:
mov ax,0xB800
	mov es,ax
	mov di,160
	
	mov ax,65
	mov cx,bx
	
	
	loop2:
		cmp ax,255
		jg exit2
		cmp ax,cx
		je exit2
		call print
		add ax,1
		jmp loop2
	exit2:

mov ax,0
mov es,ax
mov bx,[old_data]
mov [ES:0x16*4],bx ;saving the old values in a variable before overwritting.
mov bx,[old_data+2]
mov [ES:0x16*4+2],bx

IRET


start:
mov ax, 0
	mov bx, 0
	mov cx, 0
	mov dx, 0
	mov dh, 10
	
	
	mov ah, 0
	int 16h
	
	cmp al, 27
	je exit1
	mov dl, al
	
	mov ah, 0Eh
	int 10h
	
	sub dl, 0x30
	add bl, dl
	
	loop1:
		mov ah, 0
		int 16h
		
		cmp al, 27
		je exit1
		mov dl, al
		
		mov ah, 0Eh
		int 10h
		
		sub dl, 0x30
		mov ax, bx
		mul dh
		add al,dl
		mov bx, ax
		
		jmp loop1
	exit1:
	
	
XOR DI, DI;
MOV ES, DI

mov ax,[ES:0x16*4] ;saving the old values in a variable before overwriting.
mov [old_data],ax
mov ax,[ES:0x16*4+2]
mov [old_data+2],ax
mov AX, ISR0;
MOV [ES:0x16*4],AX; ;hooking the interrupt
MOV [ES:0x16*4+2], CS;
pushf
push cs
push continue
jmp far [es:0x16*4]
continue:

mov ax,0x4c00
int 21h