
org 100h


; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;--------------------   
DATA1   DQ  548FB9963CE7H
DATA2   DQ  3FCD4FA23B8DH
SUM     DQ  ?           
COUNT   EQU  0004H
		;--------------------
		
		.CODE
MAIN		PROC FAR
    		; SETUP
    		MOV AX, @DATA
    		MOV DS, AX
    		CLC
    		MOV SI, OFFSET DATA1
    		MOV DI, OFFSET DATA2
    		MOV BX, OFFSET SUM
    		MOV CX, COUNT
    		;
ADD_LP:     MOV AX, [SI]
            ADC AX, [DI]
            MOV BX, AX
            ; INCREMENTS
                INC SI
                INC SI
                INC DI
                INC DI 
                INC BX
                INC BX
            LOOP ADD_LP    		
    		;
    		MOV AH, 4CH
    		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




