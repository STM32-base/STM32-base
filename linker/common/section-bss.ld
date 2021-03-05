/**
 * Puts the .bss section in memory. This section contains uninitialized data.
 *
 * Uses:
 *   - REGION_BSS
 *
 * Provides:
 *   - __bss_start : The start address of the .bss section.
 *   - __bss_end   : The end address of the .bss section.
 */

SECTIONS {
    .bss : {
        . = ALIGN(4);
        __bss_start = .;

        *(.bss)
        *(.bss*)
        *(COMMON)

        . = ALIGN(4);
        __bss_end = .;
    } > REGION_BSS
}
