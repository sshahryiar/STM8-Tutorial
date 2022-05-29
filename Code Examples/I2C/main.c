#include "STM8S.h"
#include "BH1750.h"
#include "lcd.h"


void clock_setup(void);
void GPIO_setup(void);
void I2C_setup(void);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void main()
{	
    unsigned int LX = 0x0000;
	unsigned int tmp = 0x0000;
	
	clock_setup();
	GPIO_setup();
	I2C_setup();
	LCD_init();  
	BH1750_init();
	
	LCD_clear_home(); 
	LCD_goto(0, 0);
	LCD_putstr("STM8 I2C");
	LCD_goto(0, 1);
	LCD_putstr("Lx");
	delay_ms(10);
	
	while(TRUE)
	{
		tmp = get_lux_value(cont_L_res_mode, 20);
        
        if(tmp > 10)
        {
            LX = tmp;
        }
        else
        {
            LX = get_lux_value(cont_H_res_mode1, 140);
        }
		
		lcd_print(3, 1, LX);
		
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
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
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
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
}

void I2C_setup(void)
{
	I2C_DeInit();
	I2C_Init(100000, 
				  BH1750_addr, 
				  I2C_DUTYCYCLE_2, 
				  I2C_ACK_CURR, 
				  I2C_ADDMODE_7BIT, 
				  (CLK_GetClockFreq() / 1000000));
	I2C_Cmd(ENABLE);
}



void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
{
	char tmp[5] = {0x20, 0x20, 0x20, 0x20, 0x20} ;

	tmp[0] = ((value / 10000) + 0x30);
    tmp[1] = (((value / 1000) % 10) + 0x30);
	tmp[2] = (((value / 100) % 10) + 0x30);
    tmp[3] = (((value / 10) % 10) + 0x30);
    tmp[4] = ((value % 10) + 0x30);
	
	LCD_goto(x_pos, y_pos);
	LCD_putstr(tmp);   
}



