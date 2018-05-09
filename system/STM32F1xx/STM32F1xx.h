#ifndef __STM32F1XX_H
#define __STM32F1XX_H

#ifdef __cplusplus
extern "C" {
#endif

// The STM32 series
#if !defined(STM32F1)
#define STM32F1
#endif

#if defined(STM32F100xB)
  #include "STM32F100xB.h"
#elif defined(STM32F100xE)
  #include "STM32F100xE.h"
#elif defined(STM32F101x6)
  #include "STM32F101x6.h"
#elif defined(STM32F101xB)
  #include "STM32F101xB.h"
#elif defined(STM32F101xE)
  #include "STM32F101xE.h"
#elif defined(STM32F101xG)
  #include "STM32F101xG.h"
#elif defined(STM32F102x6)
  #include "STM32F102x6.h"
#elif defined(STM32F102xB)
  #include "STM32F102xB.h"
#elif defined(STM32F103x6)
  #include "STM32F103x6.h"
#elif defined(STM32F103xB)
  #include "STM32F103xB.h"
#elif defined(STM32F103xE)
  #include "STM32F103xE.h"
#elif defined(STM32F103xG)
  #include "STM32F103xG.h"
#elif defined(STM32F105xC)
  #include "STM32F105xC.h"
#elif defined(STM32F107xC)
  #include "STM32F107xC.h"
#else
  #error "Please select the target device."
#endif

#ifdef __cplusplus
}
#endif

#endif
