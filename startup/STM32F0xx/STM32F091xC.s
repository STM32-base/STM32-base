.include "startup_common.s"

.section .isr_vector, "a", %progbits
.type vector_table, %object
.size vector_table, .-vector_table
vector_table:
    .word __end_stack
    .word Reset_Handler
    .word NMI_Handler
    .word HardFault_Handler
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word SVC_Handler
    .word 0
    .word 0
    .word PendSV_Handler
    .word SysTick_Handler
    .word WWDG_IRQHandler
    .word PVD_VDDIO2_IRQHandler
    .word RTC_IRQHandler
    .word FLASH_IRQHandler
    .word RCC_CRS_IRQHandler
    .word EXTI0_1_IRQHandler
    .word EXTI2_3_IRQHandler
    .word EXTI4_15_IRQHandler
    .word TSC_IRQHandler
    .word DMA1_Ch1_IRQHandler
    .word DMA1_Ch2_3_DMA2_Ch1_2_IRQHandler
    .word DMA1_Ch4_7_DMA2_Ch3_5_IRQHandler
    .word ADC1_COMP_IRQHandler
    .word TIM1_BRK_UP_TRG_COM_IRQHandler
    .word TIM1_CC_IRQHandler
    .word TIM2_IRQHandler
    .word TIM3_IRQHandler
    .word TIM6_DAC_IRQHandler
    .word TIM7_IRQHandler
    .word TIM14_IRQHandler
    .word TIM15_IRQHandler
    .word TIM16_IRQHandler
    .word TIM17_IRQHandler
    .word I2C1_IRQHandler
    .word I2C2_IRQHandler
    .word SPI1_IRQHandler
    .word SPI2_IRQHandler
    .word USART1_IRQHandler
    .word USART2_IRQHandler
    .word USART3_8_IRQHandler
    .word CEC_CAN_IRQHandler

.weak NMI_Handler
.thumb_set NMI_Handler, Default_Handler

.weak HardFault_Handler
.thumb_set HardFault_Handler, Default_Handler

.weak SVC_Handler
.thumb_set SVC_Handler, Default_Handler

.weak PendSV_Handler
.thumb_set PendSV_Handler, Default_Handler

.weak SysTick_Handler
.thumb_set SysTick_Handler, Default_Handler

.weak WWDG_IRQHandler
.thumb_set WWDG_IRQHandler, Default_Handler

.weak PVD_VDDIO2_IRQHandler
.thumb_set PVD_VDDIO2_IRQHandler, Default_Handler

.weak RTC_IRQHandler
.thumb_set RTC_IRQHandler, Default_Handler

.weak FLASH_IRQHandler
.thumb_set FLASH_IRQHandler, Default_Handler

.weak RCC_CRS_IRQHandler
.thumb_set RCC_CRS_IRQHandler, Default_Handler

.weak EXTI0_1_IRQHandler
.thumb_set EXTI0_1_IRQHandler, Default_Handler

.weak EXTI2_3_IRQHandler
.thumb_set EXTI2_3_IRQHandler, Default_Handler

.weak EXTI4_15_IRQHandler
.thumb_set EXTI4_15_IRQHandler, Default_Handler

.weak TSC_IRQHandler
.thumb_set TSC_IRQHandler, Default_Handler

.weak DMA1_Ch1_IRQHandler
.thumb_set DMA1_Ch1_IRQHandler, Default_Handler

.weak DMA1_Ch2_3_DMA2_Ch1_2_IRQHandler
.thumb_set DMA1_Ch2_3_DMA2_Ch1_2_IRQHandler, Default_Handler

.weak DMA1_Ch4_7_DMA2_Ch3_5_IRQHandler
.thumb_set DMA1_Ch4_7_DMA2_Ch3_5_IRQHandler, Default_Handler

.weak ADC1_COMP_IRQHandler
.thumb_set ADC1_COMP_IRQHandler, Default_Handler

.weak TIM1_BRK_UP_TRG_COM_IRQHandler
.thumb_set TIM1_BRK_UP_TRG_COM_IRQHandler, Default_Handler

.weak TIM1_CC_IRQHandler
.thumb_set TIM1_CC_IRQHandler, Default_Handler

.weak TIM2_IRQHandler
.thumb_set TIM2_IRQHandler, Default_Handler

.weak TIM3_IRQHandler
.thumb_set TIM3_IRQHandler, Default_Handler

.weak TIM6_DAC_IRQHandler
.thumb_set TIM6_DAC_IRQHandler, Default_Handler

.weak TIM7_IRQHandler
.thumb_set TIM7_IRQHandler, Default_Handler

.weak TIM14_IRQHandler
.thumb_set TIM14_IRQHandler, Default_Handler

.weak TIM15_IRQHandler
.thumb_set TIM15_IRQHandler, Default_Handler

.weak TIM16_IRQHandler
.thumb_set TIM16_IRQHandler, Default_Handler

.weak TIM17_IRQHandler
.thumb_set TIM17_IRQHandler, Default_Handler

.weak I2C1_IRQHandler
.thumb_set I2C1_IRQHandler, Default_Handler

.weak I2C2_IRQHandler
.thumb_set I2C2_IRQHandler, Default_Handler

.weak SPI1_IRQHandler
.thumb_set SPI1_IRQHandler, Default_Handler

.weak SPI2_IRQHandler
.thumb_set SPI2_IRQHandler, Default_Handler

.weak USART1_IRQHandler
.thumb_set USART1_IRQHandler, Default_Handler

.weak USART2_IRQHandler
.thumb_set USART2_IRQHandler, Default_Handler

.weak USART3_8_IRQHandler
.thumb_set USART3_8_IRQHandler, Default_Handler

.weak CEC_CAN_IRQHandler
.thumb_set CEC_CAN_IRQHandler, Default_Handler
