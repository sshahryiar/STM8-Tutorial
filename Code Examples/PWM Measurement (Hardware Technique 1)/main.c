#include "STM8S.h"
#include "lcd.h"


unsigned char bl_state;
unsigned char data_value;

signed long duty_cycle = 0;


void clock_setup(void);
void GPIO_setup(void);
void TIM1_setup(void);
void TIM2_setup(void);
void print_I(unsigned char x_pos, unsigned char y_pos, signed long value);


void main()
{	
	unsigned int i = 100;
	
	clock_setup();
	GPIO_setup();
	TIM1_setup();
	TIM2_setup();
	LCD_init();  
	
	LCD_clear_home(); 
	LCD_goto(0, 0);
	LCD_putstr("PWM Capture Test");
	LCD_goto(0, 1);
	LCD_putstr("T/ms:");
	delay_ms(10);
	
	while(TRUE)
	{
		if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == RESET)
		{
			GPIO_WriteLow(GPIOD, GPIO_PIN_0);
			delay_ms(100);
			while(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == RESET);
			GPIO_WriteHigh(GPIOD, GPIO_PIN_0);
			
			i += 100;
			if(i  > 1000)
			{
				i = 100;
			}
			
			TIM2_SetCompare1(i);
			TIM2_SetCompare2(i);
		}
		
		print_I(11, 1, duty_cycle);
		delay_ms(100);
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
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{	
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
	
	GPIO_DeInit(GPIOC);
	GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);
	
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);
}


void TIM1_setup(void)
{
	TIM1_DeInit();
	TIM1_TimeBaseInit(2000, TIM1_COUNTERMODE_UP, 55535, 1);
	TIM1_CCxCmd(TIM1_CHANNEL_1, ENABLE);
	TIM1_CCxCmd(TIM1_CHANNEL_2, ENABLE);
	
	TIM1_PWMIConfig(TIM1_CHANNEL_1, 
									 TIM1_ICPOLARITY_RISING, 
									 TIM1_ICSELECTION_DIRECTTI, 
									 TIM1_ICPSC_DIV1, 
									 0);
	
	TIM1_PWMIConfig(TIM1_CHANNEL_2, 
									 TIM1_ICPOLARITY_FALLING, 
									 TIM1_ICSELECTION_INDIRECTTI, 
									 TIM1_ICPSC_DIV1, 
									 0);		
									 
	TIM1_SelectInputTrigger(TIM1_TS_TI1FP1);
	TIM1_SelectSlaveMode(TIM1_SLAVEMODE_RESET);
	
	TIM1_ClearFlag(TIM1_FLAG_CC2);
	TIM1_ITConfig(TIM1_IT_CC2, ENABLE);	
	TIM1_Cmd(ENABLE);
	enableInterrupts();
}


void TIM2_setup(void)
{
	TIM2_DeInit();
	TIM2_TimeBaseInit(TIM2_PRESCALER_32, 1250);
	TIM2_OC1Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_LOW);
	TIM2_OC2Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_LOW);
	TIM2_SetCompare1(100);
	TIM2_SetCompare2(100);
	TIM2_Cmd(ENABLE);
}


void print_I(unsigned char x_pos, unsigned char y_pos, signed long value)
{
	char tmp[6] = {0x20, 0x20, 0x20, 0x20, 0x20, '\0'} ;

	tmp[0] = ((value / 10000) + 0x30);
    tmp[1] = (((value / 1000) % 10) + 0x30);
	tmp[2] = (((value / 100) % 10) + 0x30);
    tmp[3] = (((value / 10) % 10) + 0x30);
    tmp[4] = ((value % 10) + 0x30);
	
	LCD_goto(x_pos, y_pos);
	LCD_putstr(tmp);  
}