#include "lcd.h"


void SIPO(void)
{
    unsigned char bit = 0x00;
    unsigned char clk = 0x08;
    unsigned char temp = 0x00;
    
    temp = data_value;
    LCD_STB_LOW();
    
    while(clk > 0)
    {
        bit = ((temp & 0x80) >> 0x07);
        bit &= 0x01;

        switch(bit)
        {
            case 0:
            {
                LCD_SDI_LOW();
                break;
            }
            default:
            {
                LCD_SDI_HIGH();
                break;
            }
        }

        LCD_SCK_HIGH();

        temp <<= 0x01;
        clk--;

        LCD_SCK_LOW();
    };

    LCD_STB_HIGH();
}


void LCD_init(void)
{                                     
    unsigned char t = 0x00;
	
	GPIO_Init(LCD_PORT, 
					 ((GPIO_Pin_TypeDef)(LCD_STB_pin | LCD_SCK_pin | LCD_SDI_pin)), 
					 GPIO_MODE_OUT_PP_HIGH_FAST);

    data_value = 0x08;
    SIPO();
    delay_ms(10);   
    
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
    SIPO();
    delay_ms(dly);
    data_value &= 0xF7;
    SIPO();
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
	
    SIPO();
    LCD_4bit_send(value);
}  
    

void LCD_4bit_send(unsigned char lcd_data)       
{
    unsigned char temp = 0x00;
    
    temp = (lcd_data & 0xF0);
    data_value &= 0x0F;
    data_value |= temp;
    SIPO();
	LCD_toggle_EN();

    temp = (lcd_data & 0x0F);
    temp <<= 0x04;
    data_value &= 0x0F;
    data_value |= temp;
    SIPO();
    LCD_toggle_EN();
}  


void LCD_putstr(char *lcd_string)
{
    while(*lcd_string != '\0')  
    {
        LCD_putchar(*lcd_string++);
    }
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