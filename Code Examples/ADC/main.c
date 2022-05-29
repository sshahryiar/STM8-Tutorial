#include "STM8S.h"


void clock_setup(void);
void GPIO_setup(void);
void ADC1_setup(void);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void main()
{
	unsigned int A0 = 0x0000;
	
	clock_setup();
	GPIO_setup();
	ADC1_setup();
	
	LCD_init();  
	LCD_clear_home(); 
	
	LCD_goto(0, 0);
	LCD_putstr("STM8 ADC");
	LCD_goto(0, 1);
	LCD_putstr("A0");
	
	while(TRUE)
	{
		ADC1_StartConversion();
		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == FALSE);
		
		A0 = ADC1_GetConversionValue();
		ADC1_ClearFlag(ADC1_FLAG_EOC);
		
		lcd_print(4, 1, A0);
		delay_ms(90);
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
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV4);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_IN_FL_NO_IT);
	
	GPIO_DeInit(GPIOC);
	
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_NO_IT);
}


void ADC1_setup(void)
{
	ADC1_DeInit();	
	
	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, 
					  ADC1_CHANNEL_0,
					  ADC1_PRESSEL_FCPU_D18, 
					  ADC1_EXTTRIG_GPIO, 
					  DISABLE, 
					  ADC1_ALIGN_RIGHT, 
					  ADC1_SCHMITTTRIG_CHANNEL0, 
					  DISABLE);
					  
	ADC1_Cmd(ENABLE);
}


void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
{
	char chr = 0x00;
		
	chr = ((value / 1000) + 0x30);	
	LCD_goto(x_pos, y_pos);
	LCD_putchar(chr); 
	
	chr = (((value / 100) % 10) + 0x30);
	LCD_goto((x_pos + 1), y_pos);
	LCD_putchar(chr); 
	
	chr = (((value / 10) % 10) + 0x30);
	LCD_goto((x_pos + 2), y_pos);
	LCD_putchar(chr); 
	
	chr = ((value % 10) + 0x30);
	LCD_goto((x_pos + 3), y_pos);
	LCD_putchar(chr); 
}
