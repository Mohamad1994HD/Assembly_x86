
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
DATA1   DB  01H
DATA2   DB  02H
DATA3   DB  ?   
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;   
		MOV DH, DATA1
		MOV BH, DATA2
		SUB DH,BH
		JNC NEXT
		CALL DH_TWOS
NEXT:   MOV DATA3, DH
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;

DH_TWOS:    NOT DH
            INC DH
            RET
		END MAIN   
		
ret




