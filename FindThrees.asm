; FindThrees.asm - A program with a procedure named FindThrees that returns 1 if an array has 3 consecutive values of 3 somewhere in the array. Otherwise, it will 
;return 0. The procedure's input parameter list contains a pointer to the array and the array's size. The PROC directive is used with a parameter list when 
;declaring the procedure. All registers are preserved (except EAX) that are modified by the procedure. FindThrees is called several times with different arrays.
; Chapter 8
; Section 8.11 Exercise 4
; Author: James Olney
include Irvine32.inc

.data
targetStr BYTE "ABCDE",10 DUP(0)
sourceStr BYTE "FGH",0
	
.code
	FindThrees PROTO,
		ptrArray:PTR SDWORD,
		szArray:SDWORD
	
    main PROC
        INVOKE Str_concat, ADDR targetStr, ADDR sourceStr 
	invoke ExitProcess,0
main endp

	FindThrees PROC USES esi ecx,
		ptrArray:PTR SDWORD,
		szArray:SDWORD
		mov esi,ptrArray
		mov ecx,szArray
		mov ebx,0
		mov edx,FALSE
		mov eax,THREE
		cmp ecx,0					;length=0?
		je L2						;if yes: quit
			L1:
				add esi,4
				cmp eax,[esi]			;eax = 3?
				jne L3					;go to next
					add ebx,1
					cmp ebx,eax			;are there 3 3s?
					jne L4
						mov edx,TRUE	;if so, return 1
						jmp L2
					L4:
				L3:
			loop L1		
		L2:
			mov eax,edx					;write answer to eax for write int
		ret
	FindThrees ENDP


end main