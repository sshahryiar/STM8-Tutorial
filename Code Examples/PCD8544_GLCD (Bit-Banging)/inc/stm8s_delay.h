#include "stm8s.h" 


#define F_CPU 				8000000UL 
#define ticks(val) 			((((F_CPU * val) / 1000000UL) - 3) / 3)


void delay_cycles(register unsigned short value);
void delay_us(register unsigned int  value);
void delay_ms(register unsigned int value);