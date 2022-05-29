#include "STM8S.h"


void clock_setup(void);
void GPIO_setup(void);
void WWDG_setup(void);


void main(void)
{
	unsigned char i = 0x00;
	
	clock_setup();
	GPIO_setup();
	
	for(i = 0x00; i < 0x04; i++)
	{
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
		delay_ms(40);
	}
	
	WWDG_setup();	
	
	while(TRUE)
	{
		if((GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == FALSE) || ((WWDG_GetCounter() > 0x60) && (WWDG_GetCounter() < 0x7F)))
		{
			WWDG_SetCounter(0x7F);
		}
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
		delay_ms(20);
	};
}


void clock_setup(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV64);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{		
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
	
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_FAST);
}


void WWDG_setup(void)
{
	WWDG_Init(0x7F, 0x60);
}
