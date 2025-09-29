			;a = ++b - c_var++;
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0		
b			sdword 4
c_var		sdword 2
a			sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			inc b			; ++b
			mov eax,b		; move b to eax
			sub eax,c_var	; eax - c_var (before increment)
			mov a,eax		; move eax to a
			inc c_var		; c++
			INVOKE printf, ADDR in1fmt, a		;print out the r
			ret
main		endp
			end