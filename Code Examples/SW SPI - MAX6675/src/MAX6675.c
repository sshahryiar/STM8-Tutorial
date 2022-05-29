#include "MAX6675.h"


void MAX6675_init()
{
   GPIO_DeInit(SW_SPI_Port);

   GPIO_Init(SW_SPI_Port, 
              ((GPIO_Pin_TypeDef)(SCK_pin | CS_pin)), 
              GPIO_MODE_OUT_PP_HIGH_FAST);

   GPIO_Init(SW_SPI_Port, SO_pin, GPIO_MODE_IN_FL_NO_IT);
   
   CS_OUT_HIGH();
   SCK_OUT_HIGH();
}


unsigned char MAX6657_get_ADC(unsigned int *ADC_data)
{
   unsigned char samples = no_of_samples;
   unsigned char clk_pulses = 0;
   unsigned int temp_data = 0;
   unsigned long avg_value = 0;
   
   
   while(samples > 0)
   {
         clk_pulses = no_of_pulses;
         temp_data = 0;
         
         CS_OUT_LOW();
         
         while(clk_pulses > 0)
         {    
            temp_data <<= 1;
            
            if(SO_IN())
            {
                temp_data |= 1;
            }

            SCK_OUT_HIGH();
            SCK_OUT_LOW();
            
            clk_pulses--;
         };   
   
         CS_OUT_HIGH();
         temp_data &= 0x7FFF;
         
         avg_value += temp_data;
         
         samples--;
         delay_ms(10);
   };

   temp_data = (avg_value >> 4);

   if((temp_data & 0x04) == close_contact)
   {
      *ADC_data = (temp_data >> 3);
      return close_contact;
   }
   else
   {
      *ADC_data = (count_max + 1);
      return open_contact;
   }
}


float MAX6675_get_T(unsigned int ADC_value, unsigned char T_unit)
{
   float tmp = 0.0;
   
   tmp = (((float)ADC_value) * scalar_deg_C);
   
   switch(T_unit)
   {
      case deg_F:
      {
         tmp *= scalar_deg_F_1;
         tmp += scalar_deg_F_2;
         break;
      }
      case tmp_K:
      {
        tmp += scalar_tmp_K;
        break;
      }
      default:
      {
        break;
      }
   }

   return tmp;
}
