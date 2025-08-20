# Assembler to use
ASM=nasm

# Source and build directories
SRC_DIR=src
BUILD_DIR=build
IMG_NAME=main_floppy.img

# Rule to create a 1.44MB floppy disk image from the binary
$(BUILD_DIR)/$(IMG_NAME): $(BUILD_DIR)/main.bin
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/$(IMG_NAME)   # Copy binary to image file
	truncate -s 1440k $(BUILD_DIR)/$(IMG_NAME)          # Set image size to 1.44MB (floppy size)

# Rule to assemble main.asm into a flat binary
$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin  # Assemble source to binary




# Tell make that these are not real files, but commands
.PHONY: build run # List of commands


# Run the program
run: 
	@echo "Running..."
	qemu-system-i386 -fda $(BUILD_DIR)/$(IMG_NAME)

