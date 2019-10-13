/* Define memory regions */
MEMORY {
    FLASH_BANK_1  (rx) : ORIGIN = 0x08000000, LENGTH = 1024K
    SRAM_1       (rwx) : ORIGIN = 0x20000000, LENGTH = 256K
    SRAM_2       (rwx) : ORIGIN = 0x20040000, LENGTH = 64K
    CCM_SRAM     (rwx) : ORIGIN = 0x10000000, LENGTH = 64K
}

/* Include project configuration */
INCLUDE config.ld

/* Include common linker script */
INCLUDE common.ld
