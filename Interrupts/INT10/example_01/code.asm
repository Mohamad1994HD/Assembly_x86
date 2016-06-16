

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;      		
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;      
        CALL CLEAR
        CALL SETCUR		
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		; 
CLEAR PROC 
          MOV AH, 06H
          MOV BH, 07H
          MOV CX, 0
          MOV DX, 184FH
          INT 10H
          RET
CLEAR ENDP 

SETCUR PROC
          MOV AH, 02H
          MOV BH, 00H
          MOV DL, 39
          MOV DH, 12
          INT 10H
          RET
SETCUR ENDP

		END MAIN
ret




