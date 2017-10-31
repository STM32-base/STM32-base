export

# Ugly hack to pass the value to the peripheral abstraction layer
# The peripheral abstraction layer considers the x4 and x6 devices to be the
# same (which they are, except for memory) but that doesn't work nice with the
# DEVICE variable set on project level.
ifeq (STM32F030x4,$(DEVICE))
    DEVICE_DEF = STM32F030x6
endif

ifndef DEVICE_DEF
    DEVICE_DEF = $(DEVICE)
endif

SERIES_CPU = cortex-m0

SERIES_FOLDER  = STM32F0xx
SERIES_SETUP   = Device/ST/STM32F0xx/Source/Templates/system_stm32f0xx.c