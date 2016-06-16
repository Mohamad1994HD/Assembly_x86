
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		; 
SP_      EQU 20H
CONF     EQU 1FH ; High intensity white on blue
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		; 
		MOV AH, 09H
		MOV BH, 00H
		MOV AL, SP_
		MOV CX, 800H
		MOV BL, CONF
		INT 10H
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




