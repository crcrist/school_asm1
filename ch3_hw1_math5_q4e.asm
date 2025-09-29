			;x = -y + z--
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0		
y			sdword 4
z			sdword 2
x			sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,y		; move y to eax
			neg eax			; make eax neg
			add eax,z		; eax + z (before increment)
			mov x,eax		; move eax to a
			dec z			; z--
			INVOKE printf, ADDR in1fmt, x		;print out the r
			ret
main		endp
			end