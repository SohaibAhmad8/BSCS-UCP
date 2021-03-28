[org 0x100]
jmp start
old_data: dd 0
ISR0:
MOV AX, 0XB800
MOV ES, AX;
MOV word [ES:0], 0X0741;
mov ax,0
mov es,ax
mov bx,[old_data]
mov [ES:0x16*4],bx ;saving the old values in a variable before overwritting.
mov bx,[old_data+2]
mov [ES:0x16*4+2],bx
IRET
start:
XOR DI, DI;
MOV ES, DI
mov AX, ISR0;
mov bx,[ES:0x16*4] ;saving the old values in a variable before overwriting.
mov [old_data],bx
mov bx,[ES:0x16*4+2]
mov [old_data+2],bx
MOV [ES:0x16*4],AX; ;hooking the interrupt
MOV [ES:0x16*4+2], CS;
pushf
push cs
push continue
jmp far [es:0x16*4]
continue:
mov ax,0x4c00
int 21h