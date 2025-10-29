			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0Ah,0
i			sdword 1
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib

;includelib	;libcvruntime.lib
main		proc
			mov ecx,3
			.repeat
			; body of the loop
			INVOKE printf, ADDR msg1fmt, i	
			.untilcxz
			ret
main		endp
end