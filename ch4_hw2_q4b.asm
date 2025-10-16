			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0Ah,0
a			sdword 4
b			sdword 8
cc			sdword 9
d			sdword 10
two			sdword 2
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc

;a>b -> a-1			
			mov eax,a
if01:		cmp eax,b
			jg then01
			jmp else01
then01:     sub eax,1
			mov a,eax
			jmp endif01
else01:		mov eax,b

;b>=cc -> b-2
if02:		cmp eax,cc
			jge then02
			jmp else02
then02:		sub eax,2
			mov b,eax
			jmp endif01
else02:		mov eax,cc

;cc>d -> cc+d
if03:		cmp eax,d
			jg then03
			jmp else03
then03:		add eax,d
			mov cc,eax
			jmp endif01
;else d/2
else03:		mov eax,d
			cdq
			idiv two
			mov d,eax



endif01:	nop

			INVOKE printf, ADDR msg1fmt, a
			INVOKE printf, ADDR msg1fmt, b
			INVOKE printf, ADDR msg1fmt, cc
			INVOKE printf, ADDR msg1fmt, d
			ret
main		endp
			end