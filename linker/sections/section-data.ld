/**
 * Puts the .data section in memory. This section contains initialized variabes.
 *
 * Uses:
 *   - REGION_DATA_VMA
 *   - REGION_DATA_LMA
 *
 * Provides:
 *   - __data_start : The start address of the .data section.
 *   - __data_end   : The end address of the .data section.
 */

SECTIONS {
    __data_flash_start = LOADADDR(.data);

    .data : {
        . = ALIGN(4);
        __data_start = .;

        *(.data)
        *(.data*)

        . = ALIGN(4);
        __data_end = .;
    } > REGION_DATA_VMA AT> REGION_DATA_LMA
}
