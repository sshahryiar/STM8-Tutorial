#include "lcd.h"


void LCD_GPIO_init(void)
{
	GPIO_DeInit(LCD_PORT);
	GPIO_Init(LCD_PORT, LCD_RS, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(LCD_PORT, LCD_EN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(LCD_PORT, LCD_DB4, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(LCD_PORT, LCD_DB5, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(LCD_PORT, LCD_DB6, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(LCD_PORT, LCD_DB7, GPIO_MODE_OUT_PP_HIGH_FAST);
	delay_ms(10);    
}


void LCD_init(void)
{                                     
	LCD_GPIO_init();    
    toggle_EN_pin();
            
    GPIO_WriteLow(LCD_PORT, LCD_RS);            
    GPIO_WriteLow(LCD_PORT, LCD_DB7);   
    GPIO_WriteLow(LCD_PORT, LCD_DB6);   
    GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
    GPIO_WriteHigh(LCD_PORT, LCD_DB4);                      
	toggle_EN_pin();
             
    GPIO_WriteLow(LCD_PORT, LCD_DB7);   
    GPIO_WriteLow(LCD_PORT, LCD_DB6);   
    GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
    GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
    toggle_EN_pin();

    GPIO_WriteLow(LCD_PORT, LCD_DB7);   
    GPIO_WriteLow(LCD_PORT, LCD_DB6);   
    GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
    GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
    toggle_EN_pin();                  

    GPIO_WriteLow(LCD_PORT, LCD_DB7);   
    GPIO_WriteLow(LCD_PORT, LCD_DB6);   
    GPIO_WriteHigh(LCD_PORT, LCD_DB5);        
    GPIO_WriteLow(LCD_PORT, LCD_DB4);  
    toggle_EN_pin();

    LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);
    LCD_send((display_on | cursor_off | blink_off), CMD); 
    LCD_send(clear_display, CMD);         
    LCD_send((cursor_direction_inc | display_no_shift), CMD);
}   


void LCD_send(unsigned char value, unsigned char mode)
{                               
    switch(mode)
	{
		case DAT:
		{
			GPIO_WriteHigh(LCD_PORT, LCD_RS);   
			break;
		}
		case CMD:
		{
			GPIO_WriteLow(LCD_PORT, LCD_RS);   
			break;
		}
	}
	
    LCD_4bit_send(value);
}  
    

void LCD_4bit_send(unsigned char lcd_data)       
{
	toggle_io(lcd_data, 7, LCD_DB7);
	toggle_io(lcd_data, 6, LCD_DB6);
	toggle_io(lcd_data, 5, LCD_DB5);
	toggle_io(lcd_data, 4, LCD_DB4);
    toggle_EN_pin();
	toggle_io(lcd_data, 3, LCD_DB7);
	toggle_io(lcd_data, 2, LCD_DB6);
	toggle_io(lcd_data, 1, LCD_DB5);
	toggle_io(lcd_data, 0, LCD_DB4);
	toggle_EN_pin();
}  


void LCD_putstr(char *lcd_string)
{
    do
    {
        LCD_send(*lcd_string++, DAT);
    }while(*lcd_string != '\0');
}


void LCD_putchar(char char_data)
{
    LCD_send(char_data, DAT);
}


void LCD_clear_home(void)
{
    LCD_send(clear_display, CMD);
    LCD_send(goto_home, CMD);
}


void LCD_goto(unsigned char  x_pos, unsigned char  y_pos)
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


void toggle_EN_pin(void)
{
	GPIO_WriteHigh(LCD_PORT, LCD_EN);    
    delay_ms(1);
    GPIO_WriteLow(LCD_PORT,LCD_EN);   
}


void toggle_io(unsigned char lcd_data, unsigned char bit_pos, unsigned char pin_num)
{
	bool temp = FALSE;
    
    temp = (0x01 & (lcd_data >> bit_pos));
	
	switch(temp)
	{
		case TRUE:
		{
			GPIO_WriteHigh(LCD_PORT, pin_num);   
			break;
		}
		default:
		{
			GPIO_WriteLow(LCD_PORT, pin_num);   
			break;
		}
	}
}
