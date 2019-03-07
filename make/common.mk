# Paths to (linked) folders
STM32_BASE   ?= ./STM32-base
STM32_CUBE   ?= ./STM32-base-STM32Cube

BASE_LINKER   = $(STM32_BASE)/linker
BASE_MAKE     = $(STM32_BASE)/make
BASE_STARTUP  = $(STM32_BASE)/startup

# Check if required variables are set
ifndef DEVICE
	$(error Please set the required DEVICE variable in your makefile.)
endif

ifndef FLASH
	$(error Please set the required FLASH variable in your makefile.)
endif

# Include series specific make file
ifneq (,$(findstring STM32F0, $(DEVICE)))
	include $(BASE_MAKE)/STM32F0xx/common.mk
else ifneq (,$(findstring STM32F1, $(DEVICE)))
	include $(BASE_MAKE)/STM32F1xx/common.mk
else ifneq (,$(findstring STM32F2, $(DEVICE)))
	include $(BASE_MAKE)/STM32F2xx/common.mk
else ifneq (,$(findstring STM32F3, $(DEVICE)))
	include $(BASE_MAKE)/STM32F3xx/common.mk
else ifneq (,$(findstring STM32F4, $(DEVICE)))
	include $(BASE_MAKE)/STM32F4xx/common.mk
else ifneq (,$(findstring STM32F7, $(DEVICE)))
	include $(BASE_MAKE)/STM32F7xx/common.mk
else
	$(error Please set a valid DEVICE name.)
endif

# Toolchain path, defaults to the globally installed toolchain
ifdef TOOLCHAIN_PATH
	TOOLCHAIN_SEPARATOR = /
endif

TOOLCHAIN_PATH      ?=
TOOLCHAIN_SEPARATOR ?=

CC      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)arm-none-eabi-gcc
CXX     = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)arm-none-eabi-g++
LD      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)arm-none-eabi-ld -v
AR      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)arm-none-eabi-ar
AS      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)arm-none-eabi-gcc
OBJCOPY = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)arm-none-eabi-objcopy
OBJDUMP = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)arm-none-eabi-objdump
SIZE    = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)arm-none-eabi-size

# Default for flags
CFLAGS ?=

# Flags - Overall Options
CFLAGS += -specs=nosys.specs

# Flags - C Language Options
CFLAGS += -ffreestanding
# CFLAGS += -std=c11

# Flags - C++ Language Options
CFLAGS += -fno-threadsafe-statics
CFLAGS += -fno-rtti
CFLAGS += -fno-exceptions
CFLAGS += -fno-unwind-tables

# Flags - Warning Options
CFLAGS += -Wall
CFLAGS += -Wextra

# Flags - Debugging Options
CFLAGS += -g

# Flags - Optimization Options
CFLAGS += -ffunction-sections
CFLAGS += -fdata-sections

# Flags - Preprocessor options
CFLAGS += -D $(MAPPED_DEVICE)

# Flags - Assembler Options

# Flags - Linker Options
# CFLAGS += -nostdlib
CFLAGS += -Wl,-L$(BASE_LINKER),-T$(BASE_LINKER)/$(SERIES_FOLDER)/$(DEVICE).ld

# Flags - Directory Options
CFLAGS += -I./inc
CFLAGS += -I$(BASE_STARTUP)

# Flags - Machine-dependant options
CFLAGS += -mcpu=$(SERIES_CPU)
CFLAGS += -mlittle-endian
CFLAGS += -mthumb

# Project folder names
BIN_FOLDER ?= ./bin
OBJ_FOLDER ?= ./obj
SRC_FOLDER ?= ./src

# Output files
ELF_FILE_NAME ?= stm32_executable.elf
BIN_FILE_NAME ?= stm32_bin_image.bin
OBJ_FILE_NAME ?= startup_$(MAPPED_DEVICE).o

ELF_FILE_PATH = $(BIN_FOLDER)/$(ELF_FILE_NAME)
BIN_FILE_PATH = $(BIN_FOLDER)/$(BIN_FILE_NAME)
OBJ_FILE_PATH = $(OBJ_FOLDER)/$(OBJ_FILE_NAME)

# Input files
SRC ?=
SRC += $(SRC_FOLDER)/*.c

# Startup file
DEVICE_STARTUP = $(BASE_STARTUP)/$(SERIES_FOLDER)/$(MAPPED_DEVICE).s

# Include the CMSIS files, using the HAL implies using the CMSIS
ifneq (,$(or USE_ST_CMSIS, USE_ST_HAL))
CFLAGS += -D CALL_ARM_SYSTEM_INIT
CFLAGS += -I$(STM32_CUBE)/CMSIS/ARM/inc
CFLAGS += -I$(STM32_CUBE)/CMSIS/$(SERIES_FOLDER)/inc

SRC += $(STM32_CUBE)/CMSIS/$(SERIES_FOLDER)/src/*.c
endif

# Include the HAL files
ifdef USE_ST_HAL
CFLAGS += -D USE_HAL_DRIVER
CFLAGS += -I$(STM32_CUBE)/HAL/$(SERIES_FOLDER)/inc

SRC += $(STM32_CUBE)/HAL/$(SERIES_FOLDER)/src/*.c
endif

# Make all
all:$(BIN_FILE_PATH)

$(BIN_FILE_PATH): $(ELF_FILE_PATH)
	$(OBJCOPY) -O binary $^ $@

$(ELF_FILE_PATH): $(SRC) $(OBJ_FILE_PATH) | $(BIN_FOLDER)
	$(CXX) $(CFLAGS) $^ -o $@

$(OBJ_FILE_PATH): $(DEVICE_STARTUP) | $(OBJ_FOLDER)
	$(CXX) $(CFLAGS) $^ -c -o $@

$(BIN_FOLDER):
	mkdir $(BIN_FOLDER)

$(OBJ_FOLDER):
	mkdir $(OBJ_FOLDER)

# Make clean
clean:
	rm -f $(ELF_FILE_PATH)
	rm -f $(BIN_FILE_PATH)
	rm -f $(OBJ_FILE_PATH)

# Make flash
flash:
	st-flash write $(BIN_FOLDER)/$(BIN_FILE_NAME) $(FLASH)

.PHONY: all clean flash
