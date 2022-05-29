#include "STM8S.h"
#include "lcd.h"
#include "SW_I2C.h"
#include "DS1307.h"


#define Button_port      	GPIOB
#define Button_pin			GPIO_PIN_7


struct
{
   unsigned char s;
   unsigned char m;
   unsigned char h;
   unsigned char dy;
   unsigned char dt;
   unsigned char mt;
   unsigned char yr;
}time;

bool set = FALSE;

unsigned char menu = 0;
unsigned char data_value;


void clock_setup(void);
void GPIO_setup(void);
void show_value(unsigned char x_pos, unsigned char y_pos, unsigned char value);
void display_time(void);
void setup_time(void);
unsigned char adjust(unsigned char x_pos, unsigned char y_pos, signed char value_max, signed char value_min, signed char value);


void main(void)
{
	clock_setup();
	GPIO_setup();
	
	DS1307_init();
	
	LCD_init();
    LCD_clear_home();
	
	LCD_goto(0, 0);
	LCD_putstr("STM8 SW-I2C Test");

    while(1)
    {
		if((GPIO_ReadInputPin(Button_port, Button_pin) == FALSE) && (set == FALSE))
		{
			delay_ms(1000);
			if(GPIO_ReadInputPin(Button_port, Button_pin) == FALSE)
			{
				while(GPIO_ReadInputPin(Button_port, Button_pin) == FALSE);
				delay_ms(1000);
				
				menu = 0;
				set = TRUE;
			}
		}
		
		if(set)
		{
			setup_time();
		}
		else
		{
			get_time();
			display_time();
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
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
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
	GPIO_DeInit(GPIOB);
	GPIO_Init(Button_port, Button_pin, GPIO_MODE_IN_PU_NO_IT);
}


void show_value(unsigned char x_pos, unsigned char y_pos, unsigned char value)
{
	char ch[0x03] = {0x20, 0x20, '\0'};
   
   ch[0] = (((value / 10) % 10) + 0x30);
   ch[1] = ((value % 10) + 0x30);
   
   LCD_goto(x_pos, y_pos);
   LCD_putstr(ch);
}


void display_time(void)
{	
	show_value(4, 1, time.h);
	show_value(7, 1, time.m);
	show_value(10, 1, time.s);
	
	LCD_goto(6, 1);
	LCD_putchar(':');
	LCD_goto(9, 1);
	LCD_putchar(':');	
	delay_ms(100);
}


void setup_time(void)
{
	switch(menu)
	{
		case 0:
		{
			time.h = adjust(4, 1, 23, 0, time.h);
			break;
		}		
		case 1:
		{
			time.m = adjust(7, 1, 59, 0, time.m);
			break;
		}
		case 2:
		{
			time.s = adjust(10, 1, 59, 0, time.s);
			break;
		}
	}
}


unsigned char adjust(unsigned char x_pos, unsigned char y_pos, signed char value_max, signed char value_min, signed char value)
{
	if(GPIO_ReadInputPin(Button_port, Button_pin) == FALSE)
	{
		delay_ms(900);
		
		if(GPIO_ReadInputPin(Button_port, Button_pin) == FALSE)
		{
			while(GPIO_ReadInputPin(Button_port, Button_pin) == FALSE);
			menu++; 
			
			if(menu >= 3)
			{
				LCD_goto(3, 1);
				LCD_putchar(' ');
				LCD_goto(12, 1);
				LCD_putchar(' ');	
				set_time();
				set = FALSE;
				
				return;
			}
		}
	}
	
	else
	{
		value++;
		
		if(value > value_max)
		{
			value = value_min;
		}
	}
	
	LCD_goto(3, 1);
	LCD_putchar('<');
	LCD_goto(12, 1);
	LCD_putchar('>');	
	
	LCD_goto(x_pos, y_pos);
	LCD_putstr("  ");
	delay_ms(90);
	
	show_value(x_pos, y_pos, value);
	delay_ms(90);
	
	return value;
}