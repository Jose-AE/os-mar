org 0x7C00 ; Boot sector starts at 0x7C00
bits 16 ; Informs the assembler to generate 16-bit real-mode instructions

main:
    hlt ; Halt the CPU



;If program ever reaches here, it will loop indefinitely (safety net)
.halt:
    jmp .halt ; Infinite loop to keep the CPU halted

times 510 - ($ - $$) db 0 ; Fill the rest of the boot sector with zeros
dw 0xAA55 ; Boot sector signature (0xAA55) so bios can recognize it as a bootable disk