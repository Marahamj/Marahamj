


; finad b by Marah Qandeel


org 100h

lea si, str
mov al, chr

SEARCH:
mov bl,[si]
cmp bl,'$'
JE Not_Found 


cmp bl,al 
JE Found


inc si
jmp SEARCH



Found:
lea dx, msg1
mov ah, 09h
int 21h
jmp exit


Not_Found:
lea dx, msg2
mov ah, 09h
int 21h
        
        
        
exit:
mov ah, 4Ch
int 21h        
        
;

str db 'HELLO WORLD$'
chr DB 'O'
msg1 db 10,13,'CHAR FOUND$'

msg2 db 10,13,'CHAR NOT FOUND$'