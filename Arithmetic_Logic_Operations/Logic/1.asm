                                            

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;     
GRADES  DB  96,69,86,30,100
COUNT   EQU 5
		;
		.CODE
MAIN		PROC FAR
    		MOV AX, @DATA
    		MOV DS, AX
    		;
    		SUB AX,AX             
    		MOV CX, COUNT
    		MOV BX, OFFSET GRADES
AGAIN: 		CMP AL, [BX]
    		JA  OVER
    		MOV AL,[BX]
OVER:       INC BX
            LOOP AGAIN
    		;
    		MOV AH, 4CH
    		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




