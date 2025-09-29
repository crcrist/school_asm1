			;complete program
			;ohms law: E(Voltage) = P(Watts)/I(Amps)
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
scanf		PROTO arg2:Ptr Sdword, inputlist:VARARG
			.data
in1fmt		byte "%d",0
msg1fmt		byte 0Ah,"%s",0
msg2fmt		byte "%s",0
msg3fmt		byte 0Ah,"%s%d",0Ah,0Ah,0
msg1		byte "Enter the number of volts: ",0
msg2		byte "Enter the number of ohms: ",0
msg3		byte "The number of amps is: ",0
volts		sdword ? ; number of volts
ohms		sdword ? ; number of ohms	
amps		sdword ? ; number of amps
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			INVOKE printf, ADDR msg1fmt, ADDR msg1		
			INVOKE scanf, ADDR in1fmt, ADDR volts
			INVOKE printf, ADDR msg2fmt, ADDR msg2
			INVOKE scanf, ADDR in1fmt, ADDR ohms
			; amperes = volts/ohms
			mov eax,volts			;load volts into eax
			cdq						;extending the sign bit
			idiv ohms				;divide implied eax by ohms
			mov amps,eax
			INVOKE printf, ADDR msg3fmt, ADDR msg3, amps
			ret
main		endp
			end