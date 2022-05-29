#include "stm8s.h" 

#define clear_display                                0x01
#define goto_home                               	0x02
         
#define cursor_direction_inc                    (0x04 | 0x02)
#define cursor_direction_dec                   (0x04 | 0x00)
#define display_shift                           		 (0x04 | 0x01)
#define display_no_shift                        	 (0x04 | 0x00)

#define display_on                              		 (0x08 | 0x04)
#define display_off                             		 (0x08 | 0x02)
#define cursor_on                               		 (0x08 | 0x02)
#define cursor_off                              		 (0x08 | 0x00)
#define blink_on                               		 (0x08 | 0x01)
#define blink_off                               		 (0x08 | 0x00)
                                    
#define _8_pin_interface                        	(0x20 | 0x10)
#define _4_pin_interface                        	(0x20 | 0x00)
#define _2_row_display                          	(0x20 | 0x08)
#define _1_row_display                          	(0x20 | 0x00)
#define _5x10_dots                              		(0x20 | 0x40)
#define _5x7_dots                               		(0x20 | 0x00)
                                   
#define dly                                     			1

#define DAT												1
#define CMD											    0


extern unsigned char data_value;

void SPI_setup(void);
void LCD_write(void);
void LCD_init(void);
void LCD_toggle_EN(void);
void LCD_send(unsigned char value, unsigned char mode); 
void LCD_4bit_send(unsigned char lcd_data);            
void LCD_putstr(char *lcd_string);
void LCD_putchar(char char_data);
void LCD_clear_home(void);
void LCD_goto(unsigned char x_pos, unsigned char y_pos);
