MEMORY {
    FLASH   (rx) : ORIGIN = 0x08000000, LENGTH = 64K
    RAM    (rwx) : ORIGIN = 0x20000000, LENGTH = 16K

    CCMRAM (rwx) : ORIGIN = 0x10000000, LENGTH = 0K
}

INCLUDE common.ld
/* Define memory regions */
MEMORY {
    FLASH_BANK_1  (rx) : ORIGIN = 0x08000000, LENGTH = 64K
    SRAM_1       (rwx) : ORIGIN = 0x20000000, LENGTH = 16K
}

/* Include project configuration */
INCLUDE config.ld

/* Include common linker script */
INCLUDE common.ld
