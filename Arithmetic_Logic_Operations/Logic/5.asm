
;
;
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;  
A       DB  64, 37, 77, 94, 65, 9
B       DB  2, 4, 6, 8, 16, 32, 64
C       DW  6 DUP(?) ; AxB
D       DB  6 DUP(?) ; A/B
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;
		MOV SI, OFFSET A
	    MOV DI, OFFSET C
	    MOV BX, OFFSET D
	    
		MOV CL, 1
		
REPEAT: MOV AL, [SI]
        SHL AX, CL  ; AxB
        ; Save into C
        MOV [DI], AX     
        MOV AL, [SI]
        SHR AL, CL   ; A/B 
        ; Save into D
        MOV [BX], AL 
        ; Increment pointers
        INC CL
        INC BX
        INC DI
        INC DI
        INC SI
        CMP CL, 06H
        JNE REPEAT        
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




