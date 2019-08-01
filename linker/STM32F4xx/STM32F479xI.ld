/* Define memory blocks */
MEMORY {
    FLASH_BANK_1  (rx) : ORIGIN = 0x08000000, LENGTH = 2048K
    SRAM_1       (rwx) : ORIGIN = 0x20000000, LENGTH = 160K
    SRAM_2       (rwx) : ORIGIN = 0x20028000, LENGTH = 32K
    SRAM_3       (rwx) : ORIGIN = 0x20030000, LENGTH = 128K
    CCM_SRAM     (rwx) : ORIGIN = 0x10000000, LENGTH = 64K
    BKP_SRAM      (rw) : ORIGIN = 0x40024000, LENGTH = 4K
}

/* Include project configuration */
INCLUDE config.ld

/* Include common linker script */
INCLUDE common.ld
