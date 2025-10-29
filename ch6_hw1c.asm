			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0Ah,0
i			sdword 1
x			sdword 0
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib

;includelib	;libcvruntime.lib
main		proc
			mov i,0
			.repeat
			; body of loop
			add i,2
			INVOKE printf, ADDR msg1fmt, i	
			.until i>10
			ret
main		endp
end