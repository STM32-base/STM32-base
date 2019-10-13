/* Define memory regions */
MEMORY {
    FLASH_BANK_1  (rx) : ORIGIN = 0x08000000, LENGTH = 512K
    SRAM_1       (rwx) : ORIGIN = 0x20000000, LENGTH = 112K
    SRAM_2       (rwx) : ORIGIN = 0x2001C000, LENGTH = 16K
    SRAM_3       (rwx) : ORIGIN = 0x20020000, LENGTH = 64K
    CCM_SRAM     (rwx) : ORIGIN = 0x10000000, LENGTH = 64K
    BKP_SRAM      (rw) : ORIGIN = 0x40024000, LENGTH = 4K
}

/* Include project configuration */
INCLUDE config.ld

/* Include common linker script */
INCLUDE common.ld
