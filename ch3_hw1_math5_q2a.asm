			;product = 3 * number
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0
number		sdword 2
product		sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,3		;load eax with 3
			imul number			;use multiply eax (3) by number
			mov product,eax		;load product with eax
			INVOKE printf, ADDR in1fmt, product		;print out the answer
			ret
main		endp
			end