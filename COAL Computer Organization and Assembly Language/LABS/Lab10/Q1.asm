[org 0x0100]
jmp start

	Array: db 'A quick brown fox jumps over the lazy dog.',0
	Value: db 5
	Vowel: db 'AEIOUaeiou',0

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

add_Value:
	push bp
	mov bp,sp
	
	push si
	push bx
	push ax
	push cx
	
	mov si, 0
	mov bx, [bp+4]
	mov ax, [bp+6]
	mov cx, [bp+8]
	
	loop2:
	add [bx+si], ax
	add si, 1
	loop loop2

	pop cx
	pop ax
	pop bx
	pop si
	pop bp
ret 6

is_vowel:
	push bp
	mov bp,sp
	
	push si
	push bx
	push ax
	push cx
	
	mov si, 0
	mov bx, Vowel
	mov ax, [bp+4]
	mov cx, 10
	
	mov word[bp+6], 1
	loop3:
	cmp [bx+si], al
	je exit1
	add si, 1
	loop loop3
	mov word[bp+6], 0
	
	exit1:
	pop cx
	pop ax
	pop bx
	pop si
	pop bp
ret 2

count_consonants:
	push bp
	mov bp,sp
	
	push si
	push bx
	push ax
	push cx
	push di
	
	mov di, 0
	mov si, 0
	mov bx, [bp+4]
	mov cx, [bp+6]
	
	loop4:
	push word 0
	mov ax, 0
	mov al, [bx+si]
	push ax
	call is_vowel
	pop ax
	cmp ax, 0
	jne n
	add di, 1
	n:
	add si, 1
	loop loop4

	mov [bp+8], di
	
	pop di
	pop cx
	pop ax
	pop bx
	pop si
	pop bp
ret 4

start:
	push word 0
	push Array
	call count_size
	pop cx
	
	push word 0
	push cx
	push Array
	call count_consonants
	pop dx
	
	push cx
	mov ax, 0
	mov al, [Value]
	push ax
	push Array
	call add_Value

mov ax,0x4c00
int 0x21