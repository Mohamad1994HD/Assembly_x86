

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
X       DB  15, 24,  1, 12, 14, 11, 23, 22, 16, 12
Y       DB  12, 23, 28, 19, 15, 19, 25, 18, 26, 21
Z       DB  ?		
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;   
		MOV SI, OFFSET X
		MOV DI, OFFSET Y
		;
        MOV CX, 10
RE:     MOV AL, [SI]
        SUB AL, [DI]
        JNC OVER
        NOT AL
        INC AL
OVER:   ADD Z,AL
        INC SI
        INC DI
        LOOP RE
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




