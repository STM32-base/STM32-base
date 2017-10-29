# Linker scripts

NOTE: This file is work in progress and currently meant to document the STM32F103x8 linker script script. This file will be restructured to be a more high-level document explaining the startup code for every processor.

Linker scripts are used to tell the linker where the compiled code should go. This is accomplished with different commands.

See the [GNU ld manual](https://sourceware.org/binutils/docs-2.29/ld/index.html) for more information on the commands available and how the linker works.

---

## `OUTPUT_FORMAT` command
The first thing this linker script does is setting the output format with the [`OUTPUT_FORMAT`](https://sourceware.org/binutils/docs-2.29/ld/Format-Commands.html#Format-Commands) command. The first argument is the default format, the second argument is used when the `-EB` argument is passed to `ld`, and the last argument is used when the `-EL` argument is passed to `ld` (to force little endianness).

## `ENTRY` command
The (`ENTRY`)[https://sourceware.org/binutils/docs-2.29/ld/Entry-Point.html#Entry-Point] command sets the entry point of the application. The entry point is the first function to be called when the application starts. The entry point for applications is set to the symbol `Reset_Handler` by default in this linker script.

## `MEMORY` command
The [`MEMORY`](https://sourceware.org/binutils/docs-2.29/ld/MEMORY.html#MEMORY) command describes the layout of the available memory in the target. The `ORIGIN`s correspond to those found in the _Memory mapping_ chapter in the STM32F103 datasheet. The `LENGTH`s correspond to the size of the FLASH memory and SRAM memory found in the STM32F103 datasheet. This command will eventually be moved to its own separate file to make this linker script reusable for multiple STM32 chips.

## `SECTIONS` command
The [`SECTIONS`](https://sourceware.org/binutils/docs-2.29/ld/SECTIONS.html#SECTIONS) command tells the linker how to map the input sections into output sections, and how to place the output sections in memory. Each section defined in the `SECTIONS` command will be briefly described.

### `.isr_vector` section
The `.isr_vector` section stores the interrupt vector.

__It is most important to not move this section as the processor requires it to be at position 0x00000000.__


### `.text` section
The `.text` section stores all the program code and data. This data will be stored in the FLASh memory of the micro controller.

Next, the ARM to Thumb and Thumb to ARM glue code will be insterted with `.glue_7` and `.glue_7t`. Thumb is an instruction set consisting of 16-bit instructions, and thus two instructions can be saved at a single 32-bit memory address. This is a memory saving technique.

Lastly, the `.eh_frame` will be inserted. The section contains exception unwinding and source language information. See [stack overflow](https://stackoverflow.com/questions/14091231/what-do-the-eh-frame-and-eh-frame-hdr-sections-store-exactly) for more information.

### `.rodata` section
The .rodata section stores all constants (read-only data). This data will be stored in the FLASH memory of the micro controller.

### `.ARM.extab` and `.ARM` section
The `.ARM` and `.ARM.exidx` are used for stack unwinding. This will happen in C++ exceptions and debugging sessions. This section is also stored in the FLASH memory.

### `.preinit_array`, `.init_array`, `.fini_array` sections
These sections are used for storing C++ constructors and destructors. These will be put in the FLASH memory.

### `.data` section
The `.data` section contains all the initialized data. This data is stored in RAM. The [`AT> FLASH`](https://sourceware.org/binutils/docs-2.29/ld/Output-Section-LMA.html#Output-Section-LMA) means this data is stored in FLASH and will be loaded into RAM by the startup code.

### `.bss` section
The `.bss` section contains all the uninitialized data. This data will be set to 0 by the startup code.

### `.ARM.attributes` section
Not sure about this section yet.
