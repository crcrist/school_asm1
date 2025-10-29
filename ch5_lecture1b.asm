			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0Ah,0
i			sdword ?
x			sdword 1
y			sdword ?
ans			sdword ?
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			mov ans,0
			.if x != 0
			mov i,1
			mov eax,y
			.while i<=eax
			mov eax,ans
			add eax,x
			mov ans,eax
			mov eax,y
			.endw
			.endif
			ret
main		endp
end