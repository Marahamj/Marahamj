


; Final projct By Marah Qandeel
;1

org 100h

mov si,0
mov al,arr[si] 
mov  LRGST, al
 
 
INC si 
 
mov cx,4 

LOOP1:
mov al,arr[si]     ;Moving the item to AL 
cmp al,LRGST 

JLE SKIP
MOV al,arr[si]
MOV LRGST,al

SKIP:
INC si
LOOP LOOP1



ret
arr DB 10,50,80,60,70
LRGST DB 0