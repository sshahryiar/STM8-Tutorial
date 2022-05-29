#include "stm8s.h"


void GPIO_setup(void);
void clock_setup(void);


void main (void)
{
		bool i = FALSE;
		
		GPIO_setup();
		clock_setup();
	   
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
						delay_us(10000);
						break;
					}
					case FALSE:
					{
						delay_us(100);
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


void clock_setup(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
											  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
											  CLK_SOURCE_HSI, 
											  DISABLE, 
											  CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}