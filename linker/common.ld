OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")

ENTRY(Reset_Handler)

__end_stack = ORIGIN(RAM) + LENGTH(RAM);

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
        __text_start = .;

        *(.text)
        *(.text*)
        *(.glue_7)
        *(.glue_7t)
        *(.eh_frame)

        KEEP(*(.init))
        KEEP(*(.fini))

        . = ALIGN(4);
        __text_end = .;
    } > FLASH

    /* Put constant (read-only) data into FLASH */
    .rodata : {
        . = ALIGN(4);
        __rodata_start = .;

        *(.rodata)
        *(.rodata*)

        . = ALIGN(4);
        __rodata_end = .;
    } > FLASH

    .ARM.extab : {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > FLASH

    .ARM : {
        __exidx_start = .;
        *(.ARM.exidx*)
        __exidx_end = .;
    } > FLASH

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

    __data_flash_start = LOADADDR(.data);

    .data : {
        . = ALIGN(4);
        __data_start = .;

        *(.data)
        *(.data*)

        . = ALIGN(4);
        __data_end = .;
    } > RAM AT> FLASH

    .bss : {
        . = ALIGN(4);
        __bss_start = .;
        __bss_start__ = __bss_start;

        *(.bss)
        *(.bss*)
        *(COMMON)

        . = ALIGN(4);
        __bss_end = .;
        __bss_end__ = __bss_end;
    } > RAM

    __cmmdata_flash_start = LOADADDR(.ccmram);

    .ccmram : {
        . = ALIGN(4);
        __ccmdata_start = .;

        *(.ccmram)
        *(.ccmram*)

        . = ALIGN(4);
        __ccmdata_end = .;
    } > CCMRAM AT> FLASH

    ._user_heap_stack : {
        . = ALIGN(4);
        PROVIDE ( end = . );
        PROVIDE ( _end = . );
        . = . + 0x200;
        . = . + 0x400;
        . = ALIGN(4);
    } > RAM

    /DISCARD/ : {
        libc.a(*)
        libm.a(*)
        libgcc.a(*)
    }

    .ARM.attributes 0 : {
        *(.ARM.attributes)
    }
}
