/* Define memory regions */
MEMORY {
    FLASH_BANK_1   (rx) : ORIGIN = 0x08000000, LENGTH = 8K
    SRAM_1        (rwx) : ORIGIN = 0x20000000, LENGTH = 2K
}

/* Include common linker script */
INCLUDE common.ld
