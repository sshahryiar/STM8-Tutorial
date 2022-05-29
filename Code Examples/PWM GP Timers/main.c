#include "STM8S.h"


void clock_setup(void);
void GPIO_setup(void);
void TIM2_setup(void);


void main(void)
{
	signed int pwm_duty = 0x0000;
	
	clock_setup();
	GPIO_setup();
	TIM2_setup();
	
	while(TRUE)
	{
		for(pwm_duty = 0; pwm_duty < 1000; pwm_duty += 10)
		{
			TIM2_SetCompare1(pwm_duty);
			TIM2_SetCompare2(pwm_duty);
			TIM2_SetCompare3(pwm_duty);
			delay_ms(10);
		}
		for(pwm_duty = 1000; pwm_duty > 0; pwm_duty -= 10)
		{
			TIM2_SetCompare1(pwm_duty);
			TIM2_SetCompare2(pwm_duty);
			TIM2_SetCompare3(pwm_duty);
			delay_ms(10);
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
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
	GPIO_DeInit(GPIOA);
	GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
	
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, ((GPIO_Pin_TypeDef)GPIO_PIN_3 | GPIO_PIN_4), GPIO_MODE_OUT_PP_HIGH_FAST);
}


void TIM2_setup(void)
{
	TIM2_DeInit();
    TIM2_TimeBaseInit(TIM2_PRESCALER_32, 1000);
	TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_HIGH);
	TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_LOW);
	TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_HIGH);
	TIM2_Cmd(ENABLE);
}