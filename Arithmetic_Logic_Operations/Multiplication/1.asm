
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
DATA1   DB  25H
DATA2   DB  65H
RESULT  DW  ?
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;          
		; REGISTER ADDR MODE
		CALL REG_ADDR_MODE  
		; DIRECT ADDR MODE
		CALL DIR_ADDR_MODE
		; REGISTER INDIRECT ADDR MODE
		CALL INDIR_MODE              
		; SAVE THE ANSWER
		MOV RESULT,AX
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;              
REG_ADDR_MODE:	MOV AL, DATA1
        		MOV BL, DATA2
        		MUL BL                            
                RET 

DIR_ADDR_MODE:	MOV AL, DATA1
        		MUL DATA2
        		MOV RESULT, AX
                RET
                
INDIR_MODE:   MOV AL, DATA1
		      MOV SI, OFFSET DATA2
	          MUL BYTE PTR [SI]
		      RET     
		      
		END MAIN
ret




