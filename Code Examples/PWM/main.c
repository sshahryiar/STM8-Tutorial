#include "STM8S.h"


void clock_setup(void);
void GPIO_setup(void);
void TIM1_setup(void);


void main(void)
{
	signed int i = 0;
	
	clock_setup();
	GPIO_setup();
	TIM1_setup();
	
	while(TRUE)
	{
		for(i = 0; i < 1000; i += 1)
		{
			TIM1_SetCompare1(i);
			delay_ms(1);
		}
		for(i = 1000; i > 0; i -= 1)
		{
			TIM1_SetCompare1(i);
			delay_ms(1);
		}
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
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{		
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_OUT_PP_HIGH_FAST);
	
	GPIO_DeInit(GPIOC);
	GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_FAST);
}


void TIM1_setup(void)
{
	TIM1_DeInit();
	
	TIM1_TimeBaseInit(16, TIM1_COUNTERMODE_UP, 1000, 1);
	
	TIM1_OC1Init(TIM1_OCMODE_PWM1, 
							TIM1_OUTPUTSTATE_ENABLE, 
						    TIM1_OUTPUTNSTATE_ENABLE, 
							1000, 
							TIM1_OCPOLARITY_LOW, 
							TIM1_OCNPOLARITY_LOW, 
							TIM1_OCIDLESTATE_RESET, 
							TIM1_OCNIDLESTATE_RESET);
	
	TIM1_CtrlPWMOutputs(ENABLE);
	TIM1_Cmd(ENABLE);
}