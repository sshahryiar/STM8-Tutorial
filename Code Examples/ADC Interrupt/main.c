#include "STM8S.h"
#include "lcd.h" 


unsigned int adc_value;


unsigned char bl_state;
unsigned char data_value;


void clock_setup(void);
void GPIO_setup(void);
void ADC1_setup(void);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void main(void)
{
	float mv = 0x00000000;
	
	clock_setup();
	GPIO_setup();
	ADC1_setup();
	
	LCD_init();  
	LCD_clear_home(); 
	
	LCD_goto(2, 0);
	LCD_putstr("STM8 ADC ISR");
	LCD_goto(0, 1);
	LCD_putstr("A0/mV");
	
	while(TRUE)
	{
		ADC1_StartConversion();
		
		mv = (adc_value * 5000.0);
		mv /= 1023.0; 
		
		lcd_print(7, 1, mv);		
		lcd_print(12, 1, adc_value);
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
		delay_ms(160);
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
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, ((GPIO_Pin_TypeDef)(GPIO_PIN_0 | GPIO_PIN_1)), GPIO_MODE_IN_FL_NO_IT);
	
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_FAST);
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

	ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
	enableInterrupts();
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
