# Paths to base folders
BASE         = ./STM32-base
BASE_CMSIS   = $(BASE)/CMSIS
BASE_LINKER  = $(BASE)/linker
BASE_MAKE    = $(BASE)/make
BASE_STARTUP = $(BASE)/startup

ifndef DEVICE
  $(error Please set the DEVICE variable)
endif
ifndef FLASH
  $(error Please set the FLASH variable)
endif



ifneq (,$(findstring STM32F0, $(DEVICE)))
    include $(BASE_MAKE)/STM32F0xx/common.mk
endif
ifneq (,$(findstring STM32F1, $(DEVICE)))
    include $(BASE_MAKE)/STM32F1xx/common.mk
endif

# Compiler and other programs
TARGET ?= arm-none-eabi-

CC      = $(TARGET)gcc
CXX     = $(TARGET)g++
LD      = $(TARGET)ld -v
AR      = $(TARGET)ar
AS      = $(TARGET)gcc
OBJCOPY = $(TARGET)objcopy
OBJDUMP = $(TARGET)objdump
SIZE    = $(TARGET)size

# Flags - Overall Options
CFLAGS  = -specs=nosys.specs

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
CFLAGS += -D $(DEVICE_DEF)

# Flags - Assembler Options

# Flags - Linker Options
CFLAGS += -Wl,-T,$(BASE_LINKER)/$(SERIES_FOLDER)/$(DEVICE).ld

# Flags - Directory Options
CFLAGS += -I./src
CFLAGS += -I$(BASE_CMSIS)/Include
CFLAGS += -I$(BASE_CMSIS)/Device/ST/$(SERIES_FOLDER)/Include
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
EXECUTABLE  = $(BIN_FOLDER)/stm32_executable.elf
BIN_IMAGE   = $(BIN_FOLDER)/stm32_bin_image.bin
STARTUP_OBJ = $(OBJ_FOLDER)/startup_$(DEVICE).o

# Input files
SRC  = $(SRC_FOLDER)/*.c
SRC += $(BASE_CMSIS)/$(SERIES_SETUP)

# Startup file
# DEVICE_STARTUP  = $(BASE_STARTUP)/startup_common.s
DEVICE_STARTUP = $(BASE_STARTUP)/$(SERIES_FOLDER)/startup_$(DEVICE).s



# Make all
all:$(BIN_IMAGE)

$(BIN_IMAGE):$(EXECUTABLE)
	$(OBJCOPY) -O binary $^ $@

$(EXECUTABLE):$(SRC) $(STARTUP_OBJ)
	$(CC) $(CFLAGS) $^ -o $@

$(STARTUP_OBJ): $(DEVICE_STARTUP)
	$(CC) $(CFLAGS) $^ -c -o $@

# Make clean
clean:
	-rm $(EXECUTABLE)
	-rm $(BIN_IMAGE)
	-rm $(STARTUP_OBJ)

# Make flash
flash:
	st-flash write $(BIN_IMAGE) $(FLASH)

.PHONY: all clean flash
