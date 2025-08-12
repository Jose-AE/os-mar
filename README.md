Stage 1 – Boot & Minimal Kernel
(Goal: Boot to a running C function on real or virtual hardware)

Boot process basics

BIOS/UEFI

Bootloader (MBR, GRUB, custom loader)

Assembly + C basics

Cross-compilation toolchain

Mixing assembly and C

Protected mode (or long mode) entry

GDT setup

Switching CPU modes

Minimal kernel entry point

Linker scripts

Printing to VGA text buffer

✅ Milestone: Boot → print "Hello OS World!".

Stage 2 – Basic I/O & Interrupts
(Goal: Kernel can interact with keyboard and respond to hardware events)

Interrupt Descriptor Table (IDT)

CPU exceptions handling

Hardware interrupts

PIC/APIC setup

Timer (PIT) interrupts

Keyboard interrupts

Simple device drivers

VGA text mode output

Keyboard input

✅ Milestone: Type on keyboard → text appears on screen.

Stage 3 – Memory Management
(Goal: Control memory and prepare for process isolation)

Physical memory map

BIOS/UEFI memory info

Paging basics

Page tables

Enable paging in CPU

Kernel heap allocator

Simple malloc/free for the kernel

Virtual memory setup

Map kernel and user space separately

✅ Milestone: Kernel uses paging; safe to isolate process memory.

Stage 4 – Process Management
(Goal: Run multiple independent tasks)

Process Control Block (PCB)

Registers, stack pointer, page directory

Context switching

Save/restore registers

Switch stack and memory mapping

Scheduler

Timer interrupt triggers schedule()

Round Robin or Priority scheduling

Process creation

fork-like: duplicate PCB + memory

exec-like: load a new program image

Process termination

Free resources

Remove from scheduler queue

✅ Milestone: Two programs run “at the same time” (time-sliced).

Stage 5 – System Calls & User Programs
(Goal: Let processes ask the kernel for services)

Trap instruction (int 0x80, syscall)

System call table

Basic syscalls (write, exit, fork, exec, wait)

Switch to user mode

Ring 3 privilege level

Separate stack for user code

✅ Milestone: Load and run a user-space program that calls write() to print text.

Stage 6 – From POC to Usable OS
File system (FAT, ext2)

More drivers (disk, network)

Shell (text-based interface)

Optional: ELF loader for running compiled binaries

📌 Implementation Order in Practice:
Bootloader → Kernel entry → VGA output

IDT → Timer → Keyboard

Paging → Memory allocator

PCB → Context switching → Scheduler

Syscalls → User mode → Process creation/exit

File system → Shell

