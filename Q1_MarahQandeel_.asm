;Q1BY MARAHQANDEEL

org 100h

mov AL,15h
mov DL,'M' 
mov MemA ,AL
mov MemB, DL  

mov CL , [MemA]
mov BL , [MemB] 

mov MemA,30h
mov MemB,'Z'

ret               

;DATA

MemA db ?
MemB db ?