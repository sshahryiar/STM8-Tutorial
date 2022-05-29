#include "stm8s_delay.h"


void delay_us(unsigned int  value)
{
	register unsigned int loops =  (dly_const * value) ;
	
	while(loops)
	{
		_asm ("nop");
		loops--;
	};
}


void delay_ms(unsigned int  value)
{
	while(value)
	{
		delay_us(1000);
		value--;
	};
}