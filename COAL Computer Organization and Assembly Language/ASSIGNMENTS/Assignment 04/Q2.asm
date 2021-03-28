[org 0x100]
jmp start

ISR1:
	cmp ah,1
	jne n1
	mov dx,bx
	add dx,cx
	jmp exit
	
	n1:
	cmp ah,2
	jne n2
	push ax
	mul bl
	mov dx,ax
	pop ax
	jmp exit
	
	n2:
	cmp ah,3
	jne n1
	add dx,1
	exit:
iret
	
start:
	mov al,4
	mov bx,2
	mov cx,3
	mov dx,0
	
	mov es,ax
	mov word[es:101*4], ISR1
	mov [es:101*4+2], cs
	
	mov ah,1
	int 65h
	
	mov ah,2
	int 65h
	
	mov ah,3
	int 65h
	
mov ax,0x4c00
int 21h
