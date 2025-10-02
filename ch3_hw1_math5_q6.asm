			;complete program
			;ohms law: E(Voltage) = I(Amps) * R(Ohms)
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
scanf		PROTO arg2:Ptr Sdword, inputlist:VARARG
			.data
in1fmt		byte "%d",0
msg1fmt		byte "%s",0
msg2fmt		byte "%s%d",0Ah,0
msg1		byte "Enter the number of amperes: ",0
msg2		byte "Enter the number of ohms: ",0
msg3		byte "The number of volts is: ",0
msg4		byte "The number of watts is: ",0
volts		sdword ? ; number of volts
ohms		sdword ? ; number of ohms	
amps		sdword ? ; number of amps
watts		sdword ? ; number of watts
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			INVOKE printf, ADDR msg1fmt, ADDR msg1		
			INVOKE scanf, ADDR in1fmt, ADDR amps
			INVOKE printf, ADDR msg1fmt, ADDR msg2
			INVOKE scanf, ADDR in1fmt, ADDR ohms
			; volts = ohms * amps
			mov eax,ohms			; load ohms into eax 
			imul amps				; multiply ohms * amps
			mov volts,eax			; move eax into volts
			mov eax, amps			; move amps into eax
			imul volts				; multiply amps * volts
			mov watts,eax			; move eax into watts
			INVOKE printf, ADDR msg2fmt, ADDR msg3, volts
			INVOKE printf, ADDR msg2fmt, ADDR msg4, watts
			ret
main		endp
			end