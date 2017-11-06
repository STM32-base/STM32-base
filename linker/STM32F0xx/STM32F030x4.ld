MEMORY {
    FLASH   (rx) : ORIGIN = 0x08000000, LENGTH = 16k
    RAM    (rwx) : ORIGIN = 0x20000000, LENGTH = 4k

    CCMRAM (rwx) : ORIGIN = 0x10000000, LENGTH = 0k
}

INCLUDE common.ld
