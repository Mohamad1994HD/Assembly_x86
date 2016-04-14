
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		; 
A       DB  13, 99, 87, 90, 50, 76, 75, 97
B       DB  18, 26, 18, 19, 20, 26, 35, 17
SUMA    DW  ?
SUMB    DW  ?
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		; 
		AND AX,0000H     
		MOV BX,OFFSET A
	    CALL SUM_
	    MOV SUMA, AX
	    
	    AND AX, 0000H
	    MOV BX, OFFSET B
	    CALL SUM_
	    MOV SUMB, AX    
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;  

SUM_:    MOV CX, 0007H
LOP:    ADD AL, [BX]  
        INC BX
        LOOP LOP
        RET
        
		END MAIN
ret




