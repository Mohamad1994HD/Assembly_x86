
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;  
DATA1   DD  62562FAH
DATA2   DD  412963BH
RESULT  DD  ?
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;  
		MOV BX, WORD PTR DATA1
		SUB BX, WORD PTR DATA2
		MOV WORD PTR RESULT, BX
		
		MOV BX, WORD PTR DATA1+2
		SBB BX, WORD PTR DATA2+2
		MOV WORD PTR RESULT+2, BX
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




