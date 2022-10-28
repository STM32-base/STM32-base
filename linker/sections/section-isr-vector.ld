/**
 * Puts the ISR (Interrupt Service Routine) vector in memory. This section MUST
 * be the first section in the FLASH memory, at address 0x0000 0000.
 *
 * The ISR vector is a list of memory addresses. The first value in the ISR
 * vector is called the Stack Pointer (SP). The Stack Pointer usually points to
 * the last address + 1 in the device's RAM. The stack grows "downwards" from
 * this address.
 *
 * The other values in the ISR vector are function pointers. These point to
 * functions which handle interrupts. Which interrupt is handled by which
 * function depends on the function pointer's location in the ISR vector.
 *
 * Uses:
 *   - REGION_ISR_VECTOR
 */

SECTIONS {
    .isr_vector : {
        KEEP(*(.isr_vector));
    } > REGION_ISR_VECTOR
}
