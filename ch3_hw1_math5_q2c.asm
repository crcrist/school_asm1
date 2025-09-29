			;answer = number / 2
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0
number		sdword 11
two			sdword 2
answer		sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,number			;load eax with number
			cdq
			idiv two			;use idiv to divide number by two, cant divide by immediate number only
			mov answer,eax		;load answer with eax to show number / 2 (eax contains non remainder)
			INVOKE printf, ADDR in1fmt, answer		;print out the answer
			ret
main		endp
			end