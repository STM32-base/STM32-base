#ifndef __STM32F4xx_H
#define __STM32F4xx_H

#ifdef __cplusplus
extern "C" {
#endif

// The STM32 series
#if !defined(STM32F4)
#define STM32F4
#endif

#if defined(STM32F405xx)
  #include "STM32F405xx.h"
#elif defined(STM32F415xx)
  #include "STM32F415xx.h"
#elif defined(STM32F407xx)
  #include "STM32F407xx.h"
#elif defined(STM32F417xx)
  #include "STM32F417xx.h"
#elif defined(STM32F427xx)
  #include "STM32F427xx.h"
#elif defined(STM32F437xx)
  #include "STM32F437xx.h"
#elif defined(STM32F429xx)
  #include "STM32F429xx.h"
#elif defined(STM32F439xx)
  #include "STM32F439xx.h"
#elif defined(STM32F401xC)
  #include "STM32F401xC.h"
#elif defined(STM32F401xE)
  #include "STM32F401xE.h"
#elif defined(STM32F410Tx)
  #include "STM32F410Tx.h"
#elif defined(STM32F410Cx)
  #include "STM32F410Cx.h"
#elif defined(STM32F410Rx)
  #include "STM32F410Rx.h"
#elif defined(STM32F411xE)
  #include "STM32F411xE.h"
#elif defined(STM32F446xx)
  #include "STM32F446xx.h"
#elif defined(STM32F469xx)
  #include "STM32F469xx.h"
#elif defined(STM32F479xx)
  #include "STM32F479xx.h"
#elif defined(STM32F412Cx)
  #include "STM32F412Cx.h"
#elif defined(STM32F412Zx)
  #include "STM32F412Zx.h"
#elif defined(STM32F412Rx)
  #include "STM32F412Rx.h"
#elif defined(STM32F412Vx)
  #include "STM32F412Vx.h"
#elif defined(STM32F413xx)
  #include "STM32F413xx.h"
#elif defined(STM32F423xx)
  #include "STM32F423xx.h"
#else
  #error "Please select the target device."
#endif

#ifdef __cplusplus
}
#endif

#endif
