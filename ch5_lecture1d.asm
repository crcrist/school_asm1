			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0Ah,0
i			sdword ?
x			sdword 5
y			sdword 4
ans			sdword ?
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			mov ans,0
			.if y!=0
			mov ecx,1
			.repeat
			mov eax,ans
			add eax,x
			mov ans,eax
			inc ecx
			.until ecx>y
			mov i,ecx
			.endif
			ret
main		endp
end