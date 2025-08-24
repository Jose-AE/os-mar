CROSS   = aarch64-linux-gnu
AS      = $(CROSS)-as
CC      = $(CROSS)-gcc
LD      = $(CROSS)-ld

SRC     = src
BUILD   = build

CFLAGS  = -ffreestanding -c
LDFLAGS = -nostdlib -T $(SRC)/linker.ld

all: $(BUILD)/kernel.elf

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/boot.o: $(SRC)/boot.s | $(BUILD)
	$(AS) $(SRC)/boot.s -o $(BUILD)/boot.o

$(BUILD)/kernel.o: $(SRC)/kernel.c | $(BUILD)
	$(CC) $(CFLAGS) $(SRC)/kernel.c -o $(BUILD)/kernel.o

$(BUILD)/kernel.elf: $(BUILD)/boot.o $(BUILD)/kernel.o $(SRC)/linker.ld | $(BUILD)
	$(LD) $(LDFLAGS) $(BUILD)/boot.o $(BUILD)/kernel.o -o $(BUILD)/kernel.elf

clean:
	rm -rf $(BUILD)



.PHONY: all clean

run:
	qemu-system-aarch64 -machine virt -cpu cortex-a57 -kernel $(BUILD)/kernel.elf -nographic