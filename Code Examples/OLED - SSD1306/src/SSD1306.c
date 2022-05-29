#include "fonts.h"
#include "SSD1306.h"


void I2C_setup(void)
{
    I2C_DeInit();

    I2C_Init(100000, 
             SSD1306_I2C_Address, 
             I2C_DUTYCYCLE_2, 
             I2C_ACK_CURR, 
             I2C_ADDMODE_7BIT, 
             (CLK_GetClockFreq() / 1000000));

    I2C_Cmd(ENABLE);
}


void OLED_HW_setup(void)
{
	GPIO_Init(I2C_PORT, SCL_pin, GPIO_MODE_OUT_OD_HIZ_FAST);
	GPIO_Init(I2C_PORT, SDA_pin, GPIO_MODE_OUT_OD_HIZ_FAST);
	
    I2C_setup();
}


void OLED_init(void)
{
     OLED_HW_setup();
     delay_ms(100);
     
     OLED_write((Set_Display_ON_or_OFF_CMD | Display_OFF), CMD);
     OLED_write(Set_Multiplex_Ratio_CMD, CMD);
     OLED_write(0x3F, CMD);
     OLED_write(Set_Display_Offset_CMD, CMD);
     OLED_write(0x00, CMD);
     OLED_write(Set_Display_Start_Line_CMD, CMD);
     OLED_write((Set_Segment_Remap_CMD | Column_Address_0_Mapped_to_SEG127), CMD);
     OLED_write((Set_COM_Output_Scan_Direction_CMD | Scan_from_COM63_to_0), CMD);
     OLED_write(Set_Common_HW_Config_CMD, CMD);
     OLED_write(0x12, CMD);
     OLED_write(Set_Contrast_Control_CMD, CMD);
     OLED_write(0xFF, CMD);
     OLED_write(Set_Entire_Display_ON_CMD, CMD);
     OLED_write(Set_Normal_or_Inverse_Display_CMD, CMD);
     OLED_write(Set_Display_Clock_CMD, CMD);
     OLED_write(0x80, CMD);
     OLED_write(Set_Pre_charge_Period_CMD, CMD);
     OLED_write(0x25, CMD);
     OLED_write(Set_VCOMH_Level_CMD, CMD);
     OLED_write(0x20, CMD);
     OLED_write(Set_Page_Address_CMD, CMD);
     OLED_write(0x00, CMD);
     OLED_write(0x07, CMD);
     OLED_write(Set_Page_Start_Address_CMD , CMD);
     OLED_write(Set_Higher_Column_Start_Address_CMD, CMD);
     OLED_write(Set_Lower_Column_Start_Address_CMD, CMD);
     OLED_write(Set_Memory_Addressing_Mode_CMD, CMD);
     OLED_write(0x02, CMD);
     OLED_write(Set_Charge_Pump_CMD, CMD);
     OLED_write(0x14, CMD);
     OLED_write((Set_Display_ON_or_OFF_CMD | Display_ON), CMD);
}


void OLED_write(unsigned char value, unsigned char control_byte)
{
    while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));
	
	I2C_GenerateSTART(ENABLE);
    while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
   
    I2C_Send7bitAddress(SSD1306_I2C_Address, I2C_DIRECTION_TX); 
    while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
   
    I2C_SendData(control_byte);
    while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING));
	
    I2C_SendData(value);
    while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

    I2C_GenerateSTOP(ENABLE);  
}


void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos)
{
     OLED_write((Set_Page_Start_Address_CMD + y_pos), CMD);
     OLED_write(((x_pos & 0x0F) | Set_Lower_Column_Start_Address_CMD), CMD);
     OLED_write((((x_pos & 0xF0) >> 0x04) | Set_Higher_Column_Start_Address_CMD), CMD);
}


