#include "lcd.h"


void SPI_setup(void)
{
	SPI_DeInit();
	
	SPI_Init(SPI_FIRSTBIT_MSB, 
				  SPI_BAUDRATEPRESCALER_64, 
				  SPI_MODE_MASTER, 
				  SPI_CLOCKPOLARITY_LOW, 
				  SPI_CLOCKPHASE_1EDGE, 
				  SPI_DATADIRECTION_1LINE_TX, 
				  SPI_NSS_SOFT, 
				  0x00);
	
	SPI_Cmd(ENABLE);
}


void LCD_write(void)
{
    while(SPI_GetFlagStatus(SPI_FLAG_BSY));
	GPIO_WriteHigh(GPIOC, GPIO_PIN_4);
	SPI_SendData(data_value);
	GPIO_WriteLow(GPIOC, GPIO_PIN_4);
	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
}


void LCD_init(void)
{                                     
    unsigned char t = 0x00;
	
	GPIO_Init(GPIOC, 
					 ((GPIO_Pin_TypeDef)(GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6)), 
					 GPIO_MODE_OUT_PP_LOW_FAST);
	
	delay_ms(10);
	SPI_setup();
	delay_ms(100);
	
    data_value = 0x08;
    LCD_write();
    delay_ms(100);   
    
	LCD_send(0x33, CMD);
	LCD_send(0x32, CMD);

    LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);         
    LCD_send((display_on | cursor_off | blink_off), CMD);     
    LCD_send((clear_display), CMD);         
    LCD_send((cursor_direction_inc | display_no_shift), CMD);        
}   


void LCD_toggle_EN(void)
{
	data_value |= 0x08;
    LCD_write();
    delay_ms(dly);
    data_value &= 0xF7;
    LCD_write();
    delay_ms(dly);
}
   

void LCD_send(unsigned char value, unsigned char mode)
{                               
    switch(mode)
	{
		case DAT:
		{
			data_value |= 0x04;
			break;
		}
		default:
		{
			data_value &= 0xFB;
			break;
		}
	}
	
    LCD_write();
    LCD_4bit_send(value);
}  
    

void LCD_4bit_send(unsigned char lcd_data)       
{
    unsigned char temp = 0x00;
    
    temp = (lcd_data & 0xF0);
    data_value &= 0x0F;
    data_value |= temp;
    LCD_write();
	LCD_toggle_EN();

    temp = (lcd_data & 0x0F);
    temp <<= 0x04;
    data_value &= 0x0F;
    data_value |= temp;
    LCD_write();
    LCD_toggle_EN();
}  


void LCD_putstr(char *lcd_string)
{
   do
    {
        LCD_putchar(*lcd_string++);
    } while(*lcd_string != '\0');
}


void LCD_putchar(char char_data)
{
    if((char_data >= 0x20) && (char_data <= 0x7F))
	{
	    LCD_send(char_data, DAT);
	}
}


void LCD_clear_home(void)
{
    LCD_send(clear_display, CMD);
    LCD_send(goto_home, CMD);
}


void LCD_goto(unsigned char x_pos,unsigned char y_pos)
{                                                   
    if(y_pos == 0)    
    {                              
        LCD_send((0x80 | x_pos), CMD);
    }
    else 
    {                                              
        LCD_send((0x80 | 0x40 | x_pos), CMD); 
    }
}