/**
 * Puts the .isr_vector section in memory. This section contains the ISR
 * (Interrupt Service Routine) vector. This section MUST be the first section in
 * FLASH memory, at address 0x0000 0000.
 *
 * The ISR vector, also called vector table, is a list of memory addresses. The
 * first vector (0x0000 0000) contains the reset value of the Stack Pointer (SP).
 *
 * Using STM32-base in its default configuration will have the Stack Pointer
 * point to the next address after the last address of the device's first RAM
 * block. This means that if the last address in a device's RAM is 0x0000 01FF,
 * the Stack Pointer will point to 0x0200.
 *
 * The second vector (0x0000 0004) points to the Reset Handler. This value is
 * loaded into the processor's Program Counter (PC) on system reset. The other
 * vectors point to other interrupt handlers.
 *
 * Uses:
 *   - REGION_ISR_VECTOR
 */

SECTIONS {
    .isr_vector : {
        KEEP(*(.isr_vector));
    } > REGION_ISR_VECTOR
}
