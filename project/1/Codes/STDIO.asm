; Standard Input Output

INIT_MOUSE MACRO
            MOV AX, 0
            INT 33H
ENDM   

SHOW_MOUSE MACRO
            MOV AX, 01H
            INT 33H
ENDM           

HIDE_MOUSE MACRO
            MOV AX, 02H
            INT 33H
ENDM           

HANDLE_MOUSE_CLICK MACRO BTN 
      LOCAL LEFT_, RIGHT_, MIDDLE_
            MOV BX, 0
            MOV AX, 03H
            INT 33H
            
			CMP BL, 00H
			JE ENDIF;
            CMP BL, 01H
            JE LEFT_
            CMP BL, 02H
            JE RIGHT_  
            CMP BL, 04H
            JE MIDDLE_ 
            JMP ENDIF
            
      LEFT_:    MOV BTN, 'l'
                JMP ENDIF
      RIGHT_:   MOV BTN, 'r'
                JMP ENDIF
      MIDDLE_:  MOV BTN, 'm'
      
      ENDIF:    ;
ENDM

DISPLAY	MACRO	STR
		MOV AH, 09H
		MOV DX, OFFSET STR
		INT 21H
ENDM

DISPLAY_N MACRO	  STR
	DISPLAY STR
	DISPLAY_CHR 10
	DISPLAY_CHR 13
ENDM

DISPLAY_CHR MACRO CHAR
     MOV DL, CHAR
     MOV AH, 02H
     INT 21H
ENDM

GETSTR MACRO STR
ENDM
; detect key press from user blocking
SYNC_GETCHR	MACRO	TO
		MOV AH, 01H
		INT 21H
		MOV TO, AL
		AND AL, 0
ENDM
; detect key press from user non-blocking
ASYNC_KEY MACRO
	MOV AH, 01H
	INT 16H
ENDM
; get character from user non-blocking
ASYNC_GETCHR MACRO CHR
	LOCAL PASS
	MOV CHR, 0
	ASYNC_KEY
	JZ PASS ; no key pressed
	; key pressed
	MOV AH, 0
	INT 16H
	MOV CHR, AL
	PASS: ;
ENDM

