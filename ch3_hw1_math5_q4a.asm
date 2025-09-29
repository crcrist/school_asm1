			;--i;
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0		
i			sdword 4
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			dec i		; --i
			INVOKE printf, ADDR in1fmt, i		;print out the r
			ret
main		endp
			end