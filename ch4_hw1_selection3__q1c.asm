			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0
x			sdword 1
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			.if x-1
			dec x
			.endif
			INVOKE printf, ADDR msg1fmt, x	
			ret
main		endp
			end