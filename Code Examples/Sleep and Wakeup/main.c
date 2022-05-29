#include "stm8s.h"


bool state = FALSE;


void GPIO_setup(void);
void EXTI_setup(void);
void clock_setup(void);


void main(void)
{
	unsigned char i = 0;
	
	GPIO_setup();
	EXTI_setup();
	clock_setup();
	
	for(i = 0; i <= 6; i++)
	{
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
		delay_ms(900);
	}
	wfi();
	
	while (TRUE)
	{
		for(i = 0; i < 4; i++)
		{
			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
			delay_ms(600);
		}
		for(i = 0; i < 4; i++)
		{
			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
			delay_ms(300);
		}
		halt();
	}
}


void GPIO_setup(void)
{
	GPIO_DeInit(GPIOB);    
	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_IT);
	
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
}


void EXTI_setup(void)
{
	ITC_DeInit();
	ITC_SetSoftwarePriority(ITC_IRQ_PORTB, ITC_PRIORITYLEVEL_0);
	
	EXTI_DeInit();
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY);
	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
	
	rim();
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
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}