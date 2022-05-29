#include "PCD8544.h"


extern unsigned char PCD8544_buffer[X_max][Rows];


void setup_GLCD_GPIOs(void)
{
     GPIO_Init(PCD8544_port_1, 
               ((GPIO_Pin_TypeDef)(BL_pin | RST_pin | MOSI_pin | SCK_pin)), 
                GPIO_MODE_OUT_PP_HIGH_FAST);

     GPIO_Init(PCD8544_port_2, 
               ((GPIO_Pin_TypeDef)(DC_pin | CE_pin)), 
                GPIO_MODE_OUT_PP_HIGH_FAST);

     delay_ms(10);
}


void PCD8544_write(bool mode, unsigned char value)
{
    unsigned char s = 0x08;

    switch(mode)
    {
        case DAT:
        {
            DC_OUT_HIGH();
            break;
        }

        default:
        {
            DC_OUT_LOW();
            break;
        }
    }

    CE_OUT_LOW();

    while(s > 0)
    {
        SCK_OUT_LOW();
         
        if((value & 0x80) == 0)
        {
             MOSI_OUT_LOW();
        }
        else
        {
            MOSI_OUT_HIGH();
        }
         
        value <<= 1;
        SCK_OUT_HIGH();
        s--;
    };

    CE_OUT_HIGH();
}


void PCD8544_reset(void)
{
    RST_OUT_LOW();
    delay_us(100);
    RST_OUT_HIGH();
}


void PCD8544_init(void)
{
    setup_GLCD_GPIOs();
    PCD8544_reset();
    PCD8544_write(CMD, (PCD8544_extended_instruction | PCD8544_function_set));
    PCD8544_write(CMD, (PCD8544_set_bias | 0x02));
    PCD8544_set_contrast(0x39);
    PCD8544_write(CMD, PCD8544_set_temp);
    PCD8544_write(CMD, (PCD8544_display_normal | PCD8544_display_control));
    PCD8544_write(CMD, PCD8544_function_set);
    PCD8544_write(CMD, PCD8544_display_all_on);
    PCD8544_write(CMD, PCD8544_display_normal);
    PCD8544_clear_buffer(OFF);
}


void PCD8544_backlight_state(bool mode)
{
    switch(mode)
    {
        case ON:
        {
            BL_OUT_LOW();
            break;
        }

        default:
        {
            BL_OUT_HIGH();
            break;
        }
    }
}


void PCD8544_set_contrast(unsigned char value) 
{
    PCD8544_write(CMD, (PCD8544_extended_instruction | PCD8544_function_set));
    PCD8544_write(CMD, (PCD8544_set_VOP | (value & 0x7F)));
    PCD8544_write(CMD, PCD8544_function_set);
}


void PCD8544_set_cursor(unsigned char x_pos, unsigned char y_pos)
{
    PCD8544_write(CMD, (PCD8544_set_X_addr | x_pos));
    PCD8544_write(CMD, (PCD8544_set_Y_addr | y_pos));
}


void PCD8544_print_char(unsigned char ch, unsigned char colour)
{
    unsigned char s = 0;
    unsigned char chr = 0;

    for(s = 0; s <= 4; s++)
    {
       chr = font[(ch - 0x20)][s];
       if(colour == BLACK)
       {
           chr = ~chr;
       }
       PCD8544_write(DAT, chr);
    }
}


void PCD8544_print_custom_char(unsigned char *map)
{
    unsigned char s = 0;

    for(s = 0; s <= 4; s++)
    {
        PCD8544_write(DAT, *map++);
    }
}


void PCD8544_fill(unsigned char bufr)
{
    unsigned int s = 0;

    PCD8544_set_cursor(0, 0);

    for(s = 0; s < buffer_size; s++)
    {
        PCD8544_write(DAT, bufr);
    }
}


void PCD8544_clear_buffer(unsigned char colour)
{
    unsigned char x_pos = 0;
    unsigned char y_pos = 0;
    
    for(x_pos; x_pos < X_max; x_pos++)
    {
        for(y_pos; y_pos < Rows; y_pos++)
        {
            PCD8544_buffer[x_pos][y_pos] = colour;
        }
    }
}


void PCD8544_clear_screen(unsigned char colour)
{
    unsigned char x_pos = 0;
    unsigned char y_pos = 0;
    
    for(y_pos = 0; y_pos < Rows; y_pos++)
    {
        for(x_pos = 0; x_pos < X_max; x_pos++)
        {
            PCD8544_print_string(x_pos, y_pos, " ", colour);
        }
    }
}


void PCD8544_print_image(const unsigned char *bmp)
{
    unsigned int s = 0;
    
    PCD8544_set_cursor(0, 0);
    
    for(s = 0; s < buffer_size; s++)
    {
        PCD8544_write(DAT, bmp[s]);
    }
}


