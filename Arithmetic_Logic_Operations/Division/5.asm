
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
X1      DB  3
X2      DB  6
X3      DB  9
ANS     DB  ?
REM     DB  ?		
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;
		SUB AX, AX
		CALL CALC
		MOV REM, AH
		MOV ANS, AL
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;        
CALC:   MOV AL, X1
        MUL X2
        
        MOV BL, AL
        
        MOV AL, X2
        MUL X3
        ADD BL, AL
        
        MOV AL, X3
        MUL X1
        ADD BL, AL
        
        MOV AL, X1
        ADD AL, X2
        ADD AL, X3
        XCHG AL, BL
        DIV BL
        RET
		END MAIN
ret




