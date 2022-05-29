#include "STM8S.h"
#include "lcd.h" 


#define Button_Port			GPIOB
#define Button_Pin				GPIO_PIN_7


unsigned char bl_state;
unsigned char data_value;


void clock_setup(void);
void GPIO_setup(void);
void Flash_setup(void);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned char value);


void main()
{	
	unsigned char value = 0x00;
	
	clock_setup();
	GPIO_setup();
	Flash_setup();
	
	LCD_init();  
	LCD_clear_home(); 
	
	LCD_goto(0, 0);
	LCD_putstr("STM8 EEPROM Test");
	
	value = FLASH_ReadByte(0x4000);
	delay_ms(20);
	
	LCD_goto(0, 1);
	LCD_putstr("WR: ---");
	LCD_goto(9, 1);
	LCD_putstr("RD:");
	lcd_print(13, 1, value);
	delay_ms(2000);
	
	while(TRUE)
	{
		if(GPIO_ReadInputPin(Button_Port, Button_Pin) == FALSE)
		{
			while(GPIO_ReadInputPin(Button_Port, Button_Pin) == FALSE);
			FLASH_Unlock(FLASH_MEMTYPE_DATA);
			FLASH_EraseByte(0x4000);
			delay_ms(20);
			FLASH_ProgramByte(0x4000, value);
			delay_ms(20);
			FLASH_Lock(FLASH_MEMTYPE_DATA);
			
			lcd_print(13, 1, value);
		}
		
		delay_ms(20);
		lcd_print(4, 1, value);
		
		value++;
		delay_ms(200);
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
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
	GPIO_DeInit(GPIOB);
	GPIO_Init(Button_Port, Button_Pin, GPIO_MODE_IN_FL_NO_IT);
}


void Flash_setup(void)
{
	FLASH_DeInit();
}


void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned char value)
{
	char chr = 0x00;
		
	chr = ((value / 100) + 0x30);
	LCD_goto(x_pos, y_pos);
	LCD_putchar(chr); 
	
	chr = (((value / 10) % 10) + 0x30);
	LCD_goto((x_pos + 1), y_pos);
	LCD_putchar(chr); 
	
	chr = ((value % 10) + 0x30);
	LCD_goto((x_pos + 2), y_pos);
	LCD_putchar(chr); 
}
