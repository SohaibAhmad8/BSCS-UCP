[org 0x100]

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	mov bx,Num5

	mov ax,[bx]
	add [SUM],ax
	mov ax,0
	
	mov al,[bx-1]
	add [SUM],ax
	
	mov ax,[bx-3]
	add [SUM],ax
	mov ax,0
	
	mov al,[bx-4]
	add [SUM],ax
	
	mov al,[bx-5]
	add [SUM],ax
	
	mov al,[bx+2]
	add [SUM],ax
	
	mov ax,[bx+3]
	add [SUM],ax
	
	mov ax,[bx+5]
	add [SUM],ax
	mov ax,0
	
	mov al,[bx+7]
	add [SUM],ax
	
	mov ax,[bx+8]
	add [SUM],ax
	
mov ax,0x4c00
int 21h

	Num1: db 17
	Num2: db -50
	Num3: dw 0xFACD
	Num4: db 250
	Num5: dw -100
	Num6: db 254
	Num7: dw 3400
	Num8: dw 0xA2AB
	Num9: db 65h
	Num10: dw 0x453
	SUM: dw 0