#include "STM8S.h"
#include "lcd.h" 


unsigned char pos;
unsigned char bl_state;
unsigned char RX_value[16];
unsigned char data_value;


void clock_setup(void);
void GPIO_setup(void);
void UART1_setup(void);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void main(void)
{
	clock_setup();
	GPIO_setup();
	UART1_setup();
	
	LCD_init();  
	LCD_clear_home(); 
	
	LCD_goto(1, 0);
	LCD_putstr("STM8S UART ISR");
	
	while(TRUE)
	{
		LCD_goto(0, 1);
		LCD_putstr(RX_value);
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
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{	
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_FAST);
	GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
}


void UART1_setup(void)
{
	UART1_DeInit();
	
	UART1_Init(9600, 
					    UART1_WORDLENGTH_8D, 
						UART1_STOPBITS_1, 
						UART1_PARITY_NO, 
						UART1_SYNCMODE_CLOCK_DISABLE, 
						UART1_MODE_TXRX_ENABLE);
						
	UART1_ITConfig(UART1_IT_RXNE, ENABLE);
	enableInterrupts();
	
	UART1_Cmd(ENABLE);
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
