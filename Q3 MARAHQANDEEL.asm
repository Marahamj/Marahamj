
;Q3 BY MARAH QANDEEL

org 100h 
mov BX,OFFSET arr1[0]
mov AL,[BX]
mov arr2[0],AL 

mov SI,OFFSET arr1[1]
mov AH,[SI]
mov arr2[1],AH 


mov DI,OFFSET arr1[2]
mov CH,[DI]
mov arr2[2],CH 


ret

arr1 db 10,20,30
arr2 db 3 dup(?)
   
