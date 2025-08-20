// kernel.c
void kernel_main() {
   // VGA text mode buffer starts at 0xB8000
   volatile char* video_memory = (volatile char*)0xB8000;

   // Each character cell takes 2 bytes:
   // byte 0 = ASCII character, byte 1 = attribute (color)
   video_memory[0] = 'A';   // Character to print
   video_memory[1] = 0x07;  // Attribute byte: light grey on black background

   // Infinite loop to prevent exiting
   while (1) {
   }
}
