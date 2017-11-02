.global Default_Handler
.global Reset_Handler

/**
 * This code gets called when the processor starts following a reset event. This
 * code only copies the global variables to RAM and sets the uninitialized
 * variables to 0. After that it calls the SystemInit and the __libc_init_array
 * functions before it finally calls the supplied main routine.
 */
.section .text.Reset_Handler
.weak Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
    mov  r0, #0      // var i = 0
    ldr  r1, = _sdata  // Start of data in RAM
    ldr  r2, = _edata  // End of data in RAM
    ldr  r3, = _sidata // Start of data in FLASH

    b    LoopCopyDataInit

// Copy over the initialized global variables
CopyDataInit:
    ldr  r5, [r3, r0] // var temp = *(sidata+i)
    str  r5, [r1, r0] // sdata+i = temp
    add  r0, r0, #4   // i += 4

LoopCopyDataInit:
    adds r4, r1, r0 // var startoffset = sdata + i
    cmp  r4, r2     // while startoffset < edata
    bcc  CopyDataInit

    mov  r0, #0       // i = 0
    ldr  r1, = _sbss  // Start of uninit data in RAM
    ldr  r2, = _ebss  // End of uninit data in RAM
    b    LoopFillZerobss

FillZerobss:
    str  r0, [r1], #4 // sbss = i
                      // sbss += 4

LoopFillZerobss:
    cmp  r1, r2      // while sbss < ebss
    bcc  FillZerobss

    bl SystemInit
    bl __libc_init_array
    bl main

.size Reset_Handler, .-Reset_Handler

/**
 * This code gets called when the processor receives an unexpected interrupt.
 * The code simply enters an infinite loop, preserving the system state for
 * inspection by a debugger.
 */
.section .text.Default_Handler, "ax", %progbits
Default_Handler:
Infinite_Loop:
    b    Infinite_Loop

.size Default_Handler, .-Default_Handler
