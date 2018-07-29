; Str_nextWord - program with a procedure called Str_nextWord that scans a string for the first occurrence of a certain delimiter character and replaces the 
; delimiter with a null byte. There are two input parameters: a pointer to the string and the delimiter character. After the call, if the delimiter was found, 
; the Zero flag is set and EAX contains the offset of the next character beyond the delimiter. Otherwise, the Zero flag is clear and the EAX is undefined.
; Chapter 9
; Section 9.10 Exercise 5
; Author: James Olney
include Irvine32.inc

.data
	target BYTE "Johnson,Calvin",0 
	beforeStr BYTE "Before: ",0
	AfterStr BYTE "After: ",0
	space BYTE " ",0

.code
	Str_nextWord PROTO,
		targetStr:PTR BYTE,
		source:BYTE
	
    main PROC
		mov edx,OFFSET beforeStr
		call WriteString
		mov edx,OFFSET target
		call WriteString
		call Crlf

        INVOKE Str_nextWord, ADDR target, ',' 

		mov edx,OFFSET afterStr
		call WriteString
		mov edx,OFFSET target
		call WriteString
		mov edx,OFFSET space
		call WriteString
		mov edx,eax
		call WriteString
		call Crlf
	invoke ExitProcess,0
main endp

	Str_nextword PROC,
		targetStr:PTR BYTE,
		source:BYTE
		push esi
		mov al,source
		mov esi,targetStr
		cld								
		L1:	
			lodsb						; next of targetString
			cmp al,0					
			je L3						; if end of string clear zero flag and exit
			cmp al,source				; comma?
		jne L1							; if no, then repeat loop
		mov BYTE PTR [esi-1],0			; if yes, then insert null byte
		mov eax,esi						
		jmp L4							; exit without clearing zero flag
		L3: 
		or al,1							; clear zero flag
		L4:
		pop esi
	ret
	Str_nextword ENDP


end main