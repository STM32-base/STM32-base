/* Define memory regions */
MEMORY {
    FLASH_BANK_1  (rx) : ORIGIN = 0x08000000, LENGTH = 512K
    FLASH_ITCM    (rx) : ORIGIN = 0x00200000, LENGTH = 512K
    SRAM_1       (rwx) : ORIGIN = 0x20010000, LENGTH = 240K
    SRAM_2       (rwx) : ORIGIN = 0x2004C000, LENGTH = 16K
    DTCM_RAM      (rw) : ORIGIN = 0x20000000, LENGTH = 64K
    ITCM_RAM     (rwx) : ORIGIN = 0x00000000, LENGTH = 16K
    BKP_SRAM      (rw) : ORIGIN = 0x40024000, LENGTH = 4K
}

/* Include project configuration */
INCLUDE config.ld

/* Include common linker script */
INCLUDE common.ld