void OLED_fill(unsigned char bmp_data)
{
    unsigned char x_pos = 0x00;
    unsigned char page = 0x00;

    for(page = 0; page < y_max; page++)
    {
        OLED_gotoxy(x_min, page);
        
        I2C_GenerateSTART(ENABLE);
        while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
       
        I2C_Send7bitAddress(SSD1306_I2C_Address, I2C_DIRECTION_TX); 
        while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
       
        I2C_SendData(DAT);
        while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING));    

        for(x_pos = x_min; x_pos < x_max; x_pos++)
        {
           I2C_SendData(bmp_data);
		   while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));  
        }
		
        I2C_GenerateSTOP(ENABLE);  
    }
}


void OLED_print_Image(const unsigned char *bmp, unsigned char pixel)
{
    unsigned char x_pos = 0;
    unsigned char page = 0;
   
    if(pixel != OFF)
    {
        pixel = 0xFF;
    }
    else
    {
        pixel = 0x00;
    }
   
    for(page = 0; page < y_max; page++)
    {
         OLED_gotoxy(x_min, page);

         I2C_GenerateSTART(ENABLE);
         while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
       
         I2C_Send7bitAddress(SSD1306_I2C_Address, I2C_DIRECTION_TX); 
         while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
       
         I2C_SendData(DAT);
         while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING));    

         for(x_pos = x_min; x_pos < x_max; x_pos++)
         {
            I2C_SendData((*bmp++ ^ pixel));
            while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
         }

		 I2C_GenerateSTOP(ENABLE); 
     }
}


void OLED_clear_screen(void)
{
    OLED_fill(0x00);
}


void OLED_clear_buffer(void)
{
     unsigned int s = 0x0000;

     for(s = 0; s < buffer_size; s++)
     {
          buffer[s] = 0x00;
     }
}


void OLED_cursor(unsigned char x_pos, unsigned char y_pos)
{
    unsigned char s = 0x00;

    if(y_pos != 0x00)
    {
        if(x_pos == 1)
        {
            OLED_gotoxy(0x00, (y_pos + 0x02));
        }
        else
        {
            OLED_gotoxy((0x50 + ((x_pos - 0x02) * 0x06)), (y_pos + 0x02));
        }

        for(s = 0x00; s < 0x06; s++)
        {
            OLED_write(0xFF, DAT);
        }
    }
}


void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, unsigned char *bmp_img)
{
    unsigned int s = 0x0000;
    unsigned char x_pos = 0x00;
    unsigned char y_pos = 0x00;

    for(y_pos = yb; y_pos <= ye; y_pos++)
    {
        OLED_gotoxy(xb, y_pos);
        for(x_pos = xb; x_pos < xe; x_pos++)
        {
            OLED_write(bmp_img[s++], DAT);
        }
    }
}


void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch)
{
  unsigned char s = 0x00;
  unsigned char chr = 0x00;
    
  chr = (ch - 0x20);
  
  if(x_pos > (x_max - 0x06))
  {
    x_pos = 0x00;
    y_pos++;
  }
  OLED_gotoxy(x_pos, y_pos);
  
  for(s = 0x00; s < 0x06; s++)
  {
    OLED_write(font_regular[chr][s], DAT);
  }
}


void OLED_print_string(unsigned char x_pos, unsigned char y_pos, char *ch)
{
  do
  {
    OLED_print_char(x_pos, y_pos, *ch++);
    x_pos += 0x06;
  }while((*ch >= 0x20) && (*ch <= 0x7F) && (*ch != '\n'));
}


void OLED_print_chr(unsigned char x_pos, unsigned char y_pos, signed int value)
{
   char ch[5] = {0x20, 0x20, 0x20, 0x20, '\n'};
  
  if(value < 0)
  {
    ch[0] = 0x2D;
    value = -value;
  }
  else
  {
    ch[0] = 0x20;
  }
  
  if((value > 99) && (value <= 999))
  {
     ch[1] = ((value / 100) + 0x30);
     ch[2] = (((value % 100) / 10) + 0x30);
     ch[3] = ((value % 10) + 0x30);
  }
  else if((value > 9) && (value <= 99))
  {
     ch[1] = ((value / 10) + 0x30);
     ch[2] = ((value % 10) + 0x30);
     ch[3] = 0x20;
  }
  else if((value >= 0) && (value <= 9))
  {
     ch[1] = ((value % 10) + 0x30);
     ch[2] = 0x20;
     ch[3] = 0x20;
  }

  OLED_print_string(x_pos, y_pos, ch);
}


