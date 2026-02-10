
; Assiment3 MarahQandeel Q3 a)     


org 100h 

mov si, offset marks
mov cx,3
mov al, 0

        
        
sum_lop:
add al,[si]
inc si
loop sum_lop       


mov Sum,al


mov bl,3
div bl   ; AL = AL / 3



mov Avg,al


;c
mov AX,marks
mov BX,marks+1
mov CX, marks+2


mov Dl,Sum
mov BP,Avg


mov SI, offset Sum
mov DI , offset Avg


PUSHA


ret

marks db 60,80,90  
Sum db ?
Avg db ?     

















;b) After running the program, the values ??appeared in hexadecimal.

;The SUM value was 0E6h, which is equivalent to 230 decimal places after conversion.

;The AVG value was 4Ch, which is equivalent to 76 decimal places.

;This confirms the accuracy of the sum and average calculations.
;
;c) The first element of the array Marks(60) was moved to register AX.

;The second element of the array Marks(80) was moved to register BX.

;The third element of the array Marks(90) was moved to register CX.

;The value of SUM was moved to register DL.

;The value of AVG was moved to register BP.

;The OFFSET keyword was used to obtain the address of the variable SUM, and it was stored in register SI.

;The address of the variable AVG was obtained and stored in register DI.
;This means that we stored the location of the variable in memory, not its value.      







