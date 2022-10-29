/* Define memory regions */
MEMORY {
    FLASH_BANK_1   (rx) : ORIGIN = 0x08000000, LENGTH = 256K
    FLASH_BANK_2   (rx) : ORIGIN = 0x08040000, LENGTH = 256K
    SRAM_1        (rwx) : ORIGIN = 0x20000000, LENGTH = 80K
}

/* Include common linker script */
INCLUDE common.ld
