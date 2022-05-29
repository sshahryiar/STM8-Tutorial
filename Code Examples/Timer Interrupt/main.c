#include "STM8S.h"


unsigned int value = 0x00;

unsigned char n = 0x00;
unsigned char seg = 0x01;
const unsigned char num[0x0A] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};


void GPIO_setup(void);
void clock_setup(void);
void TIM4_setup(void);


void main(void)
{
	GPIO_setup();
	clock_setup();
	TIM4_setup();
	
	while (TRUE)
	{
		value++;
		delay_ms(999);
	};
}


void GPIO_setup(void)
{
	GPIO_DeInit(GPIOC);
	GPIO_Init(GPIOC, ((GPIO_Pin_TypeDef)(GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7)), GPIO_MODE_OUT_PP_HIGH_FAST);
	
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_HIGH_FAST);
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


void TIM4_setup(void)
{	
	TIM4_DeInit();
	TIM4_TimeBaseInit(TIM4_PRESCALER_32, 128);	
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	TIM4_Cmd(ENABLE);
	enableInterrupts();
}
