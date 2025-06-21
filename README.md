# bootloader
A sample bootloader code for x86 systems, take it lightly please :)

## Disclaimer (not that I intended to lol)
I'm working on a sample bootloade code, hopefully I can add this as a project to my resume, need to learn x86 asm tho, but how hard can it be?
Anyway let's see what works out, later on you can add your flair to it!

## What I'll be covering?

There are 3 parts to it, i'll be adding this later


## Basically a description of what's happening:

What happens when you turn ON your PC?
POST - Power On Self Test

Power sends supply to all components.
Then BIOS firmware takes control, initialises CPU, Memory, and other hardware components.
The POST checks for hardware error such as checking memory, ensuring all essential devices are operational.
Then BIOS firmware is copied from ROM to RAM for faster execution.

Once all that is done, the search for bootloader begins.
BIOS checks the boot order settings to find the boot device 
The firmware looks for the master boot record (first 512 bytes) - boot sector : contains bootloader + partition table
Identifies it by looking at last 2 bytes - 55 AA (511 and 512) respectively 
0x55AA is a special signature that marks the sector as bootable 
Once the bootloader is located, BIOS loads it to memory and executes the code.

Real Mode: 16-bit mode which all x86 CPU start execution.
Memory access is handled using segmentation, we have little over 1MB of addressable memory in format segment:offset

16-bit segment address is stored in one of segment registers:
CS: Code Segment
DS: Data Segment 
ES: Extra Segment
SS: Stack Segment 
FS: F Segment 
GS: G Segment 

and 4 bit offset value is stored in one of the General Purpose registers
Total: 20 bit (2^20 =~ 1MB)

Physical address: Base address x 16 + offset (u can left shift by 4)
Ex: 0x7C88 X 16 = 0x7C880

## CMD Description

; Boot sector code for a simple bootloader
; This code will load a kernel from the disk and jump to it
; It assumes the kernel is located at sector 2 of the disk
; and is 512 bytes in size.
; The bootloader will load the kernel into memory at 0x1000 and then jump to it
; The bootloader will also print a message to the screen
; indicating that it has loaded the kernel
; and will wait for a key press before jumping to the kernel

; The bootloader will also clear the screen before printing the message
; and will use BIOS interrupts to print the message
; The bootloader will also use the BIOS interrupt 0x10 to print characters to the screen
; The bootloader will also use the BIOS interrupt 0x13 to read sectors from the disk
; The bootloader will also use the BIOS interrupt 0x19 to reboot the system
; The bootloader will also use the BIOS interrupt 0x1A to get the system time
; The bootloader will also use the BIOS interrupt 0x1E to read a character from the keyboard
; The bootloader will also use the BIOS interrupt 0x1F to write a character to the screen
; The bootloader will also use the BIOS interrupt 0x20 to terminate the program
; The bootloader will also use the BIOS interrupt 0x21 to read a character from the keyboard
; The bootloader will also use the BIOS interrupt 0x22 to write a character to the screen