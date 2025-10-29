			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0Ah,0
i			sdword ?
x			sdword 1
y			sdword 5	
ans			sdword ?
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			mov ans,0
			.if x != 0
			mov ecx,1
			.while ecx<=y
			mov eax,ans
			add eax,x
			mov ans,eax
			inc ecx
			.endw
			mov i,ecx
			.endif
			ret
main		endp
end