/* Define memory blocks */
MEMORY {
    FLASH_BANK_1  (rx) : ORIGIN = 0x08000000, LENGTH = 128K
    SRAM_1       (rwx) : ORIGIN = 0x20000000, LENGTH = 48K
    SRAM_2       (rwx) : ORIGIN = 0x2001C000, LENGTH = 16K
    BKP_SRAM      (rw) : ORIGIN = 0x40024000, LENGTH = 4K
}

/* Include project configuration */
INCLUDE config.ld

/* Include common linker script */
INCLUDE common.ld
