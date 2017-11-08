.global Default_Handler
.global Reset_Handler

/**
 * These are the addresses for the initialized (data) and uninitialized (bss)
 * variables. The initialized variables will be copied from FLASH to RAM. The
 * uninitialized variables will be set to 0. These addresses are set in the
 * linker file.
 */
.word __data_flash_start
.word __data_start
.word __data_end
.word __bss_start
.word __bss_end

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
    movs r0, #0
    ldr  r1, = __data_start
    ldr  r2, = __data_end
    ldr  r3, = __data_flash_start
    b    LoopCopyDataInit

// Copy over the initialized global variables
CopyDataInit:
    ldr  r4, [r3, r0]
    str  r4, [r1, r0]
    adds r0, r0, #4

LoopCopyDataInit:
    adds r1, r1, r0
    cmp  r1, r2
    bcc  CopyDataInit

    movs r0, #0
    ldr  r1, = __bss_start
    ldr  r2, = __bss_end
    b    LoopFillZerobss

FillZerobss:
    str  r0, [r1]
    adds r1, r1, #4

LoopFillZerobss:
    cmp  r1, r2
    bcc  FillZerobss

.ifdef __ccmdata_start
    movs r0, #0
    ldr  r1, = __ccmdata_start
    ldr  r2, = __ccmdata_end
    ldr  r3, = __ccmdata_flash_start
    b    LoopCopyCCMData

CopyCCMData:
    ldr  r4, [r3, r0]
    str  r4, [r1, r0]
    adds r0, r0, #4

LoopCopyCCMData:
    adds r1, r1, r0
    cmp  r1, r2
    bcc  CopyCCMData
.endif

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
