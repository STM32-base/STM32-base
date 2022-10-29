/* Define memory regions */
MEMORY {
    FLASH_BANK_1   (rx) : ORIGIN = 0x08000000, LENGTH = 1024K
    FLASH_BANK_2   (rx) : ORIGIN = 0x08100000, LENGTH = 1024K
    SRAM_1        (rwx) : ORIGIN = 0x30000000, LENGTH = 32K
    SRAM_2        (rwx) : ORIGIN = 0x30020000, LENGTH = 16K
    SRAM_4        (rwx) : ORIGIN = 0x38000000, LENGTH = 64K
    RAM_DTCM       (rw) : ORIGIN = 0x20000000, LENGTH = 128K
    RAM_ITCM      (rwx) : ORIGIN = 0x00000000, LENGTH = 64K
    SRAM_AXI_1    (rwx) : ORIGIN = 0x24000000, LENGTH = 384K
    SRAM_BKP       (rw) : ORIGIN = 0x38800000, LENGTH = 4K
}

/* Include common linker script */
INCLUDE common.ld
