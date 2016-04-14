
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;  
DATA1   DB  'My nAme isZ'
DATA2   DB  11 DUP(?)
UPPER   DB  11011111B
a       DB  61H
z       DB  7AH
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX   
		MOV SI, OFFSET DATA1
		MOV BX, OFFSET DATA2
		MOV CX, 11
		;           
		
CONV:   MOV AL, [SI]
        CMP AL, a
        JB OVER ; leave it its upper case
        CMP AL, z   
        JA  OVER ; leave it its upper case
        ;
        AND AL, UPPER		
		;
OVER:   MOV [BX], AL
        INC SI
        INC BX
        LOOP CONV
        
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




