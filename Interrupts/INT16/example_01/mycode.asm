
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
BELL    EQU 07H
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		; 
RP:     MOV AH, 02H
        MOV DL, BELL
        INT 21H
        MOV AH, 01H
        INT 16H 
        JZ RP
        CMP AL,'q'
        JNE RP		
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




