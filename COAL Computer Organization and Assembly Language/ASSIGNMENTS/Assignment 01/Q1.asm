[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov al,[num]
	mov bx,arr
	mov si,1
	
	L1:
	cmp si,[size]
	je skip
	
	shl al,1
	rcl byte [bx],1
	cmp byte[bx],16
	jb S1
	je F1
	rcr byte [bx],1
	clc
	rcr byte [bx],1
	jmp F2
	F1:
	mov byte [bx],0
	F2:
	stc
	rcl byte [bx+1],1
	S1:
	cmp byte[bx],5
	jb N1
	add byte[bx],3
	jmp N2
	
	N1:
	clc
	rcl byte [bx+1],1
	cmp byte[bx+1],5
	jb N2
	add byte[bx+1],3
	jmp N2
	
	N2:
	INC SI
	jmp L1
	skip:
	
mov ax,0x4c00
int 21h

	num: db 24
	arr: times 2 db 0 ;2 size db type arry for storin digets
	size: dw 8 ;size of num bits