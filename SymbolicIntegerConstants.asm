; SymbolicIntegerConstants.asm - Defines symbolic constants for all seven days of the week.
; Created an array variable that uses the symbols as initializers
; Chapter 3
; 3.10 Exercise 2
; Author: James Olney

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
SUN = 0
MON = 1
TUE = 2
WED = 3
THU = 4
FRI = 5
SAT = 6
days BYTE SUN,MON,TUE,WED,THU,FRI,SAT

.code
main proc
	

	invoke ExitProcess,0
main endp
end main