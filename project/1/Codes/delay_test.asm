
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

TDELAY MACRO t
    LOCAL W1
        MOV CX, t
        PUSH AX
     W1:    SUB ah,ah
            ;DEC CX
            ;INC AL;, 61H
            ;AND AL, 10H
            ;CMP AL, AH
            ;JE W1
            ;MOV AH, AL
            LOOP W1
        POP AX
ENDM  

; add your code here
        INCLUDE 'STDIO.mac'
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;  
BDE     DB  'Before Delay','$'
ADE     DB 'After Delay','$'
TIME    DW   0003H	
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;  
		r:
	    DISPLAY BDE  
	    ;MOV CX, TIME
		;TDELAY TIME
		TDELAY TIME
		DISPLAY ADE
		JMP r    	
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




