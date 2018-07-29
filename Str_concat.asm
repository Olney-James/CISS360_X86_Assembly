; Str_concat.asm - program with a procedure named Str_concat that concatenates a source string to the end of a target string. Sufficient space must exist in the 
;target string to accommodate the new characters. Pointers are passed to the source and target strings.
; Chapter 9
; Section 9.10 Exercise 2
; Author: James Olney
include Irvine32.inc

.data
targetStr BYTE "ABCDE",10 DUP(0)
sourceStr BYTE "FGH",0
beforeStr BYTE "Before: ",0
AfterStr BYTE "After: ",0
	
.code
	Str_concat PROTO,
		target:PTR BYTE,
		source:PTR BYTE
	
    main PROC
		mov edx,OFFSET beforeStr
		call WriteString
		mov edx,OFFSET targetStr
		call WriteString
		call Crlf
		mov eax,LENGTHOF sourceStr

        INVOKE Str_concat, ADDR targetStr, ADDR sourceStr 

		mov edx,OFFSET afterStr
		call WriteString
		mov edx,OFFSET targetStr
		call WriteString
	
		call Crlf
	invoke ExitProcess,0
main endp

	Str_concat PROC USES esi ecx,
		target:PTR BYTE,
		source:PTR BYTE
		mov ecx,eax						; length to add
		mov esi,source					; source to concatenate
		mov edi,target					; point to target
		add edi,LENGTHOF sourceStr+1	; point to end of target
		cld								; set direction forward
		rep movsb						; concatenate source to target
		ret
	Str_concat ENDP


end main