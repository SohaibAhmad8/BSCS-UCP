[org 0x100]

	;Flush Garbage from Registers
	MOV ax, 0
	MOV bx, 0
	MOV cx, 0
	MOV dx, 0

	; Restriction : using Direct addressing mode, take address of fourth variable.
	
	;START
	MOV dl, [Num4-4]	;Num1
	ADD ax, dx
	MOV dl, [Num4-3]	;Num2
	ADD ax, dx
	MOV dx, [Num4-2]	;Num3
	ADD ax, dx
	;Flush DX
	MOV dx, 0
	;
	MOV dl, [Num4]	;Num4
	ADD ax, dx
	MOV dx, [Num4+1]	;Num5
	Add ax, dx
	;Flush DX
	MOV dx, 0
	;
	MOV dl, [Num4+3]	;Num6
	ADD ax, dx
	MOV dx, [Num4+4]	;Num7
	ADD ax, dx
	MOV dx, [Num4+6]	;Num8
	ADD ax, dx
	;Flush DX
	MOV dx, 0
	;
	MOV dl, [Num4+8]	;Num9
	ADD ax, dx
	MOV dx, [Num4+9]
	ADD ax, dx
	
;			N1 N2 N3    N4 N5    N6 N7    N8    N9 N10
;	Num1	11 CE CD FA FA 9C FF FE 48 0D AB A2 65 53  04

	MOV [SUM], ax 
	
	; Result should be : 
	; = B1EB
	;DONE...
mov ax,0x4c00
int 21h

	Num1: db 17
	Num2: db -50
	Num3: dw 0xFACD
	Num4: db 250
	Num5: dw -100	; FF9C
	Num6: db 254
	Num7: dw 3400	; 0D48
	Num8: dw 0xA2AB
	Num9: db 65h
	Num10: dw 0x453
	SUM: dw 0

;			N1 N2 N3    N4 N5    N6 N7    N8    N9 N10
;	Num1	11 CE CD FA FA 9C FF FE 48 0D AB A2 65 53  04



