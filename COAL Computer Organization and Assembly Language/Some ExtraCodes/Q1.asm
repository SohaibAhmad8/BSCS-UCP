[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov al,[num]
	mov bx,arr
	mov si,0
	
	jmp Start
	
	num: db 24
	arr: times 2 db 0 ;2 size db type arry for storin digets
	size: dw 8 ;size of num bits
	
	F1:
	cmp byte[bx],16
	jl fr1
	sub byte [bx],16
	mov cl,1
	shr cl,1
	rcl byte [bx+1],1
	jmp fr2
	fr1:
	mov cl,0
	shr cl,1
	rcl byte [bx+1],1
	fr2:
	ret
	
	F2:
	cmp byte[bx],5
	jl r2
	add byte [bx],3
	r2:
	ret
	
	F3:
	cmp byte[bx+1],5
	jl r3
	add byte [bx+1],3
	r3:
	ret
	
	Start:
	shl al,1
	rcl byte [bx],1
	call F1
	add si,1
	cmp si,[size]
	je skip
	call F2
	call F3
	jmp Start
	
	skip:
	
mov ax,0x4c00
int 21h
