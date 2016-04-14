
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
DATA1   DB  6BH
DATA2   DW  12C3H
RESULT  DW  2 DUP(?)
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX  
		MOV AX,0000H
		;         
		MOV AL,DATA1
		MUL DATA2
		MOV RESULT, AX
		MOV RESULT+2, DX
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




