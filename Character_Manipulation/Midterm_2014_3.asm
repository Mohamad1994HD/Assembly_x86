;
; Write a program to 
; a) convert A='28' B='54' from ASCII to PACKED BCD
; b) Sum the PACKED BCD and store the answer in memory
; Assume the answer is a byte
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




