; DataDefinitions.asm - Contains a definition of each data type. Each variable is initialized to a value that is consistent with its data type.
; Chapter 3
; 3.10 Exercise 3
; Author: James Olney

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
val1 BYTE 255
val2 SBYTE -128
val3 WORD 65535
val4 SWORD -32768
val5 DWORD 12345678h
val6 SDWORD -2147483648
val7 FWORD 281474976710655
val8 QWORD 1234567812345678h
val9 TBYTE 800000000000001234h
val10 REAL4 -1.2
val11 REAL8 1.6
val12 REAL10 4.6E+4096

.code
main proc
	

	invoke ExitProcess,0
main endp
end main