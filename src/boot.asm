[BITS 16]
[ORG 0x7C00]
; we tell the assembler that code will start/load from this address, why this address? 
; because this is where BIOS loads the bootloader to this address memory
; and we tell the assembler that this code is 16-bit code

start: 
    cli ; Clear interrupts
    ; Disable interrupts to prevent any interrupt from occurring while we are loading the kernel
    ; signal to the CPU that we are going to do some critical operations
    mov ax, 0x0000 ; Set segment to 0
    mov ds, ax ; Set data segment to 0
    mov es, ax ; Set extra segment to 0
    mov fs, ax ; Set fs segment to 0
    mov gs, ax ; Set gs segment to 0
    mov ss, ax ; Set stack segment to 0
    mov sp, 0x7C00 ; Set stack pointer to the end of the bootloader

    





