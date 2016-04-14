
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
A       DB  '28'
B       DB  '54'
C       DB  ?		
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		; 
		MOV AX, WORD PTR A
		MOV BX, WORD PTR B
		
		AND AX,00F0FH
		AND BX,00F0FH
		
		MOV CL,4
		
		SHL AL, CL
		SHL BL, CL
		
		OR AL, AH
		OR BL, BH
		
		AND BH, 0
		AND AH, 0
		
		ADD AL, BL
		MOV C, AL
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




