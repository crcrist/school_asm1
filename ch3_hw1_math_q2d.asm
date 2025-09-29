			;difference = 4 - number
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0
number		sdword 6
difference	sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,4			;load eax with number
			sub eax,number			;use sub to subtract number from eax
			mov difference,eax		;load difference with eax
			INVOKE printf, ADDR in1fmt, difference		;print out the difference
			ret
main		endp
			end