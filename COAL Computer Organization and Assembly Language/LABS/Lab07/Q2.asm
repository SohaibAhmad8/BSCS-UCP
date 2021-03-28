[org 0x100]
	
JMP start
	
	size: dw 20
	Array1: dw 0XE5, 0X12, 0XDD, 0XAB, 0X5A, 0XC3, 0X4A, 0X46, 0X76, 0X87
	Array2: dw 0XAB, 0X12, 0XDD, 0XCD, 0X5A, 0XC3, 0X4A, 0X65, 0X76, 0XEE
	Array3: dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	
is_paresent:

	mov di,0
	F1:
	cmp di,[size]
	je e
	cmp dx,[Array2+di]
	je F2
	add di,2
	jmp F1
	F2:
	mov [bx],dx
	add bx,2
	e:
RET

start:
	mov bx,Array3
	mov si,0
	
	L1:
	cmp si,[size]
	je exit
	mov dx,[Array1+si]
	call is_paresent
	add si,2
	jmp L1
	
	exit:
	
mov ax, 0x4c00
int 21h