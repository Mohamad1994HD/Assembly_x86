org 100H

; add your code here
            .MODEL SMALL
            .STACK 64
            ;
            .DATA
DATA_IN     DW  234DH, 1DE6H, 3BC7H, 566AH
            ;ORG 0010H
SUM         DW  ?
            ;
            ;
            .CODE
MAIN        PROC FAR
            MOV AX, @DATA
            MOV DS, AX
            ;
            MOV CX, 04
            MOV DI, OFFSET DATA_IN
            MOV BX, 00
AGAIN:      ADD BX, [DI]
            INC DI
            INC DI       ; could use ADD DI,2 
            DEC CX
            JNZ AGAIN
            ;
            MOV SI, OFFSET SUM
            MOV [SI], BX
            ;
            MOV AH, 4CH
            INT 21H
MAIN        ENDP
            END MAIN
ret




