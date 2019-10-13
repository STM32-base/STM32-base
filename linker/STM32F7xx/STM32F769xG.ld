/* Define memory regions */
MEMORY {
    FLASH_BANK_1  (rx) : ORIGIN = 0x08000000, LENGTH = 1024K
    FLASH_ITCM    (rx) : ORIGIN = 0x00200000, LENGTH = 1024K
    SRAM_1       (rwx) : ORIGIN = 0x20020000, LENGTH = 368K
    SRAM_2       (rwx) : ORIGIN = 0x2007C000, LENGTH = 16K
    DTCM_RAM      (rw) : ORIGIN = 0x20000000, LENGTH = 128K
    ITCM_RAM     (rwx) : ORIGIN = 0x00000000, LENGTH = 16K
    BKP_SRAM      (rw) : ORIGIN = 0x40024000, LENGTH = 4K
}

/* Include project configuration */
INCLUDE config.ld

/* Include common linker script */
INCLUDE common.ld
