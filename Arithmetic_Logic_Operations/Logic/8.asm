

org 100h

; add your code here
    		.MODEL SMALL
    		.STACK 64
    		;
    		.DATA
DATA_IN     DB  25H, 4FH, 1FH, 2BH, 0C4H
COPY        DB  6 DUP(?)
    		;
    		.CODE
MAIN		PROC FAR
    		MOV AX, @DATA
    		MOV DS, AX    
    		;
    		MOV SI, OFFSET DATA_IN
    		MOV DI, OFFSET COPY 
    		MOV CX, 06H
    		;      
LP:         MOV AL, [SI]
            MOV [DI], AL
            INC SI
            INC DI
            DEC CX
            JNZ LP
            ; 
    		;
    		MOV AH, 4CH
    		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




