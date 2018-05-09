# System

This is the system folder. This folder contains the files needed to easily use the registers available on a device.

The files found in this folder and its subfolders are based on the following ST CMSIS versions:

| Series | CMSIS version |
|     F0 |         2.3.3 |
|     F1 |         4.2.0 |
|     F2 |         2.2.1 |
|     F3 |         2.3.2 |
|     F4 |         2.6.2 |
|     F7 |         1.2.2 |

## ARM folder

The ARM folder contains the ARM CMSIS files. These files provide access to the ARM Cortex peripherals. To read more on the ARM CMSIS, see their [CMSIS page](https://developer.arm.com/embedded/cmsis).

## Device specific folders

The defice specific folders contain two subfolders, namely the `src` and `include` folders. The include folder contains device-specific header files defining the devices and registers found on a particular range of devices. To figure out which header file is included for your device, see the [device name mapping wiki page](https://github.com/ThomasGravekamp/STM32-base/wiki/Device-name-mapping).

## Peripheral definition

The peripherals are defined as C `structs`. These structs represent the area of memory containing the registers used by the peripheral. An example is the STM32F030x6 ADC struct definition:

```
typedef struct {
  __IO uint32_t ISR;
  __IO uint32_t IER;
  __IO uint32_t CR;
  __IO uint32_t CFGR1;
  __IO uint32_t CFGR2;
  __IO uint32_t SMPR;
       uint32_t RESERVED1;
       uint32_t RESERVED2;
  __IO uint32_t TR;
       uint32_t RESERVED3;
  __IO uint32_t CHSELR;
       uint32_t RESERVED4[5];
  __IO uint32_t DR;
} ADC_TypeDef;
```

Later on in the file, this struct is used to define the actual device(s). First, the address of the peripheral is defined. Then the peripherals themselves are defind as pointers to this memory address. Because the struct is used to define the structure of the peripheral, the registers are easily accessable.

```
#define ADC1_BASE           (APBPERIPH_BASE + 0x00012400)
...
#define ADC1                ((ADC_TypeDef *) ADC1_BASE)
```

Then the individual bits for each register are defined. These are just single values which can be used as bit-masks to set or clear a single value in a register.

```
#define ADC_ISR_ADRDY_Pos         (0U)
#define ADC_ISR_ADRDY_Msk         (0x1U << ADC_ISR_ADRDY_Pos)
#define ADC_ISR_ADRDY             ADC_ISR_ADRDY_Msk
#define ADC_ISR_EOSMP_Pos         (1U)
#define ADC_ISR_EOSMP_Msk         (0x1U << ADC_ISR_EOSMP_Pos)
#define ADC_ISR_EOSMP             ADC_ISR_EOSMP_Msk
```
