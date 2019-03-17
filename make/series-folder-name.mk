export

ifneq (, $(findstring STM32F0, $(DEVICE)))
    SERIES_FOLDER = STM32F0xx
else \
ifneq (, $(findstring STM32F1, $(DEVICE)))
    SERIES_FOLDER = STM32F1xx
else \
ifneq (, $(findstring STM32F2, $(DEVICE)))
    SERIES_FOLDER = STM32F2xx
else \
ifneq (, $(findstring STM32F3, $(DEVICE)))
    SERIES_FOLDER = STM32F3xx
else \
ifneq (, $(findstring STM32F4, $(DEVICE)))
    SERIES_FOLDER = STM32F4xx
else \
ifneq (, $(findstring STM32F7, $(DEVICE)))
    SERIES_FOLDER = STM32F7xx
# else
# ifneq (, $(findstring STM32G0, $(DEVICE)))
#     SERIES_FOLDER = STM32G0xx
# else \
# ifneq (, $(findstring STM32H7, $(DEVICE)))
#     SERIES_FOLDER = STM32H7xx
# else \
# ifneq (, $(findstring STM32L0, $(DEVICE)))
#     SERIES_FOLDER = STM32L0xx
# else \
# ifneq (, $(findstring STM32L1, $(DEVICE)))
#     SERIES_FOLDER = STM32L1xx
# else \
# ifneq (, $(findstring STM32L4, $(DEVICE)))
#     SERIES_FOLDER = STM32L4xx
# else \
# ifneq (, $(findstring STM32L5, $(DEVICE)))
#     SERIES_FOLDER = STM32L5xx
# else \
# ifneq (, $(findstring STM32MP1, $(DEVICE)))
#     SERIES_FOLDER = STM32MP1xx
# else \
# ifneq (, $(findstring STM32WB, $(DEVICE)))
#     SERIES_FOLDER = STM32WBxx
else
    $(error Please set a valid DEVICE name.)
endif
