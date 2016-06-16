
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
D       DB  44H  
CONF    DB  0F0H
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		; 
		MOV AH, 09H
		MOV BH, 00H
		MOV AL, D
		MOV CX, 200H
		MOV BL, CONF ; Configuration for blinking
		INT 10H
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




