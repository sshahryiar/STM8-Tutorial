#include "stm8s.h"


void GPIO_setup(void);


void main (void)
{
		bool i = FALSE;
		
		GPIO_setup();
	   
		for(;;) 
		{
			if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == FALSE)
			{
				while(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == FALSE);
				i ^= 1;
			}
			
			switch(i)
			{
					case TRUE:
					{
						delay_ms(1000);
						break;
					}
					case FALSE:
					{
						delay_ms(100);
						break;
					}
				}
			
			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
		};
}


void GPIO_setup(void)
{
	
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_FL_NO_IT);
	
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
}