void OLED_print_int(unsigned char x_pos, unsigned char y_pos, signed long value)
{
   char ch[7] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20, '\n'};
    
  if(value < 0)
  {
    ch[0] = 0x2D;
    value = -value;
  }
  else
  {
    ch[0] = 0x20;
  }
  
  if(value > 9999)
  {
    ch[1] = ((value / 10000) + 0x30);  
    ch[2] = (((value % 10000) / 1000) + 0x30);  
    ch[3] = (((value % 1000) / 100) + 0x30);  
    ch[4] = (((value % 100) / 10) + 0x30);  
    ch[5] = ((value % 10) + 0x30);
  }
  
  else if((value > 999) && (value <= 9999))
  {
    ch[1] = ((value / 1000) + 0x30);  
    ch[2] = (((value % 1000) / 100) + 0x30);  
    ch[3] = (((value % 100) / 10) + 0x30);  
    ch[4] = ((value % 10) + 0x30);
    ch[5] = 0x20;
  }
  else if((value > 99) && (value <= 999))
  {
    ch[1] = ((value / 100) + 0x30);  
    ch[2] = (((value % 100) / 10) + 0x30);  
    ch[3] = ((value % 10) + 0x30);
    ch[4] = 0x20;
    ch[5] = 0x20;
  }
  else if((value > 9) && (value <= 99))
  {
    ch[1] = ((value / 10) + 0x30);  
    ch[2] = ((value % 10) + 0x30);
    ch[3] = 0x20;
    ch[4] = 0x20;
    ch[5] = 0x20;
  }
  else
  {
    ch[1] = ((value % 10) + 0x30);
    ch[2] = 0x20;
    ch[3] = 0x20;
    ch[4] = 0x20;
    ch[5] = 0x20;
  }

  OLED_print_string(x_pos, y_pos, ch);
}


void OLED_print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points)
{
   char ch[6] = {0x2E, 0x20, 0x20, 0x20, 0x20, '\n'};
    
  ch[1] = ((value / 1000) + 0x30);
  
  if(points > 1)
  {
    ch[2] = (((value % 1000) / 100) + 0x30);
  
    if(points > 2)
    {
      ch[3] = (((value % 100) / 10) + 0x30);
      
      if(points > 3)
      {
        ch[4] = ((value % 10) + 0x30);
      }
    }
  }

  OLED_print_string(x_pos, y_pos, ch);
}


void OLED_print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points)
{
  signed long tmp = 0;
  
  tmp = value;
  OLED_print_int(x_pos, y_pos, tmp);
  tmp = ((value - tmp) * 10000);
  
  if(tmp < 0)
  {
    tmp = -tmp;
  }
  
  if((value >= 10000) && (value < 100000))
  {
    OLED_print_decimal((x_pos + 36), y_pos, tmp, points);
  }
  else if((value >= 1000) && (value < 10000))
  {
    OLED_print_decimal((x_pos + 30), y_pos, tmp, points);
  }
  else if((value >= 100) && (value < 1000))
  {
    OLED_print_decimal((x_pos + 24), y_pos, tmp, points);
  }
  else if((value >= 10) && (value < 100))
  {
    OLED_print_decimal((x_pos + 18), y_pos, tmp, points);
  }
  else if(value < 10)
  {
    OLED_print_decimal((x_pos + 12), y_pos, tmp, points);
    
    if(value < 0)
    {
        OLED_print_char(x_pos, y_pos, 0x2D);
    }
    else
    {
        OLED_print_char(x_pos, y_pos, 0x20);
    }
  }
}


