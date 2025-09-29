			;answer = number % amount
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0
number		sdword 11
amount		sdword 5
result		sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,number			;load eax with number
			cdq
			idiv amount			;use idiv to divide number by amount
			mov result,edx		;load result with edx to show remainer of number / amount (or number % amount)
			INVOKE printf, ADDR in1fmt, result		;print out the answer
			ret
main		endp
			end