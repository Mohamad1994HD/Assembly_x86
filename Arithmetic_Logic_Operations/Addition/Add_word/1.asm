
org 100h


; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;---------------------
WAGES   DW  27345, 28521, 29533, 30105, 32375
COUNT   EQU 5
SUM     DW  2 DUP(?)
		;---------------------
		.CODE
MAIN		PROC FAR
    		MOV AX, @DATA
    		MOV DS, AX
    		;
    		MOV AX, 0000H
    		MOV BX, AX
    		MOV CX, COUNT
    		;
    		MOV SI, OFFSET WAGES
     
		;---------------------  
ADD_LP:     ADD AX,[SI]
            JNC IF_NO_CARRY
            INC BX
            
IF_NO_CARRY:INC SI
            INC SI
            DEC CX
            JNZ ADD_LP
		;--------------------- 
		    MOV SUM, AX
		    MOV SUM+2, BX
		;    
    		MOV AH, 4CH
    		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




