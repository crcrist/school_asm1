				.386
				.model flat,c
printf 			PROTO arg1:Ptr Byte, printlist:VARARG
				.data
msg1fmt			byte "%d",0Ah,0
array1			sdword 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
array2			sdword 20 dup(?)
				.code
includelib		libucrt.lib
includelib		legacy_stdio_definitions.lib
includelib		libcmt.lib
;includelib		;libcvruntime.lib
main			proc
				mov	ecx,lengthof array1	; init ecx to 5 (loop times)
				lea esi,array1			; load address of array1 into esi
				lea edi,array2
				.repeat
				mov eax,[esi]			; move contents of where esi is pointing into eax
				mov [edi],eax			; move eax to where edi is pointing
				add esi,4				; increment to next element in source
				add edi,4				; increment to next element in destination
				.untilcxz
				ret
main			endp
end