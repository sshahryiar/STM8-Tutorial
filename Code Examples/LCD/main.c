#include "STM8S.h"
#include "lcd.h"


void clock_setup(void);
void GPIO_setup(void);


void main(void)
{
	const char txt1[] = {"MICROARENA"}; 
	const char txt2[] = {"SShahryiar"}; 
	const char txt3[] = {"STM8S003K"};
	const char txt4[] = {"Discovery"};
	
	unsigned char s = 0x00;
	
	clock_setup();
	GPIO_setup();
	
	LCD_init();  
	LCD_clear_home(); 

	LCD_goto(3, 0);                              
	LCD_putstr(txt1); 
	LCD_goto(3, 1);
	LCD_putstr(txt2);
	delay_ms(4000);
	
	LCD_clear_home(); 
	
	for(s = 0; s < 9; s++)
	{
		LCD_goto((3 + s), 0);   
		LCD_putchar(txt3[s]);
		delay_ms(90);
	}
	for(s = 0; s < 9; s++)
	{
		LCD_goto((3 + s), 1);   
		LCD_putchar(txt4[s]);
		delay_ms(90);
	}
	
	while (TRUE);
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
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
	GPIO_DeInit(LCD_PORT);
}