#include "stm8s_delay.h"


void delay_cycles(register unsigned short value)
{
	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", value);
}


void delay_us(register unsigned int  value)
{
	delay_cycles(ticks(value));
}


void delay_ms(register unsigned int  value)
{
	while(value--)
	{
		delay_us(1000);
	}
}