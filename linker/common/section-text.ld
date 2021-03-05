/**
 * Puts the .text section into memory. This section contains the actual code.
 *
 * Uses:
 *  - REGION_TEXT
 *
 * Provides:
 *  - __text_start : The start address of the .text section.
 *  - __text_end   : The end address of the .text section.
 */

SECTIONS {
    .text : {
        . = ALIGN(4);
        __text_start = .;

        *(.text)
        *(.text*)
        *(.eh_frame)

        . = ALIGN(4);
        __text_end = .;
    } > REGION_TEXT
}