void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
{
    unsigned char value = 0x00;
    unsigned char page = 0x00;
    unsigned char bit_pos = 0x00;

    page = (y_pos / y_max);
    bit_pos = (y_pos - (page * y_max));
    value = buffer[((page * x_max) + x_pos)];

    if((colour & YES) != NO)
    {
        value |= (1 << bit_pos);
    }
    else
    {
        value &= (~(1 << bit_pos));
    }

    buffer[((page * x_max) + x_pos)] = value;
    OLED_gotoxy(x_pos, page);
    OLED_write(value, DAT);
}


void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
{
    signed int dx = 0x0000;
    signed int dy = 0x0000;
    signed int stepx = 0x0000;
    signed int stepy = 0x0000;
    signed int fraction = 0x0000;

    dy = (y2 - y1);
    dx = (x2 - x1);

    if (dy < 0)
    {
        dy = -dy;
        stepy = -1;
    }
    else
    {
        stepy = 1;
    }

    if (dx < 0)
    {
        dx = -dx;
        stepx = -1;
    }
    else
    {
        stepx = 1;
    }

    dx <<= 1;
    dy <<= 1;

    Draw_Pixel(x1, y1, colour);

    if(dx > dy)
    {
        fraction = (dy - (dx >> 1));
        while (x1 != x2)
        {
            if(fraction >= 0)
            {
                y1 += stepy;
                fraction -= dx;
            }

            x1 += stepx;
            fraction += dy;

            Draw_Pixel(x1, y1, colour);
        }
    }
    else
    {
        fraction = (dx - (dy >> 1));
        while (y1 != y2)
        {
            if (fraction >= 0)
            {
                x1 += stepx;
                fraction -= dy;
            }

            y1 += stepy;
            fraction += dx;

            Draw_Pixel(x1, y1, colour);
        }
    }
}


void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type)
{
     unsigned short i = 0x00;
     unsigned short xmin = 0x00;
     unsigned short xmax = 0x00;
     unsigned short ymin = 0x00;
     unsigned short ymax = 0x00;

     if(fill != NO)
     {
        if(x1 < x2)
        {
           xmin = x1;
           xmax = x2;
        }
        else
        {
           xmin = x2;
           xmax = x1;
        }

        if(y1 < y2)
        {
           ymin = y1;
           ymax = y2;
        }
        else
        {
           ymin = y2;
           ymax = y1;
        }

        for(; xmin <= xmax; ++xmin)
        {
           for(i = ymin; i <= ymax; ++i)
           {
               Draw_Pixel(xmin, i, colour);
           }
         }
     }

     else
     {
        Draw_Line(x1, y1, x2, y1, colour);
        Draw_Line(x1, y2, x2, y2, colour);
        Draw_Line(x1, y1, x1, y2, colour);
        Draw_Line(x2, y1, x2, y2, colour);
     }

     if(type != SQUARE)
     {
         Draw_Pixel(x1, y1, ~colour);
         Draw_Pixel(x1, y2, ~colour);
         Draw_Pixel(x2, y1, ~colour);
         Draw_Pixel(x2, y2, ~colour);
     }
}


void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
{
   signed int a = 0x0000;
   signed int b = 0x0000;
   signed int P = 0x0000;

   b = radius;
   P = (1 - b);

   do
   {
        if(fill != NO)
        {
           Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
           Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
           Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
           Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
        }
        else
        {
           Draw_Pixel((xc + a), (yc + b), colour);
           Draw_Pixel((xc + b), (yc + a), colour);
           Draw_Pixel((xc - a), (yc + b), colour);
           Draw_Pixel((xc - b), (yc + a), colour);
           Draw_Pixel((xc + b), (yc - a), colour);
           Draw_Pixel((xc + a), (yc - b), colour);
           Draw_Pixel((xc - a), (yc - b), colour);
           Draw_Pixel((xc - b), (yc - a), colour);
        }

        if(P < 0)
        {
           P += (3 + (2 * a++));
        }
        else
        {
           P += (5 + (2 * ((a++) - (b--))));
        }
    }while(a <= b);
}
