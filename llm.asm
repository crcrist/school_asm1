.386
.model flat, c
.stack 100h

printf PROTO arg1: Ptr Byte, printlist:VARARG
system PROTO, command: Ptr Byte

.data
clearCmd    byte "cls", 0

; Rotating diamond frames - 8 rotation positions
frame1      byte "           *", 0Ah
            byte "          ***", 0Ah
            byte "         *****", 0Ah
            byte "        *******", 0Ah
            byte "         *****", 0Ah
            byte "          ***", 0Ah
            byte "           *", 0Ah, 0

frame2      byte "          **", 0Ah
            byte "         ****", 0Ah
            byte "        ******", 0Ah
            byte "       ********", 0Ah
            byte "        ******", 0Ah
            byte "         ****", 0Ah
            byte "          **", 0Ah, 0

frame3      byte "         ***", 0Ah
            byte "        *****", 0Ah
            byte "       *******", 0Ah
            byte "      *********", 0Ah
            byte "       *******", 0Ah
            byte "        *****", 0Ah
            byte "         ***", 0Ah, 0

frame4      byte "        ****", 0Ah
            byte "       ******", 0Ah
            byte "      ********", 0Ah
            byte "     **********", 0Ah
            byte "      ********", 0Ah
            byte "       ******", 0Ah
            byte "        ****", 0Ah, 0

frame5      byte "       *****", 0Ah
            byte "      *******", 0Ah
            byte "     *********", 0Ah
            byte "    ***********", 0Ah
            byte "     *********", 0Ah
            byte "      *******", 0Ah
            byte "       *****", 0Ah, 0

frame6      byte "      ******", 0Ah
            byte "     ********", 0Ah
            byte "    **********", 0Ah
            byte "   ************", 0Ah
            byte "    **********", 0Ah
            byte "     ********", 0Ah
            byte "      ******", 0Ah, 0

frame7      byte "     *******", 0Ah
            byte "    *********", 0Ah
            byte "   ***********", 0Ah
            byte "  *************", 0Ah
            byte "   ***********", 0Ah
            byte "    *********", 0Ah
            byte "     *******", 0Ah, 0

frame8      byte "    ********", 0Ah
            byte "   **********", 0Ah
            byte "  ************", 0Ah
            byte " **************", 0Ah
            byte "  ************", 0Ah
            byte "   **********", 0Ah
            byte "    ********", 0Ah, 0

; Cool title and messages
titleMsg    byte 0Ah, "    ================================", 0Ah
            byte "       ASSEMBLY ROTATION DEMO", 0Ah  
            byte "    ================================", 0Ah, 0

magicMsg    byte 0Ah, "    Watch the diamond spin!", 0Ah
            byte "    Pure x86 assembly animation", 0Ah, 0

speedMsg    byte 0Ah, "    Frame: %d/8   Speed: ULTRA-SLOW", 0Ah, 0

exitMsg     byte 0Ah, "    Press Ctrl+C to stop the magic!", 0Ah, 0

; Frame counter
frameCount  DWORD 0

; Array of frame pointers for easy cycling
frameArray  DWORD OFFSET frame1, OFFSET frame2, OFFSET frame3, OFFSET frame4
            DWORD OFFSET frame5, OFFSET frame6, OFFSET frame7, OFFSET frame8

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib

main PROC
    ; Show initial title
    INVOKE printf, ADDR titleMsg
    INVOKE printf, ADDR magicMsg
    INVOKE printf, ADDR exitMsg
    
    ; Wait a moment before starting
    mov ecx, 30000000
    call DelayLoop
    
animation_loop:
    ; Clear screen for smooth animation
    INVOKE system, ADDR clearCmd
    
    ; Show title again
    INVOKE printf, ADDR titleMsg
    INVOKE printf, ADDR magicMsg
    
    ; Calculate which frame to show (0-7)
    mov eax, frameCount
    and eax, 7              ; frameCount % 8
    
    ; Get frame address from array
    mov ebx, eax
    shl ebx, 2              ; multiply by 4 (DWORD size)
    mov edx, frameArray[ebx]
    
    ; Display current frame
    INVOKE printf, edx
    
    ; Show frame info
    mov eax, frameCount
    and eax, 7
    inc eax                 ; Display as 1-8 instead of 0-7
    INVOKE printf, ADDR speedMsg, eax
    
    ; Show exit message
    INVOKE printf, ADDR exitMsg
    
    ; Delay for smooth animation (slower than before)
    mov ecx, 25000000       ; Reduced for smoother rotation
    call DelayLoop
    
    ; Increment frame counter
    inc frameCount
    
    ; Loop forever
    jmp animation_loop
    
    ret
main endp

; Custom delay procedure for cleaner code
DelayLoop PROC
delay_start:
    nop
    nop
    nop
    nop                     ; Even more nops for extra delay
    loop delay_start
    ret
DelayLoop endp

end