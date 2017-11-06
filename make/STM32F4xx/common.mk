export

# Ugly hack to pass the value to the peripheral abstraction layer
# The peripheral abstraction layer considers the x8 and xB devices to be the
# same (which they are, except for memory) but that doesn't work nice with the
# DEVICE variable set on project level.
ifeq (STM32F407xE,$(DEVICE))
    DEVICE_DEF = STM32F407xx
endif

ifndef DEVICE_DEF
    DEVICE_DEF = $(DEVICE)
endif

SERIES_CPU = cortex-m4

SERIES_FOLDER = STM32F4xx
SERIES_SETUP  = Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c
