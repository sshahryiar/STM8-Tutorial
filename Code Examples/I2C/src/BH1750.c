#include "BH1750.h"


void BH1750_init(void)
{ 
   delay_ms(10);  
   BH1750_write(power_down);
}                


void BH1750_write(unsigned char cmd)
{  
   I2C_GenerateSTART(ENABLE);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
   
   I2C_Send7bitAddress(BH1750_addr, I2C_DIRECTION_TX); 
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
   
   I2C_SendData(cmd);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
   
   I2C_GenerateSTOP(ENABLE);   
}


unsigned int BH1750_read_word(void)
{                      
   unsigned long value = 0x0000;
   unsigned char num_of_bytes = 0x02;   
   unsigned char bytes[2] = {0x00, 0x00};
  
   while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));
   
   I2C_GenerateSTART(ENABLE);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
   
   I2C_Send7bitAddress(BH1750_addr, I2C_DIRECTION_RX);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
   
   while(num_of_bytes)
   {
		if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
		{   
			if(num_of_bytes == 0)
			{
				I2C_AcknowledgeConfig(I2C_ACK_NONE);
				I2C_GenerateSTOP(ENABLE);   
			}
			
			bytes[(num_of_bytes - 1)] = I2C_ReceiveData();
		
			num_of_bytes--;
		}
   };    
   
   value = ((bytes[1] << 8) | bytes[0]);  
   
   return value;
} 


unsigned int get_lux_value(unsigned char mode, unsigned int delay_time)
{
   unsigned long lux_value = 0x00;  
   unsigned char dly = 0x00;
   unsigned char s = 0x08;
   
   while(s)
   {
       BH1750_write(power_up);
       BH1750_write(mode);
       lux_value += BH1750_read_word();
       for(dly = 0; dly < delay_time; dly += 1)
       {
           delay_ms(1);
       }
       BH1750_write(power_down);
	   s--;
   }
   lux_value >>= 3;
   
   return ((unsigned int)lux_value);
}                                