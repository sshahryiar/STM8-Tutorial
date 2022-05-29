#include "one_wire.h"
    

bool onewire_reset(void)  
{                                         
	 bool res = FALSE; 
	 
	 DS18B20_OUTPUT();                 
	 DS18B20_OUT_LOW();
	 delay_us(480);        
	 DS18B20_OUT_HIGH();
	 delay_us(60);        

	 DS18B20_INPUT();
	 res = DS18B20_IN();
	 delay_us(480);       
	 
	 return res; 
} 


void onewire_write_bit(bool bit_value)
{
	DS18B20_OUTPUT();
	DS18B20_OUT_LOW(); 
   	
	if(bit_value)
	{     	
		delay_us(104);
		DS18B20_OUT_HIGH();   
	}              
}     


bool onewire_read_bit(void)        
{     
	DS18B20_OUTPUT();
	DS18B20_OUT_LOW();  
	DS18B20_OUT_HIGH();  
    delay_us(15);      
    DS18B20_INPUT();

	return(DS18B20_IN());    
}


void onewire_write(unsigned char value) 
{                    
	 unsigned char s = 0; 
	 
	 DS18B20_OUTPUT();

	 while(s < 8)    
	 {                              
		  if((value & (1 << s)))
		  {
			  DS18B20_OUT_LOW(); 
			  delay_cycles(1);   
			  DS18B20_OUT_HIGH();  
			  delay_us(60);   
		  }       
		                      
		  else
		  {
		      DS18B20_OUT_LOW();           
			  delay_us(60);           
			  DS18B20_OUT_HIGH();   
			  delay_cycles(1);  
		  }
		  s++;
	 }
}                                      


unsigned char onewire_read(void)
{
	 unsigned char s = 0x00;
	 unsigned char value = 0x00;
	
	 while(s < 8) 
	 {
		  DS18B20_OUTPUT();

		  DS18B20_OUT_LOW();
		  delay_cycles(1);                  
		  DS18B20_OUT_HIGH();  
		  
		  DS18B20_INPUT();
		  if(DS18B20_IN())  
		  {                                      
		      value |=  (1 << s);                         
		  }        
		   
		  delay_us(60);      
		  s++;
	 }     
	 
	 return value;
}                       
