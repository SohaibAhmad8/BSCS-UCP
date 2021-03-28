[org 0x100]
jmp start

function:
loop:
	mov ah,0
	int 16h
	cmp al,0xd
	je exit
	mov ah,0xe
	int 10h
	jmp loop
	exit:
iret

	
start:
	mov ax,0
	mov es,ax
	mov ax,function
	mov [es:17h*4],ax
	mov [es:17h*4+2],cs
	
	int 17h
	
mov ax,0x4c00
int 21h