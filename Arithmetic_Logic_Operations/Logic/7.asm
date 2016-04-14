

org 100h


; add your code here
            .MODEL SMALL
            .STACK 64
            ;----------
            .DATA
DATA_IN     DB  25H, 12H, 15H, 1FH, 2BH
SUM         DB  ?
            ;----------
            .CODE
MAIN        PROC FAR
            MOV AX, @DATA
            MOV DS, AX
            ;-----
            MOV CX, 05
            MOV BX, OFFSET DATA_IN
            MOV AL, 0
AGAIN:      ADD AL, [BX]
            INC BX
            DEC CX
            JNZ AGAIN
            ;
            MOV SUM, AL
            ;
            MOV AH, 4CH
            INT 21H
MAIN        ENDP    
            ;
            ;
            END MAIN
ret




