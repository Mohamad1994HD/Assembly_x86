
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
      
       
GETCHR  MACRO
        MOV AH, 01H
        INT 21H 
        ENDM   

CHK_CHR    MACRO   
		    CMP AL,'u'
		    JE UP_SP
		    CMP AL, 'd'
		    JE DOWN_SP		     
ENDM

DISP MACRO STR
        MOV DX, OFFSET STR
        MOV AH, 09H
        INT 21H
ENDM

HANDLE_MOUSE MACRO 
        MOV AX, 03H
        ;AND BX, 0
        INT 33H
        CMP BX, 1
        JE LEFT_PRESSED
        CMP BX, 2
        JE RIGHT_PRESSED
        
ENDM  

INIT_MOUSE MACRO    
        MOV AX,0
        INT 33H
ENDM  

SHOW_MOUSE MACRO
            MOV AX,01H
            INT 33H
            ENDM
; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
UPSPEED DB  'Up speed','$'
DOWNSPEED DB 'Down speed','$'
LEFTP   DB  'Left Pressed','$'
RIGHTP  DB  'Right Pressed','$'

		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;      
		INIT_MOUSE
		SHOW_MOUSE 
RP:		HANDLE_MOUSE         
;       GETCHR
;		CHK_CHR  
;		JMP RP
;UP_SP:  DISP UPSPEED
;        JMP RP
;DOWN_SP:DISP DOWNSPEED 
        JMP RP
LEFT_PRESSED:  DISP LEFTP 
        JMP RP
RIGHT_PRESSED: DISP RIGHTP
        JMP RP
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




