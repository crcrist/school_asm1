			;answer = result = num3/(num4-2)
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0
num3		sdword 10
num4		sdword 7
result		sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov ebx,num4		;load base register with num4
			sub ebx,2			;subtract 2 from ebx
			mov eax,num3		;load eax with contents of num3
			cdq					;propogate the sign bit into the edx
			idiv ebx			;divide edx:eax pair by amt
			mov	result,eax
			INVOKE printf, ADDR in1fmt, result		;print out the answer
			ret
main		endp
			end