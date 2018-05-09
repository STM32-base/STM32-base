# Paths to base folders
BASE        ?= ./STM32-base
BASE_SYSTEM  = $(BASE)/system
BASE_LINKER  = $(BASE)/linker
BASE_MAKE    = $(BASE)/make
BASE_STARTUP = $(BASE)/startup

# Check if required variables are set
ifndef DEVICE
	$(error Please set the DEVICE variable in your makefile.)
endif

ifndef FLASH
	$(error Please set the FLASH variable in your makefile.)
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



# Compiler and other programs
TARGET = arm-none-eabi-

# Toolchain path, defaults to the globally installed toolchain
ifdef TOOLCHAIN_PATH
	TOOLCHAIN_SEPARATOR = /
endif

TOOLCHAIN_PATH ?=
TOOLCHAIN_SEPARATOR ?=

CC      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TARGET)gcc
CXX     = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TARGET)g++
LD      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TARGET)ld -v
AR      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TARGET)ar
AS      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TARGET)gcc
OBJCOPY = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TARGET)objcopy
OBJDUMP = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TARGET)objdump
SIZE    = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TARGET)size



# Flags - Overall Options
CFLAGS ?= -specs=nosys.specs

# Flags - C Language Options
CFLAGS += -ffreestanding
CFLAGS += -std=c11

# Flags - C++ Language Options

# Flags - Warning Options
CFLAGS += -Wall
CFLAGS += -Wextra

# Flags - Debugging Options
CFLAGS += -g

# Flags - Optimization Options

# Flags - Preprocessor options
CFLAGS += -D USE_STDPERIPH_DRIVER
CFLAGS += -D $(MAPPED_DEVICE)

# Flags - Assembler Options

# Flags - Linker Options
CFLAGS += -Wl,-L$(BASE_LINKER),-T$(BASE_LINKER)/$(SERIES_FOLDER)/$(DEVICE).ld

# Flags - Directory Options
CFLAGS += -I./src
CFLAGS += -I$(BASE_STARTUP)

ifndef USE_CMSIS
	CFLAGS += -I$(BASE_SYSTEM)
	CFLAGS += -I$(BASE_SYSTEM)/ARM
	CFLAGS += -I$(BASE_SYSTEM)/$(SERIES_FOLDER)
endif

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



# Make all
all:$(BIN_FILE_PATH)

$(BIN_FILE_PATH): $(ELF_FILE_PATH)
	$(OBJCOPY) -O binary $^ $@

$(ELF_FILE_PATH): $(SRC) $(OBJ_FILE_PATH) | $(BIN_FOLDER)
	$(CC) $(CFLAGS) $^ -o $@

$(OBJ_FILE_PATH): $(DEVICE_STARTUP) | $(OBJ_FOLDER)
	$(CC) $(CFLAGS) $^ -c -o $@

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
