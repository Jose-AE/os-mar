org 0x7C00              ; Bootloader is loaded at 0x7C00 by BIOS
bits 16 ; Emit 16 bit code

main:
    hlt

.halt:
    jmp .halt


times 510 - ($ - $$) db 0 ; Fill the rest of the boot sector with zeros
dw 0xAA55              ; Boot signature (0xAA55 at the end of 