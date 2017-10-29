#include <stm32f1xx.h>

// Quick and dirty delay
static void delay (unsigned int time) {
    for (unsigned int i = 0; i < time; i++)
        for (volatile unsigned int j = 0; j < 2000; j++);
}

int main (void) {
    // Turn on the GPIOC peripheral
    RCC->APB2ENR  |= RCC_APB2ENR_IOPCEN;

    // Put the pin in general purpose push-pull mode (B00)
    GPIOC->CRH &= ~(GPIO_CRH_CNF13);
    // Set the output mode to max. 2MHz (B10)
    GPIOC->CRH |= GPIO_CRH_MODE13_1;

    while (1) {
        // Reset the bit for port C13
        GPIOC->BSRR = GPIO_BSRR_BR13;

        delay(500);

        // Set the bit for port C13
        GPIOC->BSRR = GPIO_BRR_BS13;

        delay(500);
    }
}
