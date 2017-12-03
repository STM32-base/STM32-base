# Startup code

The startup "code" contains the first commands to be executed after the device recieves a reset interrupt. This happens when the device gets powered after being powered down or if a reset signal is given on the reset pin. The startup "code" is implemented in ARM assembly. This README will explain the used assembly mnemonics and assembler directives line-by-line.


## ARM Registers

Before we start digging into the startup assembly, you'll need to know some things about the ARM architecture. An ARM processor has 16 32-bit registers available, named `r0` through `r15`. The last three of these registers have a special use and cannot be used for general purpose data storage. All three registers also have got an alias assigned to them, namely:

 * r13 / SP: Stack Pointer
 * r14 / LR: Link Register
 * r15 / PC: Program Counter

In addition to these 16 main registers there's also a status register called CPSR (Current Program Status Register). The CPSR yields the status of the program executed with flags. An example may be a flag for representing if the last operation caused an overflow.

More information on the ARM architecture can be found in either the [ARMv6-M Reference Manual](https://developer.arm.com/docs/ddi0419/c/armv6-m-architecture-reference-manual) for the Cortex-M0/M0+ and in the [ARMv7-M Reference Manual](https://developer.arm.com/products/system-design/development-boards/juno-development-board/docs/ddi0403/e/armv7-m-architecture-reference-manual) for the Cortex-M3, the Cortex-M4 and the Cortex-M7.


## Files

This folder contains a `startup_common.s` file which, as the name implies, is common to all the supported devices. This file is included by the other device-specific startup files. The folder contain the startup code for the specific device series (F0, F1, etc.).


## Common code

The `startup_common.s` contains startup code common to all devices. The main purpose of this code is to copy the initialized variables from FLASH to RAM ans clearing the uninitialized variables to 0 (zero).


### Globals

```
.global Default_Handler
.global Reset_Handler
```

The first thing we find in this file are two `.global` assembler directives. Directives can be recoginized by the fact that assembler directives always start with a `.` (dot). Assembler directives are instructions for the assembler to perform various bookkeeping tasks, storage reservation, and other control functions. Assembler directives do not generate any code themselves.

The [`.global` assembler directive](https://sourceware.org/binutils/docs/as/Global.html#Global) makes a given symbol visible to [`ld`](https://sourceware.org/binutils/docs-2.29/ld/index.html). In this case, the `Default_Handler` and the `Reset_Handler` will be made visible to `ld`.


### Address constants

```
.word _sidata
.word _sdata
.word _edata
.word _sbss
.word _ebss
```

The [`.word` assembler directive](https://sourceware.org/binutils/docs/as/Word.html#Word) emits the number represented by the symbol. This means the value represented by these symbols is defined in another file. In this case the value is set by the linker file. The size and the byte order depend on the platform. The values defined here are used in the actual assemble later on.


### The reset handler

```
.section .text.Reset_Handler
.weak Reset_Handler
.type Reset_Handler, %function
```

The [`.section` assembler directive](https://sourceware.org/binutils/docs/as/Section.html#Section) tells the assembler to assemble the following code into a section named, in this case, `.text.Reset_Handler`. The linker script refers to these sections to place them in the right spot in the devices memory.

The [`.weak` assembler directive](https://sourceware.org/binutils/docs/as/Weak.html#Weak) directive tells the assembler that this symbol can be overridden. If this does not get overridden, this symbol will be used.

The [`.type` assembler directive](https://sourceware.org/binutils/docs/as/Type.html#Type) tells the assembler the type of the symbol. In this case the symbol is of the type `%function`, which marks the `Reset_Handler` as being a function name.

```
Reset_Handler:
    movs r0, #0
    ldr  r1, = __data_start
    ldr  r2, = __data_end
    ldr  r3, = __data_flash_start
    b    LoopCopyData
```

Here, the `Reset_Handler` symbol is being defined. From here, some of the more interesting thins happen. First, the `MOV` instruction gets executed which sets `r0` to 0. The `S` in `MOVS` is an optional suffix. When it is present, the `MOV` instruction will set the status flags found in the CPSR register. In this case it has no use of setting the status flags because they are not used here. The reason to use `MOVS` instead of `MOV` is that the Cortex-M0 only supports the `MOVS` variant. If this code would have only support Cortex-M3, M4 or M7 devices, it would per perfectly fine to use the `MOV` instruction here.

Following the `MOV` instruction there are three `LDR` instructions. These instructions do also store a value in a given register. In this case, the value to be assigned exceeds the limits of the `MOV` instruction. This means the values need to be loaded from elsewhere.

After setting up all the registers, the `B` instruction gets executed. This instruction lets the execution of the code jump to the `LoopCopyData` label.

```
CopyData:
    ldr  r4, [r3, r0]
    str  r4, [r1, r0]
    adds r0, r0, #4

LoopCopyData:
    adds r4, r1, r0
    cmp  r4, r2
    bcc  CopyData
```

These two pieces of code implement a loop which copies the initialized data found in the FLASH memory over to the RAM. The loop is started at the `LoopCopyData` label, as the code jumps to this label using the aforementioned `B` instuction.

The first thing the init part of the loop does is adding the value of `r0` to the value of `r1` and putting the result in `r4` using the `ADD` instruction. In this case, `r1` contains the start address of the data being copied. The first time this code runs, `r0` contains the value 0. This means the first time the code runs it has no effect on the start address.

Then the values contained by `r4` and `r2` are compared using the `CMP` instruction. This instruction sets flags in the `CPSR` register depending on the outcome of the comparation. In this case, the only interesting flag set by the `CMP` instruction is the Carry flag, this flag is set when the result of the compare is positive or zero. The `CMP` instruction compares the values by substracting the the second given value from the first given value. In this case the current address being copied is substracted by the end address of the data.

After comparing the values a `BCC` instruction follows. This instruction is essentially the same as a `B` instruction, however, this instruction only performs a jump when the Carry flag in the `CPSR` is set. This will happen until the offset plus the address (`r1` + `r0`) is equal to the end address (`r2`) of the data.

The instructions following the `CopyData` label do the actual copying of the data. The `LDR` instruction loads the data from FLASH memory and puts it in `r4`. The `STR` instruction then copies the data in RAM memory. The `ADDS` instruction adds 4 to the register holding the offset.

From here the execution of the code continues at the code under the `LoopCopyData` label again. This stops when the `CMP` does not set the Carry flag in the `CPSR`.

```
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
    adds r4, r1, r0
    cmp  r4, r2
    bcc  CopyCCMData
.endif
```

This code copies initialized variables to the Core Coupled Memory on devices having this type of memory. The code works exacly the same as the code for copying data to regular RAM.

```
    movs r0, #0
    ldr  r1, = __bss_start
    ldr  r2, = __bss_end
    b    LoopFillZerobss
```

This is code that follows the `BCC` instruction. These instructions prepare for filling the uninitialized variables with zeroes. The `r0` register is set back to 0. The `r1` register is assigned the start address of the area to be cleared. The `r2` register is assigned the end address of the area to be cleared. From here, the code jumps to `LoopFillZerobss`.

```
FillZerobss:
    str  r0, [r1]
    adds r1, r1, #4

LoopFillZerobss:
    cmp  r1, r2
    bcc  FillZerobss
```

This code also starts comparing the start and end addresses, but does not have to keep track of any offsets as it is not copying data. The program then jumps to `FillZerobss`. Here, the `STR` instruction writes 0 to the address contained by `r1`. Then the start address is increased by 4. The compare is then executed again and the loop continues until all uninitialized variables are cleared with 0.

```
    bl SystemInit
    bl __libc_init_array
    bl main
```

After all initial copying and zeroing has been done the SystemInit function gets called. This configures the device clock registers.

Then the __libc_init_array is being called. This function is supplied by the libc library.

Finally the main function is called.

```
.size Reset_Handler, .-Reset_Handler
```

The [`.size` assembler directive](https://sourceware.org/binutils/docs/as/Size.html#Size) sets the size associated with the given symbol. This is used when debugging the code.


### The Default_Handler

The default handler is used to handle any otherwise unhandled interrupts. The only thing the Default_Handler does is making the processor enter an inifinte loop. This is done to preserve the processor's state so it can be inspected by a debugger.

```
.section .text.Default_Handler, "ax", %progbits
Default_Handler:
Infinite_Loop:
    b    Infinite_Loop

.size Default_Handler, .-Default_Handler
```


## Device-specific files

Each device has its own file containing the interrupt vector table applicable to the device.


### Assembler directives

```
.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb
```

The files start with some assembler directives. This example is taken from the STM32F103x8 startup code. The [`.syntax` directive](https://sourceware.org/binutils/docs/as/ARM-Directives.html#index-_002esyntax-directive_002c-ARM) tells the assembler which [Instruction Set Syntax](https://sourceware.org/binutils/docs/as/ARM_002dInstruction_002dSet.html#ARM_002dInstruction_002dSet) to use.

The [`.cpu` directive](https://sourceware.org/binutils/docs/as/ARM-Directives.html#index-_002ecpu-directive_002c-ARM) and [`.fpu` directive](https://sourceware.org/binutils/docs/as/ARM-Directives.html#index-_002efpu-directive_002c-ARM) select the target processor and the floating-point unit to assemble for, respectively.

The [`.thumb`](https://sourceware.org/binutils/docs/as/ARM-Directives.html#index-_002ethumb-directive_002c-ARM) tells the assembler to use the Thumb instruction set for compiling this file. See the documentation of the [`.code` directive](https://sourceware.org/binutils/docs/as/ARM-Directives.html#index-_002ecode-directive_002c-ARM) for more information.


### BootRAM

```
.equ BootRAM, 0xF108F85F
```

The STM32F103x8 startup code contains this line. The [`.equ` directive](https://sourceware.org/binutils/docs/as/Equ.html#Equ) sets the value of a given symbol to a specified value. This works a bit like the C/C++ `#define` compiler directive. The value assigned to BootRAM is a hardcoded instruction and would look something like `ldr.w pc, [pc, #-264]` uncomiled. See this [topic post](http://www.stm32duino.com/viewtopic.php?t=1651&start=90#p22060) for more information on the BootRAM value.


### Include

```
.include "startup_common.s"
```

The [`.include` directive](https://sourceware.org/binutils/docs/as/Include.html#Include) simply includes another assembly file. In this case the `startup_common.s` file.


### Interrupt Vector table

The interrupt vector table contains the addresses of the interrupt handlers. When an interrupt occurs, the processor starts executing the code in the given interrupt handler function.

```
.section .isr_vector, "a", %progbits
.type vector_table, %object
.size vector_table, .-vector_table
vector_table:
    .word __end_stack
    .word Reset_Handler
    .word NMI_Handler
    .word HardFault_Handler
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word SVC_Handler
    .word 0
    .word 0
    .word PendSV_Handler
    .word SysTick_Handler
    ...
```

The the section in which the interrupt vector table is located is indicated as data by the type argument (set to `%progbits`) in the `.section` assembler directive. The `.type` assembler directive sets the type of the `vector_table` symbol to `%object` (also data).

The vector table itself consists of multiple `.word` assembler directives, containing either 0 or the address of the given interrupt handler. The only special value in this table is the first one. The first value in an ARM vector table should point to the end of the stack. This value is set by the linker script.


### Interrupt handler aliases

For each interrupt used in the interrupt table, there are two assembler directives. The first one is the `.weak` assembler directive, which makes the symbol overridable. The second one is the `.thumb_set` assembler directive. This directive marks the given symbol as being an alias to the second symbol. I also marks the symbol as being a thumb function entry point.

```
.weak NMI_Handler
.thumb_set NMI_Handler, Default_Handler
```

## Sources

* [GNU `as` documentation](https://sourceware.org/binutils/docs/as/index.html)
* [ARM Community blog explainging assembler directives](https://community.arm.com/processors/b/blog/posts/useful-assembler-directives-and-macros-for-the-gnu-assembler)
* [Topic post at STM32duino explaining the BootRAM](http://www.stm32duino.com/viewtopic.php?t=1651&start=90#p22060)
* [ARMv6-M Reference Manual](https://developer.arm.com/docs/ddi0419/c/armv6-m-architecture-reference-manual)
* [ARMv7-M Reference Manual](https://developer.arm.com/products/system-design/development-boards/juno-development-board/docs/ddi0403/e/armv7-m-architecture-reference-manual)
* [Topic on ARM community about using the CCM](https://community.arm.com/iot/embedded/f/discussions/4605/how-to-use-ccm-sram-for-cortex-m4)
