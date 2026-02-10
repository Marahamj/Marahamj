
; final 4 by Marah Qandeel



org 100h 

sort db 1,5,7,2,3,4
len db 6 

mov cl ,len
dec cl
       
       
outerloop:
mov si,0
mov ch,cl


ineerloop:
mov al,[si]
mov bl,[si+1]


cmp al, bl
jbe no_swap       
       
       
       
mov sort[si], bl
mov  sort[si+1],al

no_swap:
inc si 
dec ch
jnz ineerloop


dec cl
jnz outerloop



       
       
       
mov ah, 4ch
int 21h       
       
       
       
       
       

 
