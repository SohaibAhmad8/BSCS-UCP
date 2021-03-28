[org 0x0100]
jmp start
	String1: db 'Hello World!',0
	String2: times 50 db 0

count_size:
	push bp
	mov bp,sp
	
	push si
	push bx
	
	mov si, 0
	mov bx, [bp+4]
	
	loop1:
	cmp byte[bx+si], 0x0
	je exit
	
	add si, 1
	jmp loop1
	
	exit:
	mov [bp+6], si
	pop bx
	pop si
	pop bp
ret 2

reverse:
	mov al, [String1+si]
	cmp al, 0x0 ;base case
	jne continue
ret 

continue:
	mov byte[String2+di], al
	dec di
	inc si
	call reverse
ret

start:

	push word 0
	push String1
	call count_size
	pop cx
	
	mov di, cx
	sub di, 1
	call reverse
	
mov ax,0x4c00
int 21h