void PCD8544_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch, unsigned char colour)
{
    PCD8544_set_cursor(x_pos, y_pos);

    do
    {
       PCD8544_print_char(*ch++, colour);
    }while((*ch >= 0x20) && (*ch <= 0x7F) && (*ch != '\0'));
}


void print_chr(unsigned char x_pos, unsigned char y_pos, signed int value, unsigned char colour)
{
    unsigned char ch = 0x00;

    if(value < 0)
    {
        PCD8544_set_cursor(x_pos, y_pos);
        PCD8544_print_char(0x2D, colour);
        value = -value;
    }
    else
    {
        PCD8544_set_cursor(x_pos, y_pos);
        PCD8544_print_char(0x20, colour);
    }

     if((value > 99) && (value <= 999))
     {
         ch = (value / 100);
         PCD8544_set_cursor((x_pos + 6), y_pos);
         PCD8544_print_char((48 + ch), colour);
         
         ch = ((value % 100) / 10);
         PCD8544_set_cursor((x_pos + 12), y_pos);
         PCD8544_print_char((48 + ch), colour);

         ch = (value % 10);
         PCD8544_set_cursor((x_pos + 18), y_pos);
         PCD8544_print_char((48 + ch), colour);
     }
     else if((value > 9) && (value <= 99))
     {
         ch = ((value % 100) / 10);
         PCD8544_set_cursor((x_pos + 6), y_pos);
         PCD8544_print_char((48 + ch), colour);
         
         ch = (value % 10);
         PCD8544_set_cursor((x_pos + 12), y_pos);
         PCD8544_print_char((48 + ch), colour);

         PCD8544_set_cursor((x_pos + 18), y_pos);
         PCD8544_print_char(0x20, colour);
     }
     else if((value >= 0) && (value <= 9))
     {
         ch = (value % 10);
         PCD8544_set_cursor((x_pos + 6), y_pos);
         PCD8544_print_char((48 + ch), colour);
         
         PCD8544_set_cursor((x_pos + 12), y_pos);
         PCD8544_print_char(0x20, colour);
         
         PCD8544_set_cursor((x_pos + 18), y_pos);
         PCD8544_print_char(0x20, colour);
     }
}


void print_int(unsigned char x_pos, unsigned char y_pos, signed long value, unsigned char colour)
{
    unsigned char ch = 0x00;

    if(value < 0)
    {
        PCD8544_set_cursor(x_pos, y_pos);
        PCD8544_print_char(0x2D, colour);
        value = -value;
    }
    else
    {
        PCD8544_set_cursor(x_pos, y_pos);
        PCD8544_print_char(0x20, colour);
    }

    if(value > 9999)
    {
        ch = (value / 10000);
        PCD8544_set_cursor((x_pos + 6), y_pos);
        PCD8544_print_char((48 + ch), colour);

        ch = ((value % 10000)/ 1000);
        PCD8544_set_cursor((x_pos + 12), y_pos);
        PCD8544_print_char((48 + ch), colour);

        ch = ((value % 1000) / 100);
        PCD8544_set_cursor((x_pos + 18), y_pos);
        PCD8544_print_char((48 + ch), colour);

        ch = ((value % 100) / 10);
        PCD8544_set_cursor((x_pos + 24), y_pos);
        PCD8544_print_char((48 + ch), colour);

        ch = (value % 10);
        PCD8544_set_cursor((x_pos + 30), y_pos);
        PCD8544_print_char((48 + ch), colour);
    }

    else if((value > 999) && (value <= 9999))
    {
        ch = ((value % 10000)/ 1000);
        PCD8544_set_cursor((x_pos + 6), y_pos);
        PCD8544_print_char((48 + ch), colour);

        ch = ((value % 1000) / 100);
        PCD8544_set_cursor((x_pos + 12), y_pos);
        PCD8544_print_char((48 + ch), colour);

        ch = ((value % 100) / 10);
        PCD8544_set_cursor((x_pos + 18), y_pos);
        PCD8544_print_char((48 + ch), colour);

        ch = (value % 10);
        PCD8544_set_cursor((x_pos + 24), y_pos);
        PCD8544_print_char((48 + ch), colour);

        PCD8544_set_cursor((x_pos + 30), y_pos);
        PCD8544_print_char(0x20, colour);
    }
    else if((value > 99) && (value <= 999))
    {
        ch = ((value % 1000) / 100);
        PCD8544_set_cursor((x_pos + 6), y_pos);
        PCD8544_print_char((48 + ch), colour);

        ch = ((value % 100) / 10);
        PCD8544_set_cursor((x_pos + 12), y_pos);
        PCD8544_print_char((48 + ch), colour);

        ch = (value % 10);
        PCD8544_set_cursor((x_pos + 18), y_pos);
        PCD8544_print_char((48 + ch), colour);
        
        PCD8544_set_cursor((x_pos + 24), y_pos);
        PCD8544_print_char(0x20, colour);

        PCD8544_set_cursor((x_pos + 30), y_pos);
        PCD8544_print_char(0x20, colour);
    }
    else if((value > 9) && (value <= 99))
    {
        ch = ((value % 100) / 10);
        PCD8544_set_cursor((x_pos + 6), y_pos);
        PCD8544_print_char((48 + ch), colour);

        ch = (value % 10);
        PCD8544_set_cursor((x_pos + 12), y_pos);
        PCD8544_print_char((48 + ch), colour);

        PCD8544_set_cursor((x_pos + 18), y_pos);
        PCD8544_print_char(0x20, colour);
        
        PCD8544_set_cursor((x_pos + 24), y_pos);
        PCD8544_print_char(0x20, colour);
        
        PCD8544_set_cursor((x_pos + 30), y_pos);
        PCD8544_print_char(0x20, colour);
    }
    else
    {
        ch = (value % 10);
        PCD8544_set_cursor((x_pos + 6), y_pos);
        PCD8544_print_char((48 + ch), colour);
        
        PCD8544_set_cursor((x_pos + 12), y_pos);
        PCD8544_print_char(0x20, colour);
        
        PCD8544_set_cursor((x_pos + 18), y_pos);
        PCD8544_print_char(0x20, colour);
        
        PCD8544_set_cursor((x_pos + 24), y_pos);
        PCD8544_print_char(0x20, colour);
        
        PCD8544_set_cursor((x_pos + 30), y_pos);
        PCD8544_print_char(0x20, colour);
    }
}


