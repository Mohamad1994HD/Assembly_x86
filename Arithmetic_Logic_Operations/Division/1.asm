
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
DATA1    DB  60
DATA2    DB  10
RESULT   DB  ?
REMINDER DB  ?   
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX       
		MOV AX,0000H
		;           
		; DIRECT ADDR MODE
	;	CALL DIR_DIV
		; REGISTER ADDR MODE
	;	CALL REG_DIV
		; INDIRECT ADDR MODE 
		CALL IND_DIV
		
		; SAVE ANS
		MOV RESULT, AL
		MOV REMINDER, AH
		;
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
DIR_DIV:    MOV AL,DATA1
            DIV DATA2
            RET
        ;
REG_DIV:    MOV AL,DATA1
            MOV BL,DATA2
            DIV BL
        ;
IND_DIV:    MOV AL, DATA1
            MOV BX, OFFSET DATA2
            DIV BYTE PTR  [BX]
        ;
		END MAIN
ret




