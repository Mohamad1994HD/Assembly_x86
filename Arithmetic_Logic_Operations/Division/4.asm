
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		; 
DATA1   DW  10
DATA2   DW  2
RESULT  DW  ?  
REMINDER DW ?
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX      
		MOV AX,0000H
		;          
		MOV AX, DATA1
		DIV DATA2
		MOV RESULT, AX
		MOV REMINDER, DX
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




