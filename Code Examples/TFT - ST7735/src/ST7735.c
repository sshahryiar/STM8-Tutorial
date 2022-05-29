#include "ST7735.h"


extern unsigned int width;
extern unsigned int length;


unsigned int Swap_Colour(unsigned int colour)
{
    return ((colour << 0x000B) | (colour & 0x07E0) | (colour >> 0x000B));
}


unsigned int Color565(unsigned char r, unsigned char g, unsigned char b)
{
    return (((r & 0xF8) << 0x08) | ((g & 0xFC) << 0x03) | (b >> 0x03));
}


void SPI_setup(void)
{
    SPI_DeInit();
	
    SPI_Init(SPI_FIRSTBIT_MSB, 
                  SPI_BAUDRATEPRESCALER_2,
                  SPI_MODE_MASTER, 
                  SPI_CLOCKPOLARITY_HIGH,
                  SPI_CLOCKPHASE_1EDGE, 
                  SPI_DATADIRECTION_1LINE_TX, 
                  SPI_NSS_SOFT, 
                  0x00);
				  
    SPI_Cmd(ENABLE);
}


void ST7735_HW_init(void)
{	
	GPIO_Init(SPI_PORT, ((GPIO_Pin_TypeDef)(SCK_pin | SDA_pin)), GPIO_MODE_OUT_PP_HIGH_FAST);
    GPIO_Init(CTL_PORT, ((GPIO_Pin_TypeDef)(CS_pin | RS_pin | RST_pin)), GPIO_MODE_OUT_PP_HIGH_FAST);
    SPI_setup();
    delay_ms(10);    
}


void ST7735_Write(unsigned char value, unsigned char mode)
{
    while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    GPIO_WriteLow(CTL_PORT, CS_pin);

	 switch(mode)
    {
        case CMD:
        {
            GPIO_WriteLow(CTL_PORT, RS_pin);
            break;
        }

        case DAT:
        {
            GPIO_WriteHigh(CTL_PORT, RS_pin);
            break;
        }
    }

    SPI_SendData(value);
    while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
    
    GPIO_WriteHigh(CTL_PORT, CS_pin);
}


void ST7735_Reset(void)
{
    GPIO_WriteLow(CTL_PORT, RST_pin);
    delay_ms(2);
    GPIO_WriteHigh(CTL_PORT, RST_pin);
    delay_ms(2);
}


