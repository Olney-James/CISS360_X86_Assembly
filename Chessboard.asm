; Chessboard.asm - A program that draws an 8 by 8 chess board, with alternating gray and white squares. It uses the SetTextColor and Gotoxy procedures from the Irvine32 library. 
;Global variables are avoided, and declared parameters are used in all procedures. Short procedures are used that are focused on a single task.
; Chapter 8
; Section 8.11 Exercise 2
; Author: James Olney
; https://media.pearsoncmg.com/ph/esm/ecs_irvine_x86_6/videos/Chapt8_Exercise9/index.html
include Irvine32.inc

.data
	; Prototypes:
		SetColor PROTO forecolor:BYTE,backcolor:BYTE
		WriteColorChar PROTO char:BYTE,forecolor:BYTE,backcolor:BYTE
		PrintOddRow PROTO color:BYTE
		PrintEvenRow PROTO color:BYTE
	rows=8
	cols=8
	charsPerSquare=2
	
.code	
    main PROC
		mov ecx,rows/charsPerSquare				;loop 4x
		myLoop:
			invoke PrintOddRow,gray
			call Crlf							;newline
			invoke PrintEvenRow,gray
			call Crlf							;newline
		loop myLoop

        invoke SetColor,lightGray,black			;normal color
		call Crlf								;newline
		invoke ExitProcess,0
	main endp

WriteColorChar PROC USES eax,
	char:BYTE,forecolor:BYTE,backcolor:BYTE
	invoke SetColor,forecolor,backcolor
	mov al,char
	call WriteChar
	ret
WriteColorChar ENDP

SetColor PROC,forecolor:BYTE,backcolor:BYTE
	movzx eax,backcolor
	shl eax,4
	or al,forecolor
	call SetTextColor							;Irvine32.lib
	ret
SetColor ENDP

PrintOddRow PROC uses ecx,
	color:BYTE
	mov ecx,cols/charsPerSquare					;loop count
	myLoop2:
		invoke WriteColorChar,' ',color,color
		invoke WriteColorChar,' ',color,color
		invoke WriteColorChar,' ',white,white
		invoke WriteColorChar,' ',white,white
	loop myLoop2
	ret
PrintOddRow ENDP

PrintEvenRow PROC uses ecx,
	color:BYTE
	mov ecx,cols/charsPerSquare					;loop count
	L1:
		invoke WriteColorChar,' ',white,white
		invoke WriteColorChar,' ',white,white
		invoke WriteColorChar,' ',color,color
		invoke WriteColorChar,' ',color,color
	loop L1
	ret
PrintEvenRow ENDP

end main