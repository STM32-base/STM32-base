/*
 * Linker script for STM32F103x8 micro controller (ARM Cortex-M3).
 */

/* Set the output formats (default, big, little) */
OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")

/* Entry point */
ENTRY(Reset_Handler)

/* The highest address of the user mode stack */
_estack = 0x20000000 + 20k;

/* Memory areas */
MEMORY {
    FLASH   (rx) : ORIGIN = 0x08000000, LENGTH = 64k
    RAM    (rwx) : ORIGIN = 0x20000000, LENGTH = 20k
}

/* Output sections */
SECTIONS {

    /* Put startup code into FLASH, ALWAYS DO THIS FIRST */
    .isr_vector : {
        . = ALIGN(4);
        KEEP(*(.isr_vector));
        . = ALIGN(4);
    } > FLASH

    /* Put program code and other data into FLASH */
    .text : {
        . = ALIGN(4);
        /* .text sections (code) */
        *(.text)
        /* .text* sections (code) */
        *(.text*)
        /* Glue ARM to thumb code */
        *(.glue_7)
        /* Glue thumb to ARM code */
        *(.glue_7t)
        /* Exception unwinding and source language information */
        *(.eh_frame)

        KEEP(*(.init))
        KEEP(*(.fini))

        . = ALIGN(4);

        /* Safe the address at the end of the code */
        _etext = .;
    } > FLASH

    /* Put constant (read-only) data into FLASH */
    .rodata : {
        . = ALIGN(4);
        /* .rodata sections (constants, strings, etc.) */
        *(.rodata)
        /* .rodata* sections (constants, strings, etc.) */
        *(.rodata*)
        . = ALIGN(4);
    } > FLASH

    /* ARM debugging data */
    .ARM.extab : {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > FLASH

    /* .ARM.exidx exception unwinding; mandated by ARM's C++ ABI */
    .ARM : {
        __exidx_start = .;
        *(.ARM.exidx*)
        __exidx_end = .;
    } > FLASH

    /* Put function pointers for C++ costructors/destructors into FLASH */
    .preinit_array : {
        PROVIDE_HIDDEN(__preinit_array_start = .);
        KEEP(*(.preinit_array*))
        PROVIDE_HIDDEN(__preinit_array_end = .);
    } > FLASH
    .init_array : {
        PROVIDE_HIDDEN(__init_array_start = .);
        KEEP(*(.init_array*))
        PROVIDE_HIDDEN(__init_array_end = .);
    } > FLASH
    .fini_array : {
        PROVIDE_HIDDEN(__fini_array_start = .);
        KEEP(*(.fini_array*))
        PROVIDE_HIDDEN(__fini_array_end = .);
    } > FLASH

    _sidata = LOADADDR(.data);

    /* Put initialized data into RAM */
    .data : {
        . = ALIGN(4);
        _sdata = .;

        *(.data)
        *(.data*)

        . = ALIGN(4);
        _edata = .;
    } > RAM AT> FLASH

    /* Put uninitialized data into RAM*/
    . = ALIGN(4);
    .bss : {
        _sbss = .;
        __bss_start__ = _sbss;

        *(.bss)
        *(.bss*)
        *(COMMON)

        . = ALIGN(4);
        _ebss = .;
        __bss_end__ = _ebss;
    } > RAM

    /* Remove information from the standard libraries */
    /* /DISCARD/ : {
        libc.a(*)
        libm.a(*)
        libgcc.a(*)
    } */

    .ARM.attributes 0 : {
        *(.ARM.attributes)
    }
}