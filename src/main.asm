org 0x7C00 ; Tell assembler sector starts at 0x7C00
bits 16 ; Informs the assembler to generate 16-bit real-mode instructions

main:
    mov ah, 0x0e ;Set teletype mode
    mov al, "h" ; Load character 'h' into AL
    int 0x10 ; Call BIOS video interrupt 0x10 and set it to mode  inside AH (0x0e-teletype mode) and display character in AL




    hlt ; Halt the CPU



;If program ever reaches here, it will loop indefinitely (safety net)
.halt:
    jmp .halt ; Infinite loop to keep the CPU halted

times 510 - ($ - $$) db 0 ; Fill the rest of the boot sector with zeros
dw 0xAA55 ; Boot sector signature (0xAA55) so bios can recognize it as a bootable disk