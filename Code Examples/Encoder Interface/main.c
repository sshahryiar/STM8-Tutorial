#include "STM8S.h"
#include "lcd.h" 


#define LED_Port					GPIOD
#define LED_Pin					GPIO_PIN_0


unsigned char bl_state;
unsigned char data_value;


void clock_setup(void);
void GPIO_setup(void);
void TIM1_setup(void);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void main()
{	
	unsigned int present_value = 0x0000;
	unsigned int previous_value = 0x0001;
	
	clock_setup();
	GPIO_setup();
	TIM1_setup();
	
	LCD_init();  
	LCD_clear_home(); 
	
	LCD_goto(1, 0);
	LCD_putstr("STM8S QEI Test");
	LCD_goto(0, 1);
	LCD_putstr("Value:");
	
	while(TRUE)
	{
		present_value = TIM1_GetCounter();
		if(present_value != previous_value)
		{
			lcd_print(12, 1, present_value);
			GPIO_WriteReverse(LED_Port, LED_Pin);
		}
		
		previous_value = present_value;
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
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);
											  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
											  CLK_SOURCE_HSI, 
											  DISABLE, 
											  CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
	GPIO_DeInit(GPIOC);
	GPIO_Init(GPIOC, 
					 ((GPIO_Pin_TypeDef)(GPIO_PIN_1 | GPIO_PIN_2)), 
					 GPIO_MODE_IN_PU_NO_IT);
	
	GPIO_DeInit(GPIOD);
	GPIO_Init(LED_Port, LED_Pin, GPIO_MODE_OUT_OD_HIZ_FAST);
}


void TIM1_setup(void)
{
	TIM1_DeInit();
	
	TIM1_TimeBaseInit(10, TIM1_COUNTERMODE_UP, 1000, 1);
							 
	TIM1_EncoderInterfaceConfig(TIM1_ENCODERMODE_TI12, 
                                 TIM1_ICPOLARITY_FALLING, 
                                 TIM1_ICPOLARITY_FALLING);
	
	TIM1_Cmd(ENABLE);
}


void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
{
	char tmp[5] = {0x20, 0x20, 0x20, 0x20, '\0'} ;

	tmp[0] = ((value / 1000) + 0x30);
    tmp[1] = (((value / 100) % 10) + 0x30);
	tmp[2] = (((value / 10) % 10) + 0x30);
    tmp[3] = ((value % 10) + 0x30);
	
	LCD_goto(x_pos, y_pos);
	LCD_putstr(tmp);   
}