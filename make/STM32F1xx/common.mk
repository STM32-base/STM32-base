export

# Ugly hack to pass the value to the peripheral abstraction layer
# The peripheral abstraction layer considers the x8 and xB devices to be the
# same (which they are, except for memory) but that doesn't work nice with the
# DEVICE variable set on project level.
ifeq (STM32F100x4, $(DEVICE))
    DEVICE_DEF = STM32F100xB
endif

ifeq (STM32F100x6, $(DEVICE))
    DEVICE_DEF = STM32F100xB
endif

ifeq (STM32F100x8, $(DEVICE))
    DEVICE_DEF = STM32F100xB
endif

ifeq (STM32F100xC, $(DEVICE))
    DEVICE_DEF = STM32F100xE
endif

ifeq (STM32F100xD, $(DEVICE))
    DEVICE_DEF = STM32F100xE
endif

ifeq (STM32F101x4, $(DEVICE))
    DEVICE_DEF = STM32F101x6
endif

ifeq (STM32F101x8, $(DEVICE))
    DEVICE_DEF = STM32F101xB
endif

ifeq (STM32F101xC, $(DEVICE))
    DEVICE_DEF = STM32F101xE
endif

ifeq (STM32F101xD, $(DEVICE))
    DEVICE_DEF = STM32F101xE
endif

ifeq (STM32F101xF, $(DEVICE))
    DEVICE_DEF = STM32F101xG
endif

ifeq (STM32F102x4, $(DEVICE))
    DEVICE_DEF = STM32F102x6
endif

ifeq (STM32F102x8, $(DEVICE))
    DEVICE_DEF = STM32F102xB
endif

ifeq (STM32F103x4, $(DEVICE))
    DEVICE_DEF = STM32F103x6
endif

ifeq (STM32F103x8, $(DEVICE))
    DEVICE_DEF = STM32F103xB
endif

ifeq (STM32F103xC, $(DEVICE))
    DEVICE_DEF = STM32F103xE
endif

ifeq (STM32F103xD, $(DEVICE))
    DEVICE_DEF = STM32F103xE
endif

ifeq (STM32F103xF, $(DEVICE))
    DEVICE_DEF = STM32F103xG
endif

ifeq (STM32F105x8, $(DEVICE))
    DEVICE_DEF = STM32F105xC
endif

ifeq (STM32F105xB, $(DEVICE))
    DEVICE_DEF = STM32F105xC
endif

ifeq (STM32F107xB, $(DEVICE))
    DEVICE_DEF = STM32F107xC
endif

ifndef DEVICE_DEF
    DEVICE_DEF = $(DEVICE)
endif

SERIES_CPU = cortex-m3

SERIES_FOLDER = STM32F1xx
SERIES_SETUP  = Device/ST/STM32F1xx/Source/Templates/system_stm32f1xx.c
