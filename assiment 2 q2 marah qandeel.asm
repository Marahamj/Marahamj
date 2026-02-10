; q2 by Marah Qandeel 


org 100h;  
 
mov dx,offset str  
mov ah,09
int 21h

Mov si,offset arr1 
mov cx,3

input_loop:

mov AH ,1H
INT 21H      
MOV [si],AL 

mov dl ,' '
mov ah, 02h
int 21h 

inc si
loop input_loop

Mov si,offset arr1
mov di, offset arr2 
mov cx,3

copy_loop:

mov al,[si]  
mov [di],al

inc si
inc di

loop copy_loop


ret    

str db 'Array After adding new chracther :$'

arr1 db 3 dup(?)
arr2 db 3 dup(?)  