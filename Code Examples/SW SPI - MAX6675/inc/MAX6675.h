#include "STM8S.h"


#define SW_SPI_Port		   	GPIOC			

#define CS_pin             			GPIO_PIN_1
#define SCK_pin            		GPIO_PIN_2
#define SO_pin             		GPIO_PIN_3

#define CS_OUT_HIGH()		GPIO_WriteHigh(SW_SPI_Port, CS_pin)
#define CS_OUT_LOW()		GPIO_WriteLow(SW_SPI_Port, CS_pin)
#define SCK_OUT_HIGH()	GPIO_WriteHigh(SW_SPI_Port, SCK_pin)
#define SCK_OUT_LOW()	GPIO_WriteLow(SW_SPI_Port, SCK_pin)

#define SO_IN()					GPIO_ReadInputPin(SW_SPI_Port, SO_pin)

#define T_min             			0
#define T_max              			1024

#define count_max          		4096

#define no_of_pulses       	16

#define deg_C              			0
#define deg_F              			1
#define tmp_K              		2

#define open_contact       	0x04
#define close_contact      	0x00

#define scalar_deg_C       	0.25
#define scalar_deg_F_1     	1.8
#define scalar_deg_F_2     	32.0
#define scalar_tmp_K       	273.0

#define no_of_samples      	16


void MAX6675_init(void);
unsigned char MAX6657_get_ADC(unsigned int *ADC_data);
float MAX6675_get_T(unsigned int ADC_value, unsigned char T_unit);