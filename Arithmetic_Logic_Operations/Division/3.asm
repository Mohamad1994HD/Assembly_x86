
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;                 
DATA1    DW  2055
DATA2    DB  100     
RESULT   DB  ?
REMINDER DB ?
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		MOV AX,0000H
		;          
		MOV AX, DATA1
		DIV DATA2
		MOV RESULT, AL
		MOV REMINDER, AH
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




