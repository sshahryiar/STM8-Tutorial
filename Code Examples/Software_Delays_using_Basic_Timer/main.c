#include "STM8S.h"


void clock_setup(void);
void GPIO_setup(void);
void delay_us(signed int us);
void delay_ms(signed int ms);


void main(void)
{
	clock_setup();
	GPIO_setup();
	
	while(TRUE)
	{
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
		delay_ms(400);
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
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
}


void GPIO_setup(void)
{
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_SLOW);
}


void delay_us(signed int us)
{   
	TIM4_DeInit();	
	
	if((us <= 200) && (us >= 0))
	{
		TIM4_TimeBaseInit(TIM4_PRESCALER_16, 200);
		TIM4_Cmd(ENABLE);   
	}
	else if((us <= 400) && (us > 200))
	{
		us >>= 1;
		TIM4_TimeBaseInit(TIM4_PRESCALER_32, 200);
		TIM4_Cmd(ENABLE);   
	}
	else if((us <= 800) && (us > 400))
	{
		us >>= 2;
		TIM4_TimeBaseInit(TIM4_PRESCALER_64, 200);
		TIM4_Cmd(ENABLE);   
	}
	else if(us > 800)
	{
		us >>= 3;
		TIM4_TimeBaseInit(TIM4_PRESCALER_128, 200);
		TIM4_Cmd(ENABLE);   
	}
	
	while(TIM4_GetCounter() < us);
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	TIM4_Cmd(DISABLE);     
}


void delay_ms(signed int ms)
{
	while(ms--)
	{
		delay_us(1000);
	};
}    