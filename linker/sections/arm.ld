/**
 * Puts the .ARM.extab and .ARM.exidx sections in memory. These sections are
 * used for exception handling in C++.
 *
 * The first section, called "extab", is used to store exception table
 * fragments. The section section, called "exidx", is used to store exception
 * index tables.
 *
 * Uses:
 *   - ARM_EXTAB
 *   - ARM_AXIDX
 */

SECTIONS {
    .ARM.extab : {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > ARM_EXTAB

    .ARM : {
        __exidx_start = .;
        *(.ARM.exidx*)
        __exidx_end = .;
    } > ARM_EXIDX
}
