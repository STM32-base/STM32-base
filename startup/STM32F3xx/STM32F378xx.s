.include "startup_common.s"

.section .isr_vector, "a", %progbits
.type vector_table, %object
.size vector_table, .-vector_table
vector_table:
    .word __end_stack
    .word Reset_Handler
    .word NMI_Handler
    .word HardFault_Handler
    .word MemManage_Handler
    .word BusFault_Handler
    .word UsageFault_Handler
    .word 0
    .word 0
    .word 0
    .word 0
    .word SVC_Handler
    .word DebugMon_Handler
    .word 0
    .word PendSV_Handler
    .word SysTick_Handler

    .word WWDG_IRQHandler
    .word 0
    .word TAMP_STAMP_IRQHandler
    .word RTC_WKUP_IRQHandler
    .word FLASH_IRQHandler
    .word RCC_IRQHandler
    .word EXTI0_IRQHandler
    .word EXTI1_IRQHandler
    .word EXTI2_TSC_IRQHandler
    .word EXTI3_IRQHandler
    .word EXTI4_IRQHandler
    .word DMA1_Channel1_IRQHandler
    .word DMA1_Channel2_IRQHandler
    .word DMA1_Channel3_IRQHandler
    .word DMA1_Channel4_IRQHandler
    .word DMA1_Channel5_IRQHandler
    .word DMA1_Channel6_IRQHandler
    .word DMA1_Channel7_IRQHandler
    .word ADC1_IRQHandler
    .word CAN_TX_IRQHandler
    .word CAN_RX0_IRQHandler
    .word CAN_RX1_IRQHandler
    .word CAN_SCE_IRQHandler
    .word EXTI9_5_IRQHandler
    .word TIM15_IRQHandler
    .word TIM16_IRQHandler
    .word TIM17_IRQHandler
    .word TIM18_DAC2_IRQHandler
    .word TIM2_IRQHandler
    .word TIM3_IRQHandler
    .word TIM4_IRQHandler
    .word I2C1_EV_IRQHandler
    .word I2C1_ER_IRQHandler
    .word I2C2_EV_IRQHandler
    .word I2C2_ER_IRQHandler
    .word SPI1_IRQHandler
    .word SPI2_IRQHandler
    .word USART1_IRQHandler
    .word USART2_IRQHandler
    .word USART3_IRQHandler
    .word EXTI15_10_IRQHandler
    .word RTC_Alarm_IRQHandler
    .word CEC_IRQHandler
    .word TIM12_IRQHandler
    .word TIM13_IRQHandler
    .word TIM14_IRQHandler
    .word 0
    .word 0
    .word 0
    .word 0
    .word TIM5_IRQHandler
    .word SPI3_IRQHandler
    .word 0
    .word 0
    .word TIM6_DAC1_IRQHandler
    .word TIM7_IRQHandler
    .word DMA2_Channel1_IRQHandler
    .word DMA2_Channel2_IRQHandler
    .word DMA2_Channel3_IRQHandler
    .word DMA2_Channel4_IRQHandler
    .word DMA2_Channel5_IRQHandler
    .word SDADC1_IRQHandler
    .word SDADC2_IRQHandler
    .word SDADC3_IRQHandler
    .word COMP1_2_IRQHandler
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word TIM19_IRQHandler
    .word 0
    .word 0
    .word FPU_IRQHandler


.weak NMI_Handler
.thumb_set NMI_Handler, Default_Handler

.weak HardFault_Handler
.thumb_set HardFault_Handler, Default_Handler

.weak MemManage_Handler
.thumb_set MemManage_Handler, Default_Handler

.weak BusFault_Handler
.thumb_set BusFault_Handler, Default_Handler

.weak UsageFault_Handler
.thumb_set UsageFault_Handler, Default_Handler

.weak SVC_Handler
.thumb_set SVC_Handler, Default_Handler

.weak DebugMon_Handler
.thumb_set DebugMon_Handler, Default_Handler

.weak PendSV_Handler
.thumb_set PendSV_Handler, Default_Handler

.weak SysTick_Handler
.thumb_set SysTick_Handler, Default_Handler

.weak WWDG_IRQHandler
.thumb_set WWDG_IRQHandler, Default_Handler

.weak TAMP_STAMP_IRQHandler
.thumb_set TAMP_STAMP_IRQHandler, Default_Handler

.weak RTC_WKUP_IRQHandler
.thumb_set RTC_WKUP_IRQHandler, Default_Handler

.weak FLASH_IRQHandler
.thumb_set FLASH_IRQHandler, Default_Handler

.weak RCC_IRQHandler
.thumb_set RCC_IRQHandler, Default_Handler

.weak EXTI0_IRQHandler
.thumb_set EXTI0_IRQHandler, Default_Handler

.weak EXTI1_IRQHandler
.thumb_set EXTI1_IRQHandler, Default_Handler

.weak EXTI2_TSC_IRQHandler
.thumb_set EXTI2_TSC_IRQHandler, Default_Handler

.weak EXTI3_IRQHandler
.thumb_set EXTI3_IRQHandler, Default_Handler

.weak EXTI4_IRQHandler
.thumb_set EXTI4_IRQHandler, Default_Handler

.weak DMA1_Channel1_IRQHandler
.thumb_set DMA1_Channel1_IRQHandler, Default_Handler

