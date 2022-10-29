/* Define memory regions */
MEMORY {
    FLASH_BANK_1   (rx) : ORIGIN = 0x08000000, LENGTH = 64K
    SRAM_1        (rwx) : ORIGIN = 0x20000000, LENGTH = 16K
    SRAM_2        (rwx) : ORIGIN = 0x20004000, LENGTH = 6K
    SRAM_CCM      (rwx) : ORIGIN = 0x10000000, LENGTH = 10K
}

/* Include common linker script */
INCLUDE common.ld
