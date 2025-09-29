			;x = x*y + z*2
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0
x			sdword 2
y			sdword 3
z			sdword 4
two			sdword 2
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,x			;eax = x
			imul y				;edx:eax = eax * y
			mov ebx,eax			;save (x*y) into ebx
			mov eax,z			;eax = z
			imul two			;edx:eax = eax * 2
			add eax,ebx			;eax = (x*y) + (z*2)
			mov x,eax			;store final result to x
			INVOKE printf, ADDR in1fmt, x		;print out the x
			ret
main		endp
			end