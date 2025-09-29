			;answer = num1 + 3 -num2
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0
num1		sdword 10
num2		sdword 1
answer		sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,num1							;load eax with num1
			add eax,3								;add 3 to eax contents
			sub eax,num2							;subtract num2 from eax
			mov answer,eax
			INVOKE printf, ADDR in1fmt, answer		;print out the answer
			ret
main		endp
			end