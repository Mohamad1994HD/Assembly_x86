
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		; 
DATA1   DW  10000
DATA2   DD  105432
QUOT    DW  ?
REM     DW  ?
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX 
		MOV AX,0000H
		MOV DX,0000H
		;           
		MOV AX, WORD PTR DATA2
		MOV DX, WORD PTR DATA2+2
		;
		DIV DATA1
		MOV QUOT, AX
		MOV REM,  DX
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




