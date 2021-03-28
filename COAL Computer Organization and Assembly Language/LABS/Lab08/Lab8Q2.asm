[org 0x100]

jmp start


division:

	push cx
	push bp
	
	mov bp,sp
	
	mov dx,[bp+6]
	
	for_loop1:
		
		sub dx,10
		inc cx
		cmp dx,10
		jle break	;if less or equal to 10
		
		jmp for_loop1

	
	
	break:

	mov ax,dx
	mov dx,cx
	
	pop bp
	pop cx

ret 


sumDigits:

	push cx		
	push bp
	
	mov bp,sp
	
	mov dx,[bp+6]
	mov cx,0
	mov ax,0
	
	while1:
		
		cmp dx,10
		jle exit	;if less or equal to 10
		
		push dx
		call division
		pop di ;si number of push must be equal to number of pops to clear stack
		add cx,ax
	
		jmp while1


	exit:
	
	add cx,dx

	cmp cx,10
	jle operation1	;if less or equal to 10
	mov ax,1
	jmp exit1
	
	operation1:
		mov ax,0
		
	exit1:

	
	
	pop bp
	pop cx
	
ret

start:

mov ax,0
mov bx,0
mov dx,0
mov cx,0


mov bx,arr
mov cl,[size1]
mov si,0

for_loop:

	mov al,[bx+si]
	push ax  ; passing parameter number

	call sumDigits

	
	mov [bx+si],al


	
	inc si
	pop ax
	
dec cl	
jnz for_loop
	
	
	
MOV ax,0X4C00
INT 21H


arr :db 19,24,13,11,19,25,38,99,75,17
size1 :db 10
