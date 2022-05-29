#include "SW_I2C.h"


void SW_I2C_init(void)
{
    SW_I2C_OUT();
    delay_ms(10);
    SDA_HIGH();
    SCL_HIGH();
}


void SW_I2C_start(void)
{
    SW_I2C_OUT();
    SDA_HIGH();
    SCL_HIGH();
    delay_us(40);
    SDA_LOW();
    delay_us(40);
    SCL_LOW();
}


void SW_I2C_stop(void)
{
    SW_I2C_OUT();
    SDA_LOW();
    SCL_LOW();
    delay_us(40);
    SDA_HIGH();
    SCL_HIGH();
    delay_us(40);
}


unsigned char SW_I2C_read(unsigned char ack)
{
    unsigned char i = 0x08;
    unsigned char j = 0x00;

    SW_I2C_IN();

    while(i > 0x00)
    {
        SCL_LOW();
        delay_us(20);
        SCL_HIGH();
        delay_us(20);
        j <<= 1;

        if(SDA_IN() != 0x00)
        {
            j++;
        }

        delay_us(10);
        i--;
    };

    switch(ack)
    {
        case I2C_ACK:
        {
            SW_I2C_ACK_NACK(I2C_ACK);;
            break;
        }
        default:
        {
            SW_I2C_ACK_NACK(I2C_NACK);;
            break;
        }
    }

    return j;
}


void SW_I2C_write(unsigned char value)
{
    unsigned char i = 0x08;

    SW_I2C_OUT();
    SCL_LOW();

    while(i > 0x00)
    {

        if(((value & 0x80) >> 0x07) != 0x00)
        {
            SDA_HIGH();
        }
        else
        {
            SDA_LOW();
        }


        value <<= 1;
        delay_us(20);
        SCL_HIGH();
        delay_us(20);
        SCL_LOW();
        delay_us(20);
        i--;
    };
}


void SW_I2C_ACK_NACK(unsigned char mode)
{
    SCL_LOW();
    SW_I2C_OUT();

    switch(mode)
    {
        case I2C_ACK:
        {
            SDA_LOW();
            break;
        }
        default:
        {
            SDA_HIGH();
            break;
        }
    }

    delay_us(20);
    SCL_HIGH();
    delay_us(20);
    SCL_LOW();
}


unsigned char SW_I2C_wait_ACK(void)
{
    signed int timeout = 0x0000;

    SW_I2C_IN();

    SDA_HIGH();
    delay_us(10);
    SCL_HIGH();
    delay_us(10);

    while(SDA_IN() != 0x00)
    {
        timeout++;

        if(timeout > I2C_timeout)
        {
            SW_I2C_stop();
            return 1;
        }
    };

    SCL_LOW();

    return 0x00;
}