.weak DMA1_Channel2_IRQHandler
.thumb_set DMA1_Channel2_IRQHandler, Default_Handler

.weak DMA1_Channel3_IRQHandler
.thumb_set DMA1_Channel3_IRQHandler, Default_Handler

.weak DMA1_Channel4_IRQHandler
.thumb_set DMA1_Channel4_IRQHandler, Default_Handler

.weak DMA1_Channel5_IRQHandler
.thumb_set DMA1_Channel5_IRQHandler, Default_Handler

.weak DMA1_Channel6_IRQHandler
.thumb_set DMA1_Channel6_IRQHandler, Default_Handler

.weak DMA1_Channel7_IRQHandler
.thumb_set DMA1_Channel7_IRQHandler, Default_Handler

.weak ADC1_IRQHandler
.thumb_set ADC1_IRQHandler, Default_Handler

.weak CAN_TX_IRQHandler
.thumb_set CAN_TX_IRQHandler, Default_Handler

.weak CAN_RX0_IRQHandler
.thumb_set CAN_RX0_IRQHandler, Default_Handler

.weak CAN_RX1_IRQHandler
.thumb_set CAN_RX1_IRQHandler, Default_Handler

.weak CAN_SCE_IRQHandler
.thumb_set CAN_SCE_IRQHandler, Default_Handler

.weak EXTI9_5_IRQHandler
.thumb_set EXTI9_5_IRQHandler, Default_Handler

.weak TIM15_IRQHandler
.thumb_set TIM15_IRQHandler, Default_Handler

.weak TIM16_IRQHandler
.thumb_set TIM16_IRQHandler, Default_Handler

.weak TIM17_IRQHandler
.thumb_set TIM17_IRQHandler, Default_Handler

.weak TIM18_DAC2_IRQHandler
.thumb_set TIM18_DAC2_IRQHandler, Default_Handler

.weak TIM2_IRQHandler
.thumb_set TIM2_IRQHandler, Default_Handler

.weak TIM3_IRQHandler
.thumb_set TIM3_IRQHandler, Default_Handler

.weak TIM4_IRQHandler
.thumb_set TIM4_IRQHandler, Default_Handler

.weak I2C1_EV_IRQHandler
.thumb_set I2C1_EV_IRQHandler, Default_Handler

.weak I2C1_ER_IRQHandler
.thumb_set I2C1_ER_IRQHandler, Default_Handler

.weak I2C2_EV_IRQHandler
.thumb_set I2C2_EV_IRQHandler, Default_Handler

.weak I2C2_ER_IRQHandler
.thumb_set I2C2_ER_IRQHandler, Default_Handler

.weak SPI1_IRQHandler
.thumb_set SPI1_IRQHandler, Default_Handler

.weak SPI2_IRQHandler
.thumb_set SPI2_IRQHandler, Default_Handler

.weak USART1_IRQHandler
.thumb_set USART1_IRQHandler, Default_Handler

.weak USART2_IRQHandler
.thumb_set USART2_IRQHandler, Default_Handler

.weak USART3_IRQHandler
.thumb_set USART3_IRQHandler, Default_Handler

.weak EXTI15_10_IRQHandler
.thumb_set EXTI15_10_IRQHandler, Default_Handler

.weak RTC_Alarm_IRQHandler
.thumb_set RTC_Alarm_IRQHandler, Default_Handler

.weak CEC_IRQHandler
.thumb_set CEC_IRQHandler, Default_Handler

.weak TIM12_IRQHandler
.thumb_set TIM12_IRQHandler, Default_Handler

.weak TIM13_IRQHandler
.thumb_set TIM13_IRQHandler, Default_Handler

.weak TIM14_IRQHandler
.thumb_set TIM14_IRQHandler, Default_Handler

.weak TIM5_IRQHandler
.thumb_set TIM5_IRQHandler, Default_Handler

.weak SPI3_IRQHandler
.thumb_set SPI3_IRQHandler, Default_Handler

.weak TIM6_DAC1_IRQHandler
.thumb_set TIM6_DAC1_IRQHandler, Default_Handler

.weak TIM7_IRQHandler
.thumb_set TIM7_IRQHandler, Default_Handler

.weak DMA2_Channel1_IRQHandler
.thumb_set DMA2_Channel1_IRQHandler, Default_Handler

.weak DMA2_Channel2_IRQHandler
.thumb_set DMA2_Channel2_IRQHandler, Default_Handler

.weak DMA2_Channel3_IRQHandler
.thumb_set DMA2_Channel3_IRQHandler, Default_Handler

.weak DMA2_Channel4_IRQHandler
.thumb_set DMA2_Channel4_IRQHandler, Default_Handler

.weak DMA2_Channel5_IRQHandler
.thumb_set DMA2_Channel5_IRQHandler, Default_Handler

.weak SDADC1_IRQHandler
.thumb_set SDADC1_IRQHandler, Default_Handler

.weak SDADC2_IRQHandler
.thumb_set SDADC2_IRQHandler, Default_Handler

.weak SDADC3_IRQHandler
.thumb_set SDADC3_IRQHandler, Default_Handler

.weak COMP1_2_IRQHandler
.thumb_set COMP1_2_IRQHandler, Default_Handler

.weak TIM19_IRQHandler
.thumb_set TIM19_IRQHandler, Default_Handler

.weak FPU_IRQHandler
.thumb_set FPU_IRQHandler, Default_Handler
