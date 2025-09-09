.386
        .model flat, c
        .stack 100h

; Windows API functions
SetConsoleCursorPosition PROTO, hConsoleOutput:DWORD, dwCursorPosition:DWORD
GetStdHandle PROTO, nStdHandle:DWORD
SetConsoleTextAttribute PROTO, hConsoleOutput:DWORD, wAttributes:WORD
Sleep PROTO, dwMilliseconds:DWORD
printf PROTO arg1:Ptr Byte, printlist:VARARG
system PROTO, command:Ptr Byte

        .data
; Console handles and coordinates
hConsole    DWORD ?
coord       DWORD ?
colors      WORD 1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15

; Clear screen command
clearCmd    byte "cls", 0

; ASCII art frames for spinning effect
frame1      byte "    ????????????????", 0Ah
            byte "    ?   ???????    ?", 0Ah  
            byte "    ?   ? ? ? ?    ?", 0Ah
            byte "    ?   ?  ?  ?    ?", 0Ah
            byte "    ?   ???????    ?", 0Ah
            byte "    ????????????????", 0Ah, 0

frame2      byte "    ????????????????", 0Ah
            byte "    ?   ???????    ?", 0Ah  
            byte "    ?   ? ? ? ?    ?", 0Ah
            byte "    ?   ?  ?  ?    ?", 0Ah
            byte "    ?   ???????    ?", 0Ah
            byte "    ????????????????", 0Ah, 0

frame3      byte "    ????????????????", 0Ah
            byte "    ?   ???????    ?", 0Ah  
            byte "    ?   ? ? ? ?    ?", 0Ah
            byte "    ?   ?  ?  ?    ?", 0Ah
            byte "    ?   ???????    ?", 0Ah
            byte "    ????????????????", 0Ah, 0

frame4      byte "    ????????????????", 0Ah
            byte "    ?   ???????    ?", 0Ah  
            byte "    ?   ? ? ? ?    ?", 0Ah
            byte "    ?   ?  ?  ?    ?", 0Ah
            byte "    ?   ???????    ?", 0Ah
            byte "    ????????????????", 0Ah, 0

; Rainbow text
rainbow1    byte "    ????  ?   ?  ????  ?   ?  ?????", 0Ah
            byte "    ?   ? ? ? ? ?      ? ? ?  ?    ", 0Ah
            byte "    ????  ????? ????   ?????  ?????", 0Ah
            byte "    ?   ? ?   ? ?      ?   ?  ?    ", 0Ah  
            byte "    ?   ? ?   ? ????   ?   ?  ?????", 0Ah, 0

titleMsg    byte 0Ah, "    ASSEMBLY WIZARDRY PRESENTS:", 0Ah, 0
magicMsg    byte 0Ah, "    ? MAGICAL SPINNING FACE ?", 0Ah, 0
powerMsg    byte "    Powers: Color-changing, Hypnotic", 0Ah, 0
exitMsg     byte 0Ah, "    Press Ctrl+C to escape the spell!", 0Ah, 0

; Frame array pointers  
frameArray  DWORD OFFSET frame1, OFFSET frame2, OFFSET frame3, OFFSET frame4

        .code
        includelib kernel32.lib
        includelib libucrt.lib
        includelib legacy_stdio_definitions.lib
        includelib libcmt.lib

main    PROC
        ; Get console handle
        INVOKE GetStdHandle, -11        ; STD_OUTPUT_HANDLE
        mov hConsole, eax
        
        ; Display title with color
        INVOKE SetConsoleTextAttribute, hConsole, 15  ; Bright white
        INVOKE printf, ADDR titleMsg
        
        INVOKE SetConsoleTextAttribute, hConsole, 13  ; Bright magenta
        INVOKE printf, ADDR magicMsg
        
        INVOKE SetConsoleTextAttribute, hConsole, 11  ; Bright cyan
        INVOKE printf, ADDR powerMsg
        INVOKE printf, ADDR exitMsg
        
        ; Main animation loop
        mov ecx, 0                      ; Frame counter
        
    animation_loop:
        ; Clear screen
        INVOKE system, ADDR clearCmd
        
        ; Reset cursor to top
        mov coord, 0
        INVOKE SetConsoleCursorPosition, hConsole, coord
        
        ; Display title again
        INVOKE SetConsoleTextAttribute, hConsole, 15
        INVOKE printf, ADDR titleMsg
        INVOKE SetConsoleTextAttribute, hConsole, 14  ; Yellow
        INVOKE printf, ADDR magicMsg
        
        ; Get current color (cycle through rainbow)
        mov eax, ecx
        and eax, 12                     ; Modulo 13 for color array
        mov ebx, eax
        shl ebx, 1                      ; Word size = 2 bytes
        movzx eax, WORD PTR colors[ebx]
        INVOKE SetConsoleTextAttribute, hConsole, eax
        
        ; Display rainbow text
        INVOKE printf, ADDR rainbow1
        
        ; Get current frame
        mov eax, ecx
        and eax, 3                      ; Modulo 4 for 4 frames
        mov ebx, eax
        shl ebx, 2                      ; DWORD size = 4 bytes
        mov edx, frameArray[ebx]
        
        ; Cycle through different colors for the face
        mov eax, ecx
        shr eax, 1                      ; Slower color change for face
        and eax, 12
        mov ebx, eax  
        shl ebx, 1
        movzx eax, WORD PTR colors[ebx]
        or eax, 128                     ; Add background color
        INVOKE SetConsoleTextAttribute, hConsole, eax
        
        ; Display current frame
        INVOKE printf, edx
        
        ; Reset color and show exit message
        INVOKE SetConsoleTextAttribute, hConsole, 8   ; Dark gray
        INVOKE printf, ADDR exitMsg
        
        ; Delay
        INVOKE Sleep, 200               ; 200ms delay
        
        ; Increment frame counter
        inc ecx
        
        ; Loop forever (until Ctrl+C)
        jmp animation_loop
        
        ret
main    endp
        end