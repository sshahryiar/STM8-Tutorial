#include "STM8S.h"


void clock_setup(void);
void GPIO_setup(void);
void TIM1_setup(void);


void main(void)
{
	clock_setup();
	GPIO_setup();
	TIM1_setup();
	
	while(TRUE)
	{
	};
}


void clock_setup(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSERDY) == FALSE);
	
	CLK_LSICmd(DISABLE);
	
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{		
	GPIO_DeInit(GPIOC);
	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_WriteHigh(GPIOC, GPIO_PIN_4);
	delay_ms(2000);
}


void TIM1_setup(void)
{
	TIM1_DeInit();
	
	TIM1_TimeBaseInit(160, TIM1_COUNTERMODE_UP, 10000, 1);
	
	TIM1_OC4Init(TIM1_OCMODE_PWM2, 
							TIM1_OUTPUTSTATE_ENABLE,  
							6000, 
							TIM1_OCPOLARITY_HIGH,  
							TIM1_OCIDLESTATE_RESET);
				  
	TIM1_SelectOnePulseMode(TIM1_OPMODE_SINGLE);
	TIM1_CtrlPWMOutputs(ENABLE);
	TIM1_Cmd(ENABLE);
}