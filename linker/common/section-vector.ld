/**
 * Puts the ISR (Interrupt Service Routing) vector in memory.

 Puts the ISR (Interrupt Service Routine) Vector in memory. This must be done first as it must be located at the first memory address.
 *
 * The first address (0x0000 0000) is used to store the Stack Pointer (SP). The other addresses are function pointers to interrupt handlers.
 *
 * Uses:
 *   - REGION_ISR_VECTOR
 */

SECTIONS {
    .isr_vector : {
        KEEP(*(.isr_vector));
    } > REGION_ISR_VECTOR
}
