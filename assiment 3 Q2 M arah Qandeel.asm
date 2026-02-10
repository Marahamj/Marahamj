include emu8086.inc
org 100h

; print HELLO
mov si, offset msg
mov cl, len
mov ch, 0

lop1:
mov al,[si]
mov ah,0Eh
int 10h
inc si
loop lop1

; new line
mov ah,0Eh
mov al,0Dh
int 10h
mov al,0Ah
int 10h

;move  
mov ah,02h
mov bh,0
mov dh,12
mov dl,40
int 10h

;print is DONE 
mov si, offset DONE_MSG
mov cl, len2
mov ch, 0

lop2:
mov al,[si]
mov ah,0Eh
int 10h
inc si
loop lop2


mov ah,4Ch
int 21h


msg db 'HELLO'
len db 5
DONE_MSG db 'is DONE'
len2 db 7
