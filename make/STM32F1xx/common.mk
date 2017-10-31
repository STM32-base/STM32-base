export

# Ugly hack to pass the value to the peripheral abstraction layer
# The peripheral abstraction layer considers the x8 and xB devices to be the
# same (which they are, except for memory) but that doesn't work nice with the
# DEVICE variable set on project level.
ifeq (STM32F103x8,$(DEVICE))
    DEVICE_DEF = STM32F103xB
endif

ifndef DEVICE_DEF
    DEVICE_DEF = $(DEVICE)
endif

SERIES_CPU = cortex-m3

SERIES_FOLDER = STM32F1xx
SERIES_SETUP  = Device/ST/STM32F1xx/Source/Templates/system_stm32f1xx.c