#include "stm8s.h" 


#define I2C_PORT                                	GPIOB

#define SDA_pin                                 	GPIO_PIN_5
#define SCL_pin                                 	GPIO_PIN_4

#define PCF8574_address 					0x4E


void I2C_GPIO_setup(void);
void I2C_setup(void);
void PCF8574_init(void);
unsigned char PCF8574_read(void);
void PCF8574_write(unsigned char data_byte);
