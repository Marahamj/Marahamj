org 100h 

mov AX,0
mov CX ,11011b
mov DL,0fh
mov DH,5fh    

mov BX,0254h
mov DS,BX

mov Al,DL
mov SI,CX

mov [SI+15],DX

ret