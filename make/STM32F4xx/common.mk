export

# Ugly hack to pass the value to the peripheral abstraction layer
# The peripheral abstraction layer considers the x8 and xB devices to be the
# same (which they are, except for memory) but that doesn't work nice with the
# DEVICE variable set on project level.
ifeq (STM32F401xB, $(DEVICE))
    DEVICE_DEF = STM32F401xC
endif

ifeq (STM32F401xD, $(DEVICE))
    DEVICE_DEF = STM32F401xE
endif

ifeq (STM32F405xE, $(DEVICE))
    DEVICE_DEF = STM32F405xx
endif

ifeq (STM32F407xE, $(DEVICE))
    DEVICE_DEF = STM32F407xx
endif

ifeq (STM32F407xG, $(DEVICE))
    DEVICE_DEF = STM32F407xx
endif

ifeq (STM32F410x8, $(DEVICE))
    DEVICE_DEF = STM32F410Tx
endif

ifeq (STM32F410xB, $(DEVICE))
    DEVICE_DEF = STM32F410Tx
endif

ifeq (STM32F411xC, $(DEVICE))
    DEVICE_DEF = STM32F411xE
endif

ifeq (STM32F412xE, $(DEVICE))
    DEVICE_DEF = STM32F412Zx
endif

ifeq (STM32F412xG, $(DEVICE))
    DEVICE_DEF = STM32F412Zx
endif

ifeq (STM32F413xG, $(DEVICE))
    DEVICE_DEF = STM32F413xx
endif

ifeq (STM32F415xG, $(DEVICE))
    DEVICE_DEF = STM32F415xx
endif

ifeq (STM32F417xE, $(DEVICE))
    DEVICE_DEF = STM32F417xx
endif

ifeq (STM32F417xG, $(DEVICE))
    DEVICE_DEF = STM32F417xx
endif

ifeq (STM32F423xH, $(DEVICE))
    DEVICE_DEF = STM32F423xx
endif

ifeq (STM32F427xG, $(DEVICE))
    DEVICE_DEF = STM32F427xx
endif

ifeq (STM32F427xI, $(DEVICE))
    DEVICE_DEF = STM32F427xx
endif

ifeq (STM32F429xE, $(DEVICE))
    DEVICE_DEF = STM32F429xx
endif

ifeq (STM32F429xG, $(DEVICE))
    DEVICE_DEF = STM32F429xx
endif

ifeq (STM32F429xI, $(DEVICE))
    DEVICE_DEF = STM32F429xx
endif

ifeq (STM32F437xG, $(DEVICE))
    DEVICE_DEF = STM32F437xx
endif

ifeq (STM32F437xI, $(DEVICE))
    DEVICE_DEF = STM32F437xx
endif

ifeq (STM32F439xG, $(DEVICE))
    DEVICE_DEF = STM32F439xx
endif

ifeq (STM32F439xI, $(DEVICE))
    DEVICE_DEF = STM32F439xx
endif

ifeq (STM32F446xC, $(DEVICE))
    DEVICE_DEF = STM32F446xx
endif

ifeq (STM32F446xE, $(DEVICE))
    DEVICE_DEF = STM32F446xx
endif

ifeq (STM32F469xG, $(DEVICE))
    DEVICE_DEF = STM32F469xx
endif

ifeq (STM32F469xI, $(DEVICE))
    DEVICE_DEF = STM32F469xx
endif

ifeq (STM32F479xG, $(DEVICE))
    DEVICE_DEF = STM32F479xx
endif

ifeq (STM32F479xI, $(DEVICE))
    DEVICE_DEF = STM32F479xx
endif

ifndef DEVICE_DEF
    DEVICE_DEF = $(DEVICE)
endif

SERIES_CPU = cortex-m4

SERIES_FOLDER = STM32F4xx
SERIES_SETUP  = Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c
