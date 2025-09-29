			;total = num1 / num2 - (num3*num4)
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0
num1		sdword 3
num2		sdword 2			
num3		sdword 3
num4		sdword 4
total		sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,num3			;eax = num3
			imul num4				;eax = num3 * num4
			mov ebx,eax				;move eax to ebx for space to do num1/num2
			mov	eax,num1			;eax = num1
			cdq						;convert to extend sign
			idiv num2				;eax = num1/num2
			sub eax,ebx
			mov total,eax
			INVOKE printf, ADDR in1fmt, total		;print out the a
			ret
main		endp
			end