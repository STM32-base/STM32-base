#ifndef __STM32F0xx_H
#define __STM32F0xx_H

#ifdef __cplusplus
extern "C" {
#endif

// The STM32 series
#if !defined(STM32F0)
#define STM32F0
#endif

#if defined(STM32F030x6)
  #include "STM32F030x6.h"
#elif defined(STM32F030x8)
  #include "STM32F030x8.h"
#elif defined(STM32F031x6)
  #include "STM32F031x6.h"
#elif defined(STM32F038xx)
  #include "STM32F038xx.h"
#elif defined(STM32F042x6)
  #include "STM32F042x6.h"
#elif defined(STM32F048xx)
  #include "STM32F048xx.h"
#elif defined(STM32F051x8)
  #include "STM32F051x8.h"
#elif defined(STM32F058xx)
  #include "STM32F058xx.h"
#elif defined(STM32F070x6)
  #include "STM32F070x6.h"
#elif defined(STM32F070xB)
  #include "STM32F070xB.h"
#elif defined(STM32F071xB)
  #include "STM32F071xB.h"
#elif defined(STM32F072xB)
  #include "STM32F072xB.h"
#elif defined(STM32F078xx)
  #include "STM32F078xx.h"
#elif defined(STM32F091xC)
  #include "STM32F091xC.h"
#elif defined(STM32F098xx)
  #include "STM32F098xx.h"
#elif defined(STM32F030xC)
  #include "STM32F030xC.h"
#else
  #error "Please select the target device."
#endif

#ifdef __cplusplus
}
#endif

#endif
