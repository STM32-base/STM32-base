/* Define memory blocks */
MEMORY {
    FLASH_BANK_1  (rx) : ORIGIN = 0x08000000, LENGTH = 64K
    SRAM_1       (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
}

/* Include project configuration */
INCLUDE config.ld

/* Include common linker script */
INCLUDE common.ld
