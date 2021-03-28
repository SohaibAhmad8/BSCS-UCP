[org 0x100]

		mov dl,[num1];
		mov bl,[num2];
		
check:	cmp bl,0
		je end;
		
		shr bl,1;
		jc J1:
		
		shl dx,1;
		jmp check;
		
J1:		add ax,dx;
		shl dx,1
		jmp check;
		
end:	mov [result],al

mov ax,0x4c00
int 21h

	num1: db 18
	num2: db 12
	result: dw 0