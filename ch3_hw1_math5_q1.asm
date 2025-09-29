			;product = 3 * number
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0
num1		sdword 2
result		sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,num1		;load eax with 2
			imul eax			;use imul with one operand
			mov result,eax		;load result with eax, shows imul eax -> eax * eax
			INVOKE printf, ADDR in1fmt, result		;print out the answer
			ret
main		endp
			end