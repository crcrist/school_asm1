			;z = -(x+y)
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0		
x			sdword 4
y			sdword 2
z			sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,x		; eax = x
			add	eax,y		; eax + y
			neg eax			; eax = -eax
			mov z,eax		; z = eax
			INVOKE printf, ADDR in1fmt, z		;print out the r
			ret
main		endp
			end