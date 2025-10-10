			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0
number		sdword 4
count		sdword 5
flag		sdword ? 
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			if02: mov eax,count
			cmp eax,number
			jle endif02
			then02: mov flag,-1
			endif02: nop
			INVOKE printf, ADDR msg1fmt, flag	
			ret
main		endp
			end