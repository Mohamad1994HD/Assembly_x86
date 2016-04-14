
org 100h
       

       
; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;------------------------   
Wages   DB  125, 235, 197, 91, 48
DaysNum EQU 05
SUM     DW  ?
		;------------------------          
		
		.CODE
MAIN		PROC FAR
    		MOV AX, @DATA
    		MOV DS, AX
    		;
    		MOV AX,00H
    		MOV SI, OFFSET Wages 
    		MOV CX, DaysNum
    		;---------
ADD_LP:     ADD AL, [SI]
            JNC IF_NO_CARRY
            INC AH

IF_NO_CARRY:INC SI
            DEC CX
            JNZ ADD_LP
    		
    		; --------
    		MOV SUM, AX      
    		;
    		
    		MOV AH, 4CH
    		INT 21H
MAIN		ENDP
		    ;
		END MAIN
ret