void ST7735_init(void)
{
    ST7735_HW_init();
	ST7735_Reset();
    
    ST7735_Write(ST7735_SWRESET, CMD);
    delay_us(150);
    ST7735_Write(ST7735_SLPOUT, CMD);
    delay_us(150);

    ST7735_Write(ST7735_FRMCTR1, CMD);
    ST7735_Write(0x01, DAT);
    ST7735_Write(0x2C, DAT);
    ST7735_Write(0x2D, DAT);
    
    ST7735_Write(ST7735_FRMCTR2, CMD);
    ST7735_Write(0x01, DAT);
    ST7735_Write(0x2C, DAT);
    ST7735_Write(0x2D, DAT);
    
    ST7735_Write(ST7735_FRMCTR3, CMD);
    ST7735_Write(0x01, DAT);
    ST7735_Write(0x2C, DAT); 
    ST7735_Write(0x2D, DAT);
    ST7735_Write(0x01, DAT);
    ST7735_Write(0x2C, DAT);
    ST7735_Write(0x2D, DAT);

    ST7735_Write(ST7735_INVCTR, CMD);
    ST7735_Write(0x07, DAT);

    ST7735_Write(ST7735_PWCTR1, CMD);
    ST7735_Write(0xA2, DAT); 
    ST7735_Write(0x02, DAT); 
    ST7735_Write(0x84, DAT);

    ST7735_Write(ST7735_PWCTR1, CMD);
    ST7735_Write(0xC5, DAT);

    ST7735_Write(ST7735_PWCTR2, CMD);
    ST7735_Write(0x0A, DAT);
    ST7735_Write(0x00, DAT);

    ST7735_Write(ST7735_PWCTR3, CMD);
    ST7735_Write(0x8A, DAT);
    ST7735_Write(0x2A, DAT);

    ST7735_Write(ST7735_PWCTR4, CMD);
    ST7735_Write(0x8A, DAT);
    ST7735_Write(0xEE, DAT);

    ST7735_Write(ST7735_PWCTR5, CMD);
    ST7735_Write(0x0E, DAT);

    ST7735_Write(ST7735_VMCTR1, CMD);
    ST7735_Write(0x00, DAT);

    ST7735_Write(ST7735_COLMOD, CMD);
    ST7735_Write(0x05, DAT);

    ST7735_Write(ST7735_MADCTL, CMD);
    ST7735_Write(0xC8, DAT);
    
    ST7735_RAM_Address_Set();
    
    ST7735_Write(ST7735_GMCTRP1, CMD);
    ST7735_Write(0x02, DAT);
    ST7735_Write(0x1C, DAT);
    ST7735_Write(0x07, DAT);
    ST7735_Write(0x12, DAT);
    ST7735_Write(0x37, DAT);
    ST7735_Write(0x32, DAT);
    ST7735_Write(0x29, DAT);
    ST7735_Write(0x2D, DAT);
    ST7735_Write(0x29, DAT);
    ST7735_Write(0x25, DAT);
    ST7735_Write(0x2B, DAT);
    ST7735_Write(0x39, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(0x01, DAT);
    ST7735_Write(0x03, DAT);
    ST7735_Write(0x10, DAT);
    
    ST7735_Write(ST7735_GMCTRN1, CMD);
    ST7735_Write(0x03, DAT);
    ST7735_Write(0x1D, DAT);
    ST7735_Write(0x07, DAT);
    ST7735_Write(0x06, DAT);
    ST7735_Write(0x2E, DAT);
    ST7735_Write(0x2C, DAT);
    ST7735_Write(0x29, DAT);
    ST7735_Write(0x2D, DAT);
    ST7735_Write(0x2E, DAT);
    ST7735_Write(0x2E, DAT);
    ST7735_Write(0x37, DAT);
    ST7735_Write(0x3F, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(0x02, DAT);
    ST7735_Write(0x10, DAT);

    ST7735_Write(ST7735_NORON, CMD);
    delay_ms(10);

    ST7735_Write(ST7735_DISPON, CMD);
    delay_ms(100);
    
    ST7735_Write(ST7735_RAMWR, CMD);
    delay_ms(100);
}


void ST7735_Word_Write(unsigned int value)
{
    ST7735_Write(((value & 0xFF00) >> 0x08), DAT);
    ST7735_Write((value & 0x00FF), DAT);
}


void ST7735_Set_Addr_Window(signed int xs, signed int ys, signed int xe, signed int ye)
{
    ST7735_Write(ST7735_CASET, CMD);
    ST7735_Write(0x00, DAT);
    ST7735_Write(xs, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(xe, DAT);

    ST7735_Write(ST7735_RASET, CMD);
    ST7735_Write(0x00, DAT);
    ST7735_Write(ys, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(ye, DAT);

    ST7735_Write(ST7735_RAMWR, CMD);
}


void ST7735_RAM_Address_Set(void)
{
     ST7735_Set_Addr_Window(0x00, 0x00, 0x7F, 0x9F);
}


void ST7735_Invert_Display(unsigned char i)
{	 
	 ST7735_Write(i, CMD);
}


void ST7735_Set_Rotation(unsigned char m)
{
    unsigned char rotation = 0x00;

    ST7735_Write(ST7735_MADCTL, CMD);
    rotation = (m % 4);
    
    switch(rotation)
    {
        case 0:
        {
            ST7735_Write((MADCTL_MX | MADCTL_MY | MADCTL_RGB), DAT);
            width  = ST7735_TFTWIDTH;
            length = ST7735_TFTLENGTH;
            break;
        }
        case 1:
        {
            ST7735_Write((MADCTL_MY | MADCTL_MV | MADCTL_RGB), DAT);
            width  = ST7735_TFTLENGTH;
            length = ST7735_TFTWIDTH;
            break;
        }
        case 2:
        {
            ST7735_Write((MADCTL_RGB), DAT);
            width = ST7735_TFTWIDTH;
            length = ST7735_TFTLENGTH;
            break;
        }
        case 3:
        {
            ST7735_Write((MADCTL_MX | MADCTL_MV | MADCTL_RGB), DAT);
            width = ST7735_TFTLENGTH;
            length = ST7735_TFTWIDTH;
            break;
        }
    }
}


void TFT_fill(unsigned int colour)
{
    signed int i = 0x00;
    signed int j = 0x00;

    ST7735_Set_Addr_Window(0, 0, (width - 1), (length - 1));

    for(j = length; j > 0; j--)
    {
        for(i = width; i > 0; i--)
        {
            ST7735_Word_Write(colour);
        }
    }
}


void Draw_Pixel(signed int x_pos, signed int y_pos, unsigned int colour)
{
     ST7735_Set_Addr_Window(x_pos, y_pos, (1 + x_pos), (1 + y_pos));
     ST7735_Word_Write(colour);
}


void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned int colour)
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

    dx <<= 0x01;
    dy <<= 0x01;

    Draw_Pixel(x1, y1, colour);

    if (dx > dy)
    {
        fraction = (dy - (dx >> 1));
        while (x1 != x2)
        {
            if (fraction >= 0)
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


void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour)
{
     unsigned char i = 0x00;
     unsigned char xmin = 0x00;
     unsigned char xmax = 0x00;
     unsigned char ymin = 0x00;
     unsigned char ymax = 0x00;

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
         Draw_Pixel(x1, y1, back_colour);
         Draw_Pixel(x1, y2, back_colour);
         Draw_Pixel(x2, y1, back_colour);
         Draw_Pixel(x2, y2, back_colour);
     }
}


void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour)
{
   signed int a = 0x0000;
   signed int b = 0x0000;
   signed int p = 0x0000;

   b = radius;
   p = (1 - b);

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

        if(p < 0)
        {
            p += (0x03 + (0x02 * a++));
        }
        else
        {
            p += (0x05 + (0x02 * ((a++) - (b--))));
        }
    }while(a <= b);
}


void Draw_V_Line(signed int x1, signed int y1, signed int y2, unsigned colour)
{
    signed int pos = 0;
    signed int temp = 0;

    if(y1 > y2)
    {
       swap(&y1, &y2);
    }

    while(y2 > (y1 - 1))
    {
        Draw_Pixel(x1, y2, colour);
        y2--;
    }
}


void Draw_H_Line(signed int x1, signed int x2, signed int y1, unsigned colour)
{
    signed int pos = 0;
    signed int temp = 0;

    if(x1 > x2)
    {
       swap(&x1, &x2);
    }

    while(x2 > (x1 - 1))
    {
        Draw_Pixel(x2, y1, colour);
        x2--;
    }
}


void Draw_Triangle(signed int x1, signed int y1, signed int x2, signed int y2, signed int x3, signed int y3, unsigned char fill, unsigned int colour)
{
    signed int a = 0;
    signed int b = 0;
    signed int sa = 0;
    signed int sb = 0;
    signed int yp = 0;
    signed int last = 0;
    signed int dx12 = 0;
    signed int dx23 = 0;
    signed int dx13 = 0;
    signed int dy12 = 0;
    signed int dy23 = 0;
    signed int dy13 = 0;

    switch(fill)
    {
        case YES:
        {
            if(y1 > y2)
            {
                swap(&y1, &y2);
                swap(&x1, &x2);
            }
            if(y2 > y3)
            {
                swap(&y3, &y2);
                swap(&x3, &x2);
            }
            if(y1 > y2)
            {
                swap(&y1, &y2);
                swap(&x1, &x2);
            }

            if(y1 == y3)
            {
                a = b = x1;

                if(x2 < a)
                {
                    a = x2;
                }
                else if(x2 > b)
                {
                    b = x2;
                }
                if(x2 < a)
                {
                    a = x3;
                }
                else if(x3 > b)
                {
                    b = x3;
                }

                Draw_H_Line(a, (a + (b - (a + 1))), y1, colour);
                return;
            }

            dx12 = (x2 - x1);
            dy12 = (y2 - y1);
            dx13 = (x3 - x1);
            dy13 = (y3 - y1);
            dx23 = (x3 - x2);
            dy23 = (y3 - y2);
            sa = 0,
            sb = 0;

            if(y2 == y3)
            {
                last = y2;
            }
            else
            {
                last = (y2 - 1);
            }

            for(yp = y1; yp <= last; yp++)
            {
                a = (x1 + (sa / dy12));
                b = (x1 + (sb / dy13));
                sa += dx12;
                sb += dx13;
                if(a > b)
                {
                    swap(&a, &b);
                }
                Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
            }

            sa = (dx23 * (yp - y2));
            sb = (dx13 * (yp - y1));
            for(; yp <= y3; yp++)
            {
                a = (x2 + (sa / dy23));
                b = (x1 + (sb / dy13));
                sa += dx23;
                sb += dx13;

                if(a > b)
                {
                    swap(&a, &b);
                }
                Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
            }


            break;
        }
        default:
        {
            Draw_Line(x1, y1, x2, y2, colour);
            Draw_Line(x2, y2, x3, y3, colour);
            Draw_Line(x3, y3, x1, y1, colour);
            break;
        }
    }
}


void Draw_Font_Pixel(signed int x_pos, signed int y_pos, unsigned int colour, unsigned char pixel_size)
{
     unsigned char i = 0x00;

     ST7735_Set_Addr_Window(x_pos, y_pos, (x_pos + pixel_size - 1), (y_pos + pixel_size - 1));

     for(i = 0x00; i < (pixel_size * pixel_size); i++)
     {
         ST7735_Word_Write(colour);
     }
}


void print_char(signed int x_pos, signed int  y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch)
{
     unsigned char i = 0x00;
     unsigned char j = 0x00;

     char value = 0x00;

     if(font_size < 0)
     {
         font_size = 1;
     }

     if(x_pos < font_size)
     {
         x_pos = font_size;
     }

     for (i = 0x00; i < 0x05; i++)
     {
         for (j = 0x00; j < 0x08; j++)
         {
             value = 0x00;
             value = ((font[((unsigned char)ch) - 0x20][i]));

             if((value >> j)  & 0x01)
             {
                 Draw_Font_Pixel(x_pos, y_pos, colour, font_size);
             }
             else
             {
                 Draw_Font_Pixel(x_pos, y_pos, back_colour, font_size);
             }

             y_pos = y_pos + font_size;
          }
          y_pos -= (font_size << 0x03);
          x_pos += font_size;
      }
	  
      x_pos += font_size;
		
      if(x_pos > width)
      { 
          x_pos = (font_size + 0x01);
          y_pos += (font_size << 0x03);
      }
}


void print_str(signed int x_pos, signed int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch)
{
     do
     {
         print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
         x_pos += (font_size * 0x06);
     }while((*ch >= 0x20) && (*ch <= 0x7F) && (*ch != '\n'));
}


void print_C(signed int x_pos, signed int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
{
     char ch[4] = {0x20, 0x20, 0x20, 0x20};

     if(value < 0x00)
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
         ch[1] = (((value % 100) / 10) + 0x30);
         ch[2] = ((value % 10) + 0x30);
         ch[3] = 0x20;
     }
     else if((value >= 0) && (value <= 9))
     {
         ch[1] = ((value % 10) + 0x30);
         ch[2] = 0x20;
         ch[3] = 0x20;
     }

     print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
}


void print_I(signed int x_pos, signed int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
{
    char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};

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
        ch[1] = (((value % 10000) / 1000) + 0x30);
        ch[2] = (((value % 1000) / 100) + 0x30);
        ch[3] = (((value % 100) / 10) + 0x30);
        ch[4] = ((value % 10) + 0x30);
        ch[5] = 0x20;
    }
    else if((value > 99) && (value <= 999))
    {
        ch[1] = (((value % 1000) / 100) + 0x30);
        ch[2] = (((value % 100) / 10) + 0x30);
        ch[3] = ((value % 10) + 0x30);
        ch[4] = 0x20;
        ch[5] = 0x20;
    }
    else if((value > 9) && (value <= 99))
    {
        ch[1] = (((value % 100) / 10) + 0x30);
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

    print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
}


void print_D(signed int x_pos, signed int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned int value, unsigned char points)
{
    char ch[5] = {0x2E, 0x20, 0x20, 0x20, 0x20};

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

    print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
}


void print_F(signed int x_pos, signed int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points)
{
    signed long tmp = 0x0000;

    tmp = value;
    print_I(x_pos, y_pos, font_size, colour, back_colour, tmp);
    tmp = ((value - tmp) * 10000);

    if(tmp < 0)
    {
       tmp = -tmp;
    }

    if((value >= 9999) && (value < 99999))
    {
        print_D((x_pos + (0x24 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 999) && (value < 9999))
    {
        print_D((x_pos + (0x1E * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 99) && (value < 999))
    {
        print_D((x_pos + (0x18 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 9) && (value < 99))
    {
        print_D((x_pos + (0x12 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if(value < 9)
    {
        print_D((x_pos + (0x0C * font_size)), y_pos, font_size, colour, back_colour, tmp, points);

        if(value < 0)
        {
            print_char(x_pos, y_pos, font_size, colour, back_colour, 0x2D);
        }
        else
        {
            print_char(x_pos, y_pos, font_size, colour, back_colour, 0x20);
        }
    }
}