void print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points, unsigned char colour)
{
    unsigned char ch = 0x00;

    PCD8544_set_cursor(x_pos, y_pos);
    PCD8544_print_char(0x2E, colour);

    ch = (value / 1000);
    PCD8544_set_cursor((x_pos + 6), y_pos);
    PCD8544_print_char((48 + ch), colour);

    if(points > 1)
    {
        ch = ((value % 1000) / 100);
        PCD8544_set_cursor((x_pos + 12), y_pos);
        PCD8544_print_char((48 + ch), colour);


        if(points > 2)
        {
            ch = ((value % 100) / 10);
            PCD8544_set_cursor((x_pos + 18), y_pos);
            PCD8544_print_char((48 + ch), colour);

            if(points > 3)
            {
                ch = (value % 10);
                PCD8544_set_cursor((x_pos + 24), y_pos);
                PCD8544_print_char((48 + ch), colour);;
            }
        }
    }
}


void print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points, unsigned char colour)
{
    signed long tmp = 0x00;

    tmp = ((signed long)value);
    print_int(x_pos, y_pos, tmp, colour);
    tmp = ((value - tmp) * 10000);

    if(tmp < 0)
    {
       tmp = -tmp;
    }

    if((value >= 10000) && (value < 100000))
    {
        print_decimal((x_pos + 36), y_pos, tmp, points, colour);
    }
    else if((value >= 1000) && (value < 10000))
    {
        print_decimal((x_pos + 30), y_pos, tmp, points, colour);
    }
    else if((value >= 100) && (value < 1000))
    {
        print_decimal((x_pos + 24), y_pos, tmp, points, colour);
    }
    else if((value >= 10) && (value < 100))
    {
        print_decimal((x_pos + 18), y_pos, tmp, points, colour);
    }
    else if(value < 10)
    {
        print_decimal((x_pos + 12), y_pos, tmp, points, colour);
        if(value < 0)
        {
            PCD8544_set_cursor(x_pos, y_pos);
            PCD8544_print_char(0x2D, colour);
        }
        else
        {
            PCD8544_set_cursor(x_pos, y_pos);
            PCD8544_print_char(0x20, colour);
        }
    }
}


void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
{
    unsigned char row = 0;
    unsigned char value = 0;

    if((x_pos < 0) || (x_pos >= X_max) || (y_pos < 0) || (y_pos >= Y_max))
    {
        return;
    }

    row = (y_pos >> 3);

    value = PCD8544_buffer[x_pos][row];
    
    if(colour == BLACK)
    {
        value |= (1 << (y_pos % 8));
    } 
    else if(colour == WHITE)
    {
        value &= (~(1 << (y_pos % 8)));
    }
    else if(colour == PIXEL_XOR)
    {
        value ^= (1 << (y_pos % 8));
    } 

    PCD8544_buffer[x_pos][row] = value;

    PCD8544_set_cursor(x_pos, row);
    PCD8544_write(DAT, value);
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


void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour)
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
}


void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
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