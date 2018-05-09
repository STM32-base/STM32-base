#ifndef __STM32F2xx_H
#define __STM32F2xx_H

#ifdef __cplusplus
extern "C" {
#endif

// The STM32 series
#if !defined(STM32F2)
#define STM32F2
#endif

#if defined(STM32F205xx)
  #include "STM32F205xx.h"
#elif defined(STM32F215xx)
  #include "STM32F215xx.h"
#elif defined(STM32F207xx)
  #include "STM32F207xx.h"
#elif defined(STM32F217xx)
  #include "STM32F217xx.h"
#else
  #error "Please select the target device."
#endif

#ifdef __cplusplus
}
#endif

#endif
