# Micro controller
UC    = STM32F103xB
MCU   = cortex-m3
FLASH = 0x8000000

# Output folders
BUILD_FOLDER = ./build
BIN_FOLDER   = $(BUILD_FOLDER)/bin
OBJ_FOLDER   = $(BUILD_FOLDER)/obj

# Output file names
EXECUTABLE =  $(BIN_FOLDER)/stm32_executable.elf
BIN_IMAGE   = $(BIN_FOLDER)/stm32_bin_image.bin
STARTUP_OBJ = $(OBJ_FOLDER)/startup_stm32f103x8.o

# Compiler and other programs
CROSS_COMPILE ?= arm-none-eabi-

CC      = $(CROSS_COMPILE)gcc
CXX     = $(CROSS_COMPILE)g++
LD      = $(CROSS_COMPILE)ld -v
AR      = $(CROSS_COMPILE)ar
AS      = $(CROSS_COMPILE)gcc
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump
SIZE    = $(CROSS_COMPILE)size

# Flags - Debug options
CFLAGS  = -g

# Flags - Warning options
CFLAGS += -Wall
CFLAGS += -Wextra

# Flags - Machine-dependant options
CFLAGS += -mcpu=$(MCU)
CFLAGS += -mlittle-endian
CFLAGS += -mthumb

# Flags - C dialect options
CFLAGS += -ffreestanding
CFLAGS += -std=c11

# Flags - Linker options
CFLAGS += -nostdlib
CFLAGS += -Wl,-T,./linker/STM32F103x8.ld

# Flags - Directory options
CFLAGS += -I./src
CFLAGS += -I./CMSIS/Include
CFLAGS += -I./CMSIS/Device/ST/STM32F1xx/Include

# Flags - Preprocessor options
CFLAGS += -D USE_STDPERIPH_DRIVER
CFLAGS += -D $(UC)

# System setup code
SRC = ./CMSIS/Device/ST/STM32F1xx/Source/Templates/system_stm32f1xx.c

# Actual program
SRC += ./src/*.c

# Startup file
STARTUP = ./startup/startup_STM32F103x8.s

# Make all
all:$(BIN_IMAGE)

$(BIN_IMAGE):$(EXECUTABLE)
	$(OBJCOPY) -O binary $^ $@

$(EXECUTABLE):$(SRC) $(STARTUP_OBJ)
	$(CC) $(CFLAGS) $^ -o $@

$(STARTUP_OBJ): $(STARTUP) 
	$(CC) $(CFLAGS) $^ -c -o $@

# Make clean
clean:
	rm $(EXECUTABLE)
	rm $(BIN_IMAGE)
	rm $(STARTUP_OBJ)

# Make flash
flash:
	st-flash write $(BIN_IMAGE) $(FLASH)

gdb:
	arm-none-eabi-gdb -x ../commom/gdb_init.gdb

gdbtui:
	arm-none-eabi-gdb -tui -x ../commom/gdb_init.gdb

.PHONY:all clean flash