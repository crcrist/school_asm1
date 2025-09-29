			;m = n * ((i-j)* k)
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0		
k			sdword 1
j			sdword 2
i			sdword 3
n			sdword 4
m			sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,i		;eax = i
			sub eax,j		;eax = i-j
			imul k			;eax = eax * k
			imul n			;eax = eax * n
			mov m,eax		;m = result
			INVOKE printf, ADDR in1fmt, m		;print out the r
			ret
main		endp
			end