/**
 * Puts the .bss section in memory. This section contains uninitialized data.
 *
 * Uses:
 *   - REGION_BSS
 *
 * Exposes:
 *   - __bss_start   : The start address of the .bss section.
 *   - __bss_start__ : Same as __bss_start.
 *   - __bss_end     : The end address of the .bss section.
 *   - __bss_end__   : Same as __bss_end.
 */

SECTIONS {
    .bss : {
        . = ALIGN(4);
        __bss_start = .;
        __bss_start__ = .;

        *(.bss)
        *(.bss*)
        *(COMMON)

        . = ALIGN(4);
        __bss_end = .;
        __bss_end__ = .;
    } > REGION_BSS
}
