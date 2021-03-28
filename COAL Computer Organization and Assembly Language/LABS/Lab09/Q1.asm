[org 0x0100]
jmp start

clrscr:
	mov ax, 0xB800
	mov es, ax
	mov di, 0
	
	nextloc:
	mov word[es:di], 0x0720
	add di, 2
	cmp di, 4000
	jne nextloc
ret

printstar:
	mov ax, 0xB800
	mov es, ax
	mov di, bx
	
	loop1:
	mov word[es:di], 0x0F2A
	add di, 2
	loop loop1
ret

start:
	call clrscr
	
	mov bx,260
	mov cx,1
	call printstar
	add bx,160
	mov cx,2
	call printstar
	add bx,160
	mov cx,3
	call printstar
	
	add bx,70
	mov cx,1
	call printstar
	add bx,90
	mov cx,4
	call printstar
	
	add bx,70
	mov cx,2
	call printstar
	add bx,90
	mov cx,5
	call printstar
	
	add bx,70
	mov cx,3
	call printstar
	add bx,90
	mov cx,6
	call printstar
	
	add bx,70
	mov cx,4
	call printstar
	add bx,90
	mov cx,7
	call printstar
	
	add bx,70
	mov cx,5
	call printstar
	add bx,90
	mov cx,8
	call printstar
	
	add bx,70
	mov cx,6
	call printstar
	add bx,90
	mov cx,9
	call printstar
	
	add bx,70
	mov cx,7
	call printstar
	add bx,90
	mov cx,10
	call printstar
	
	;lines
	add bx,70
	mov cx,58
	call printstar
	add bx,162
	mov cx,60
	call printstar
	add bx,158
	mov cx,58
	call printstar
	
	add bx,160
	mov cx,7
	call printstar
	add bx,90
	mov cx,10
	call printstar
	
	add bx,70
	mov cx,6
	call printstar
	add bx,90
	mov cx,9
	call printstar
	
	add bx,70
	mov cx,5
	call printstar
	add bx,90
	mov cx,8
	call printstar
	
	add bx,70
	mov cx,4
	call printstar
	add bx,90
	mov cx,7
	call printstar
	
	add bx,70
	mov cx,3
	call printstar
	add bx,90
	mov cx,6
	call printstar
	
	add bx,70
	mov cx,2
	call printstar
	add bx,90
	mov cx,5
	call printstar
	
	add bx,70
	mov cx,1
	call printstar
	add bx,90
	mov cx,4
	call printstar
	
	add bx,160
	mov cx,3
	call printstar
	add bx,160
	mov cx,2
	call printstar
	add bx,160
	mov cx,1
	call printstar
	
mov ax,0x4c00
int 0x21