/**
 * Puts the .preinit_array, .init_array, and .fini_array into memory. These
 * sections contain pointers to functions.
 *
 * Uses:
 *   - REGION_INIT
 *   - REGION_FINI
 *   - REGION_PREINIT_ARRAY
 *   - REGION_INIT_ARRAY
 *   - REGION_FINI_ARRAY
 *
 * Provides:
 *   - __preinit_array_start
 *   - __preinit_array_end
 *   - __init_array_start
 *   - __init_array_end
 *   - __fini_array_start
 *   - __fini_array_end
 */

SECTIONS {
    .init : {
        KEEP(*(.init))
    } > REGION_INIT

    .fini : {
        KEEP(*(.fini))
    } > REGION_FINI

    .preinit_array : {
        PROVIDE_HIDDEN(__preinit_array_start = .);
        KEEP(*(.preinit_array*))
        PROVIDE_HIDDEN(__preinit_array_end = .);
    } > REGION_PREINIT_ARRAY

    .init_array : {
        PROVIDE_HIDDEN(__init_array_start = .);
        KEEP(*(.init_array*))
        PROVIDE_HIDDEN(__init_array_end = .);
    } > REGION_INIT_ARRAY

    .fini_array : {
        PROVIDE_HIDDEN(__fini_array_start = .);
        KEEP(*(.fini_array*))
        PROVIDE_HIDDEN(__fini_array_end = .);
    } > REGION_FINI_ARRAY
}
