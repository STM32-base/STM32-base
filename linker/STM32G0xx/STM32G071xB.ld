/* Define memory regions */
MEMORY {
    FLASH_BANK_1   (rx) : ORIGIN = 0x08000000, LENGTH = 128K
    SRAM_1        (rwx) : ORIGIN = 0x20000000, LENGTH = 36K
    SRAM_1_PARITY (rwx) : ORIGIN = 0x20000000, LENGTH = 32K
}

/* Include common linker script */
INCLUDE common.ld
