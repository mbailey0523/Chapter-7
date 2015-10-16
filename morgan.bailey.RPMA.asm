; Russian Peasent Multiplication   (morgan.bailey.RPMA.asm)
; Start with 3 memory locations. Call them A, B and Result. 
; Here is the Algorithm. 
; For any given A and B: 
; Start with result = 0. 
;	While B > 0:
;		if B is ODD:
;			Result = Result + A
;		A = A * 2
;		B = B // 2 (Integer divide)
; At the end, Result should equal A * B
;-------------------------------------------------------------

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
A DWORD 57			; declare variable A
B DWORD 86			; declare variable B
result DWORD 0			; declare result

.code
main PROC
	mov eax,A			; set A to EAX
	mov ebx,B			; set B to EBX
	mov edx,result		; set result EDX
	.WHILE ebx > 0		; while B is less than 0
		shr ebx,1			; half B
		.IF PARITY?		; test parity flag
			add edx,eax		; set result to result + A
		.ENDIF
		shl eax,1			; double A
	.ENDW
	invoke ExitProcess,0
main endp
end main
