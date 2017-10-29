# Startup code

NOTE: This file is work in progress and currently meant to document the STM32F103x8 startup code. This file will be restructured to be a more high-level document explaining the startup code for every processor.

The startup code is the first piece code to be executed after the device resets. This code is implemented by directly using ARM assembly instructions. This README will explain the code and used assembler directives line-by-line.

---

## Assembler directives

The first things found in this file are the so-called assembler directives. These directives do not have any meaning to the processor, but are meant for the `GNU as` (assembler). To read more about `GNU as`, see the [GNU as documentation](https://sourceware.org/binutils/docs/as/index.html).

```
.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb
```

The [`.syntax`](https://sourceware.org/binutils/docs/as/ARM-Directives.html#index-_002esyntax-directive_002c-ARM) tells the assembler which [Instruction Set Syntax](https://sourceware.org/binutils/docs/as/ARM_002dInstruction_002dSet.html#ARM_002dInstruction_002dSet) to use. 

The [`.cpu`](https://sourceware.org/binutils/docs/as/ARM-Directives.html#index-_002ecpu-directive_002c-ARM) directive selects the target processor.

The [`.fpu`](https://sourceware.org/binutils/docs/as/ARM-Directives.html#index-_002efpu-directive_002c-ARM) directive selects the floating-point unit to assemble for.

The [`.thumb`](https://sourceware.org/binutils/docs/as/ARM-Directives.html#index-_002ethumb-directive_002c-ARM) directive tells the compiler to use the Thumb instruction set for compiling this file. See the [`.code`](https://sourceware.org/binutils/docs/as/ARM-Directives.html#index-_002ecode-directive_002c-ARM) directive for more information.

```
.global g_pfnVectors
.global Default_Handler
```

The [`.global`](https://sourceware.org/binutils/docs/as/Global.html#Global) directives make the given symbol visible to `ld`.

```
.word _sidata
.word _sdata
.word _edata
.word _sbss
.word _ebss
```

The [`.word`](https://sourceware.org/binutils/docs/as/Word.html#Word) directive inserts the value given into the assembler code.

```
.equ BootRAM, 0xF108F85F
```

The [`.equ`](https://sourceware.org/binutils/docs/as/Equ.html#Equ) directive sets the value of a given _symbol_ to _expression_.

## The `Reset_Handler`

The `Reset_Handler` runs in the event of a reset of the device. The reset handler copies the data for initialized variables to the RAM of the device. Then it fills the part of the RAM of uninitialized variables with zeros. After this, it calls the `SysyemInit` function to initialize the system clocks. Finally it calls the `main` function where the user code starts.

```
.section .text.Reset_Handler
.weak Reset_Handler
.type Reset_Handler, %function
```

The [`.section`](https://sourceware.org/binutils/docs/as/Section.html#Section) directive tells the assembler to assemble the following code into a section named _name_.

The [`.weak`](https://sourceware.org/binutils/docs/as/Weak.html#Weak) directive tells the assembler that this symbol can be overridden by another symbol defined elsewhere. If not, this symbol is used.

The [`.type`](https://sourceware.org/binutils/docs/as/Type.html#Type) directive tells the assembler the type of the symbol.

```
Reset_Handler:
    movs r1, #0
    b LoopCopyDataInit
```

This is the `Reset_Handler` itself. 

```
CopyDataInit:
    ldr r3, = _sidata
    ldr r3, [r3, r1]
    str r3, [r0, r1]
    adds r1, r1, #4

LoopCopyDataInit:
    ldr r0, = _sdata
    ldr r3, = _edata
    adds r2, r0, r1
    cmp r2, r3
    bcc CopyDataInit
    ldr r2, = _sbss
    b LoopFillZerobss
```

The `CopyDataInit`

```
FillZerobss:
    movs r3, #0
    str r3, [r2], #4

LoopFillZerobss:
    ldr r3, = _ebss
    cmp r2, r3
    bcc FillZerobss

    bl SystemInit
    bl main
    bx lr
```

```
.size Reset_Handler, .-Reset_Handler
```

## The `Reset_Handler`

The `Reset_Handler` does as its name implies: it runs in the event of a reset of the device. The reset handler will perform only the absolutely necessary actions to get the processor up and running. It will then pass the control of the processor the the `main()` function.

## The interrupt vector

---

## Sources

 * [GNU as documentation](https://sourceware.org/binutils/docs/as/index.html)
 * [ARM Community blog explainging assembler directives](https://community.arm.com/processors/b/blog/posts/useful-assembler-directives-and-macros-for-the-gnu-assembler)
 * 