/* Include project linker configuration */
INCLUDE config.ld

/* Explicitly set the output format of the ELF file to littlearm */
OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")

/* Define the Reset_Handler as entry point */
ENTRY(Reset_Handler)

/* Include all bits and pieces */
INCLUDE isr-vector.ld
INCLUDE text.ld
INCLUDE rodata.ld
INCLUDE data.ld
INCLUDE bss.ld
INCLUDE cpp.ld
INCLUDE arm.ld
INCLUDE debug.ld
INCLUDE discard.ld
