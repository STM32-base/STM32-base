/* Define memory regions */
MEMORY {
    FLASH_BANK_1   (rx) : ORIGIN = 0x08000000, LENGTH = 64K
    SRAM_1        (rwx) : ORIGIN = 0x20000000, LENGTH = 8K
    SRAM_1_PARITY (rwx) : ORIGIN = 0x20000000, LENGTH = 8K
}

/* Include common linker script */
INCLUDE common.ld
