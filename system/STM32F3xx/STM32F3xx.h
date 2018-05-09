#ifndef __STM32F3xx_H
#define __STM32F3xx_H

#ifdef __cplusplus
extern "C" {
#endif

// The STM32 series
#if !defined(STM32F3)
#define STM32F3
#endif

#if defined(STM32F301x8)
  #include "STM32F301x8.h"
#elif defined(STM32F302x8)
  #include "STM32F302x8.h"
#elif defined(STM32F302xC)
  #include "STM32F302xC.h"
#elif defined(STM32F302xE)
  #include "STM32F302xE.h"
#elif defined(STM32F303x8)
  #include "STM32F303x8.h"
#elif defined(STM32F303xC)
  #include "STM32F303xC.h"
#elif defined(STM32F303xE)
  #include "STM32F303xE.h"
#elif defined(STM32F373xC)
  #include "STM32F373xC.h"
#elif defined(STM32F334x8)
  #include "STM32F334x8.h"
#elif defined(STM32F318xx)
  #include "STM32F318xx.h"
#elif defined(STM32F328xx)
  #include "STM32F328xx.h"
#elif defined(STM32F358xx)
  #include "STM32F358xx.h"
#elif defined(STM32F378xx)
  #include "STM32F378xx.h"
#elif defined(STM32F398xx)
  #include "STM32F398xx.h"
#else
  #error "Please select the target device."
#endif

#ifdef __cplusplus
}
#endif

#endif
