#include "STM8S.h"


void clock_setup(void);
void GPIO_setup(void);
void IWDG_setup(void);


void main(void)
{
	unsigned int t = 0;
	
	clock_setup();
	GPIO_setup();
		
	GPIO_WriteLow(GPIOD, GPIO_PIN_0);
	for(t = 0; t < 60000; t++);
	
	IWDG_setup();

	while(TRUE)
	{
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
		for(t = 0; t < 1000; t++)
		{
			if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == FALSE)
			{
				IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
				IWDG_ReloadCounter();
				IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
			}
		}
	};
}


void clock_setup(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == FALSE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV4);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
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
	GPIO_DeInit(GPIOD);

	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
}


void IWDG_setup(void)
{
	IWDG_Enable();
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	IWDG_SetPrescaler(IWDG_Prescaler_128);
	IWDG_SetReload(0x99);
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
}