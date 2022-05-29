#include "stm8s.h"


#define bit_tgl(reg, bit_val)                                                            reg ^= (1 << bit_val)


void main (void)
{
	GPIOD->DDR |= 0x01;  
	GPIOD->CR1 |= 0x01;  
   
	for(;;) 
	{
		//GPIOD->ODR ^= (1 << 0);
		bit_tgl(GPIOD->ODR, 0);
		delay_ms(90);
	};
}
