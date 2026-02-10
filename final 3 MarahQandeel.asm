


; final project 3 by marah qandeel



org 100h                                  
 ; read numb
mov ah,1h
int 21h
sub al,30h 
mov cl ,al 
mov ax,1

 
fact_loop:
mul cl  ;ax=ax*cl
dec cl
cmp cl,1
jnz fact_loop 



; convert yo ascii 

mov bx,10 
mov cx,0  


convert:
mov dx,0
div bx
push dx
inc cx
cmp ax,0
jne convert


; print result 
print:
pop dx
add dl,30h
mov ah,2h
int 21h 
loop print

ret
 



                          