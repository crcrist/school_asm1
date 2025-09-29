			;r = -s + t++
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0		
t			sdword 2
s			sdword 4
r			sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,t		;eax = old value of t (post increment)
			mov ebx,s		;ebx = s
			neg ebx			;ebx = -s
			add	eax,ebx		;eax = -s + (old t)
			mov r,eax		;r = result
			inc t			;increment t now (postfix rather than at beginning)
			INVOKE printf, ADDR in1fmt, r		;print out the r
			ret
main		endp
			end