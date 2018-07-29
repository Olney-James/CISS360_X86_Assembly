; Str_remove.asm - program with a procedure named Str_remove that removes n characters from a string. A pointer is passed to the position in the string where the 
; characters are to be removed. An integer is then passed specifying the number of characters to remove.
; Chapter 9
; Section 9.10 Exercise 3
; Author: James Olney
include Irvine32.inc

.data
target BYTE "abcxxxxdefghijklmop",0
beforeStr BYTE "Before: ",0
AfterStr BYTE "After: ",0
	
.code
	Str_remove PROTO,
		targetStr:PTR BYTE,
		amount:DWORD
	
    main PROC
		mov edx,OFFSET beforeStr
		call WriteString
		mov edx,OFFSET target
		call WriteString
		call Crlf

        INVOKE Str_remove, ADDR [target+3], 4

		mov edx,OFFSET afterStr
		call WriteString
		mov edx,OFFSET target
		call WriteString
		call Crlf
	invoke ExitProcess,0
main endp

	Str_remove PROC USES esi ecx,
		targetStr:PTR BYTE,
		source:DWORD
		
		invoke Str_length,targetStr
		mov ecx,eax						; set counter
		add ecx,1						; include null
		sub ecx,source					; set counter for the rep
		mov esi,targetStr				; ESI points to the source
		add esi,source					; point to first x
		mov edi,targetStr				; EDI points to the target

		cld								; clear direction flag
		rep movsb

		ret
	Str_remove ENDP


end main