			;j = ++k - m;
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0		
k			sdword 4
m			sdword 2
j			sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			inc k			; ++k
			mov eax,k		; eax = k
			sub	eax,m		; eax - m
			mov j,eax		; j = eax
			INVOKE printf, ADDR in1fmt, j		;print out the r
			ret
main		endp
			end