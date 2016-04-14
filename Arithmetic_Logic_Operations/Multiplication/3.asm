
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
		MOV AX, 3333H; Arbitrary number
		AND AL,00FH
		MOV CL,4
		SHR AH,CL
		MUL AH
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




