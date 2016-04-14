

org 100h


            .MODEL SMALL
            .STACK 64
            ;
            ;
            .DATA
HIGH_DAT    DB  95H
            ;
            ;
            .CODE
START       PROC    FAR
            MOV AX, @DATA
            MOV DS, AX
            ;
            MOV AH, HIGH_DAT
            MOV BH, AH
            MOV DL, BH
            ;
            MOV AH, 4CH
            INT 21H
START       ENDP
            ;
            END START
ret




