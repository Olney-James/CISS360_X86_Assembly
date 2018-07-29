; SummingGapsBetweenArrayValues.asm - a program with a loop and indexed addressing that calculates the sum of all the gaps between successive array elements. The array elements are doublewords, sequenced in nondecreasing order. So, for example, the array {0, 2, 5, 9, 10} has gaps of 2, 3, 4, and 1, whose sum equals 10.
; Chapter 4
; Section 4.10 Exercise 3
; Author: James Olney

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
myArray dword 0,2,5,9,10
myArrayPtr dword 0
sumOfGaps dword 0
highestValue dword 10
;varX dword 0

.code
main proc
	
	mov esi,0
	mov eax,myArrayPtr
	mov ebx,sumOfGaps
	mov ecx,4
	mov edx,0
	myLoop:								
		mov eax,myArray[esi+4]
		sub eax,myArray[esi]
		add edx,eax
		inc esi
		inc esi
		inc esi
		inc esi
	loop myLoop							


	invoke ExitProcess,0
main endp
end main