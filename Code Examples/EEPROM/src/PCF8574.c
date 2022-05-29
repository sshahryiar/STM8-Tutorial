#include "PCF8574.h"


void I2C_GPIO_setup(void)
{   
    GPIO_Init(I2C_PORT, 
              ((GPIO_Pin_TypeDef)(SCL_pin | SDA_pin)), 
              GPIO_MODE_OUT_PP_HIGH_FAST);
}


void I2C_setup(void)
{
    I2C_DeInit();
    I2C_Init(100000, 
                  PCF8574_address, 
                  I2C_DUTYCYCLE_2, 
                  I2C_ACK_CURR, 
                  I2C_ADDMODE_7BIT, 
                  (CLK_GetClockFreq() / 1000000));
    I2C_Cmd(ENABLE);
}


void PCF8574_init(void)
{
    I2C_GPIO_setup();
    I2C_setup();
}


unsigned char PCF8574_read(void)
{
   unsigned char port_byte = 0x00;
   unsigned char num_of_bytes = 0x01; 

   while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));
   
   I2C_GenerateSTART(ENABLE);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
   
   I2C_Send7bitAddress(PCF8574_address, I2C_DIRECTION_RX);
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
            
            port_byte = I2C_ReceiveData();
        
            num_of_bytes--;
        }
   };  

   return port_byte;
}


void PCF8574_write(unsigned char data_byte)
{
   I2C_GenerateSTART(ENABLE);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
   
   I2C_Send7bitAddress(PCF8574_address, I2C_DIRECTION_TX); 
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
   
   I2C_SendData(data_byte);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
   
   I2C_GenerateSTOP(ENABLE);   
}
