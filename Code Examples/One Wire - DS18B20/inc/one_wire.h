#include "STM8S.h"


#define DS18B20_port					GPIOD		
#define DS18B20_pin 					GPIO_PIN_2

#define DS18B20_INPUT()			do{GPIO_DeInit(DS18B20_port); GPIO_Init(DS18B20_port, DS18B20_pin, GPIO_MODE_IN_FL_NO_IT);}while(0)
#define DS18B20_OUTPUT()		do{GPIO_DeInit(DS18B20_port); GPIO_Init(DS18B20_port, DS18B20_pin, GPIO_MODE_OUT_PP_HIGH_FAST);}while(0)

#define DS18B20_IN()					GPIO_ReadInputPin(DS18B20_port, DS18B20_pin)

#define DS18B20_OUT_LOW()	GPIO_WriteLow(DS18B20_port, DS18B20_pin)
#define DS18B20_OUT_HIGH()	GPIO_WriteHigh(DS18B20_port, DS18B20_pin)      


bool onewire_reset(void); 
void onewire_write_bit(bool bit_value);
bool onewire_read_bit(void);
void onewire_write(unsigned char value);    
unsigned char onewire_read(void);