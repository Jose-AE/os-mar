void print_char(char c) {
   volatile char* video = (volatile char*)0xb8000;
   video[0] = c;
   video[1] = 0x07;  // Light gray on black
}

void kernel_main() {
   const char* msg = "Hello, world!";
   volatile char* video = (volatile char*)0xb8000;
   for (int i = 0; msg[i] != '\0'; i++) {
      video[i * 2] = msg[i];
      video[i * 2 + 1] = 0x07;  // Color attribute
   }
}
