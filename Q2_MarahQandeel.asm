;Q2 BY MARAH QANDEEL

ORG 100h
 
mov AH,07h
mov NUM_SET[4],AH 
mov DH,NUM_SET[2]  
mov AL,NUM_SET [5] 
mov TempStore,AL
mov TempStore ,0cch

RET

LEN EQU 08h
NUM_SET DB 10,20,30,40,50,60,70,80 
TempStore DB ?
