/**
 * Puts the .rodata section in memory. This section contains the read only data.
 *
 * Uses:
 *   - REGION_RODATA
 *
 * Provides:
 *   - __rodata_start : The start address of the .rodata section.
 *   - __rodata_end   : The end address of the .rodata section.
 */

SECTIONS {
    .rodata : {
        . = ALIGN(4);
        __rodata_start = .;

        *(.rodata)
        *(.rodata*)

        . = ALIGN(4);
        __rodata_end = .;
    } > REGION_RODATA
}
