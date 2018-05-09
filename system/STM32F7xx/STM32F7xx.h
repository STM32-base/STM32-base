#ifndef __STM32F7xx_H
#define __STM32F7xx_H

#ifdef __cplusplus
extern "C" {
#endif

// The STM32 series
#if !defined(STM32F7)
#define STM32F7
#endif

#if defined(STM32F722xx)
  #include "STM32F722xx.h"
#elif defined(STM32F723xx)
  #include "STM32F723xx.h"
#elif defined(STM32F732xx)
  #include "STM32F732xx.h"
#elif defined(STM32F733xx)
  #include "STM32F733xx.h"
#elif defined(STM32F756xx)
  #include "STM32F756xx.h"
#elif defined(STM32F746xx)
  #include "STM32F746xx.h"
#elif defined(STM32F745xx)
  #include "STM32F745xx.h"
#elif defined(STM32F765xx)
  #include "STM32F765xx.h"
#elif defined(STM32F767xx)
  #include "STM32F767xx.h"
#elif defined(STM32F769xx)
  #include "STM32F769xx.h"
#elif defined(STM32F777xx)
  #include "STM32F777xx.h"
#elif defined(STM32F779xx)
  #include "STM32F779xx.h"
#else
  #error "Please select the target device."
#endif

#ifdef __cplusplus
}
#endif

#endif
