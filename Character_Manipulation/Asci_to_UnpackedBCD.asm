              
;
;   ASCII TO UNPACKED BCD
;

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
ASC     DB  '7392019347'
UNPAK   DB  10 DUP(?)
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX      
		MOV CX, 10
		;	
		SUB BX, BX
AGAIN:  MOV AX, WORD PTR ASC[BX]
        AND AX, 0F0FH
        MOV WORD PTR UNPAK[BX], AX
        INC BX 
        INC BX
        LOOP AGAIN
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




