[org 0x100]
jmp start
	
	Sample_array: db 0x1B, 0XAA, 0X075, 0X63, 0X23, 0X00, 0X00, 0X01, 0X40, 0X9E
	Total_ones: db 0
	Total_zeros: db 0

count:
	mov di,0
	loop2:
		cmp di,8
		je exit2
		
		rcr al,1
		
		jc n1
		add cl,1
		jmp n2
		
		n1:
		add dl,1
		n2:
		
		add di,1
		jmp loop2
	exit2:
ret

start:
	mov ax, 0
	mov bx, Sample_array
	mov cx, 0
	mov dx, 0
	mov si,0
	
	loop1:
		cmp si,10
		je exit1
		
		mov al,[bx+si]
		call count
		
		add si,1
		jmp loop1
	exit1:
	
	mov byte[Total_ones],dl
	mov byte[Total_zeros],cl

mov ax,0x4c00
int 21h