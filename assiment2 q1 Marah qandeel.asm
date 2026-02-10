

; q1by Marah Qandeel 
                                                  
                                                  
;a*Print the following message: "Array Elements: ".

;b.Define an array of the form arr DB 'A', 'B', 'C', 'D', 'E'
;c.Print the array elements to the screen using the INT 21H interrupt
;d.Be sure to use a LOOP to repeatedly print the elements of the array.

org 100h

mov dx,offset msg
mov ah ,09h
int 21h 


mov si,offset arr
mov cx, 5

print_loop: 
  mov dl,[si]
  mov ah, 02h
  int 21h 
    
    
  mov dl, ' '
  mov ah,02h
  int 21h
  
  inc si
  
loop print_loop


ret
                         
msg db 'Array Elements: $'  
arr db 'A', 'B' , 'C' , 'D', 'E'


