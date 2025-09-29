		;answer = num1 + 3 -num2
		.386
		.model flat, c
		.stack
		.data
num1	sdword 10
num2	sdword 1
answer	sdword ?
		.code
		;includelib libucrt.lib
		;includelib legacy_stdio_definitions.lib
		;includelib libcmt.lib
		;includelib libvcruntime.lib
main	proc
		move eax,num1	;load eax with num1
		add eax,3		;add 3 to eax contents
		sub eax,num2	; subtract num2 from eax
		mov answer,eax
		ret
main	endp
end		main