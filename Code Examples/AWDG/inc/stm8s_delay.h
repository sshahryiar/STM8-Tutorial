#include "stm8s.h" 


#define F_CPU 				8000000UL 
#define dly_const			(F_CPU / 16000000.0F) 


void delay_us(unsigned int  value);
void delay_ms(unsigned int value);