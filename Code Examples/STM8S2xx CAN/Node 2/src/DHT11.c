#include "DHT11.h"


void DHT11_init(void)
{
   DHT11_INPUT();
   delay_ms(1000);
}


unsigned char get_byte(void)
{
   unsigned char s = 0x08;
   unsigned char value = 0x00;
   
   DHT11_INPUT();

   while(s > 0)
   {
      value <<= 1;
      
      while(DHT11_IN() == FALSE);
      delay_us(30);
      
      if(DHT11_IN())
      {
          value |= 1;
      }

      while(DHT11_IN());
      s--;
   }

   return value;
}


unsigned char get_data(void)
{
	bool chk = FALSE;
	unsigned char s = 0x00;
	unsigned char check_sum = 0x00;
	
	DHT11_OUTPUT();
	
	DHT11_OUT_HIGH();
	DHT11_OUT_LOW();
	
	delay_ms(18);
	
	DHT11_OUT_HIGH();
	
	delay_us(26);
	DHT11_INPUT();
	
	chk = DHT11_IN();
	
	if(chk == TRUE)
	{
		return 1;
	}
	
	delay_us(80);
	
	chk = DHT11_IN();
	
	if(chk == FALSE)
	{
		return 2;
	}
	
	delay_us(80);
	
	for(s = 0; s <= 4; s += 1)
	{
		values[s] = get_byte();
	}
	
	DHT11_OUTPUT();
	DHT11_OUT_HIGH(); 
	
	for(s = 0; s < 4; s++)
	{
	check_sum += values[s];
	}
	
	if(check_sum != values[4])
	{
		return 3;
	}
	else
	{
		return 0;
	}
}
