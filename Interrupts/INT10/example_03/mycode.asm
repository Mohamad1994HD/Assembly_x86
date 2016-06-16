
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		; 
		CALL CLEAR
		CALL CONF
		MOV CX, 100
		MOV DX, 50
		CALL DRAW
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
CLEAR   PROC
        MOV AH, 06H
        MOV BH, 07H
        MOV CX, 0
        MOV DX, 184FH
        INT 10H
        RET
CLEAR   ENDP   

CONF    PROC
        MOV AH, 00H
        MOV AL, 13H
        INT 10H 
        RET
CONF    ENDP
               
DRAW    PROC
BACK:   MOV AH, 0CH
        MOV AL, 01H
        INT 10H
        INC CX
        CMP CX, 200
        JNZ BACK
        RET
DRAW    ENDP
		END MAIN
ret




