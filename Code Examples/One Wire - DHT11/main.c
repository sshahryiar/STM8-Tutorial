#include "STM8S.h"
#include "lcd.h" 
#include "DHT11.h"


unsigned char bl_state;
unsigned char data_value;
unsigned char values[5]; 

const unsigned char symbol[8] = 
{
   0x00, 0x06, 0x09, 0x09, 0x06, 0x00, 0x00, 0x00
};


void clock_setup(void);
void GPIO_setup(void);
void lcd_symbol(void);
unsigned int make_word(unsigned char HB, unsigned char LB);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned char value);


void main(void)
{	
	unsigned char state = 0x00;
	
	unsigned int RH = 0x0000;
	unsigned int t = 0x0000;
	
	clock_setup();
	GPIO_setup();
	
	DHT11_init();
	
	LCD_init();  
	LCD_clear_home(); 
	lcd_symbol();
	
	while(TRUE)
	{
		  GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
		  
		  state = get_data();
      
		  switch(state)
		  {
				case 1:
				{
				}
				case 2:
				{
				   LCD_clear_home(); 
				   LCD_putstr("No Sensor Found!");
				   break;
				}
				case 3:
				{
				   LCD_clear_home(); 
				   LCD_putstr("Checksum Error!");
				   break;
				}
				default:
				{
				   LCD_goto(0, 0); 
				   LCD_putstr("R.H/ %:       ");
				   
				   RH = make_word(values[0], values[1]);
				   lcd_print(14, 0, values[0]);
				   
				   LCD_goto(0, 1); 
				   LCD_putstr("Tmp/");
				   LCD_goto(4, 1); 
				   LCD_send(0, DAT);
				   LCD_goto(5, 1); 
				   LCD_putstr("C:");
							  
				   t = make_word(values[2], values[3]);
				   if((values[2] & 0x80) == 1)
				   {
					   LCD_goto(13, 1); 
					   LCD_putstr("-");
				   }
				   else
				   {
					   LCD_goto(13, 1); 
					   LCD_putstr(" ");
				   }
					
				   lcd_print(14, 1, values[2]); 
				   break;
				}
		  }
		  delay_ms(1000);
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
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
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
	GPIO_DeInit(DHT11_port);
}


void lcd_symbol(void)  
{
	unsigned char s = 0;  

   LCD_send(0x40, CMD);
    
   for(s = 0; s < 8; s++)
   {
        LCD_send(symbol[s], DAT);
   }
   
   LCD_send(0x80, CMD);
} 


unsigned int make_word(unsigned char HB, unsigned char LB)
{
  unsigned int value = 0x0000;
  
  value = HB;
  value <<= 8;
  value |= LB;
  
  return value;
}


void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned char value)
{
	char chr = 0x00;
	
	chr = ((value / 10) + 0x30);
	LCD_goto(x_pos, y_pos);
	LCD_putchar(chr); 
	
	chr = ((value % 10) + 0x30);
	LCD_goto((x_pos + 1), y_pos);
	LCD_putchar(chr); 
}