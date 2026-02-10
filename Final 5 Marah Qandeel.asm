

;final 5 Marah Qandeel


org 100h 

jmp Start 

msg1 db "Enter first number: $"
msg2 db 13,10,"Enter second number: $"
msg3 db 13,10,"Enter operation (+ - * /): $"
msg4 db 13,10,"Result = $"
err  db 13,10,"Error: Wrong operator!$"
num1 db ?
num2 db ?
op   db ?
res  db ?

Start:

; print msg1

lea DX,msg1
Mov Ah,9

int 21h


; inpot first num
mov cl,10
mov ah,1
int 21h
sub al,30h
mov num1,al

            
; print msg2

lea DX,msg2
Mov Ah,9

int 21h


; inpot sec num
mov cl,10
mov ah,1
int 21h
sub al,30h
mov num2,al

; inpot operter

lea DX,msg3
Mov Ah,9

int 21h


; select opertor

mov ah,1h
int 21h
mov op,al


; perform operation 
mov al,num1
mov bl, num2
              
              
cmp op,'+'               
je Add_op



cmp op,'-'
je Sub_op

cmp op,'*'
je Mul_op

cmp op,'/'
je Div_op 


; Wrong operator
mov ah,09h
lea dx,err
int 21h
jmp EXIT



Add_op:
add al,bl
mov dx,ax
add dx,3030h
mov dl,dh
jmp SHOW

Sub_op: 
sub al,bl
jmp SHOW

Mul_op:
mul bl
jmp SHOW


Div_op:
cmp bl,0
je Error_Div
 
mov ah,0
div bl
jmp ShOW


Error_Div: 
mov ah,09h
lea dx, err
int 21h
jmp exit



SHOW:

 mov res,al

mov ah,09h
lea dx,msg4
int 21h

mov al,res
add al,30h
mov dl,al
mov ah,02h
int 21h 
    
    
    
    
    
EXIT:
mov ah,4Ch
int 21h







       













































