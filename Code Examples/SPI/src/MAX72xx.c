#include "MAX72xx.h"


void MAX72xx_init(void)
{
    GPIO_Init(CS_port, CS_pin, GPIO_MODE_OUT_PP_HIGH_FAST);

    MAX72xx_write(shutdown_reg, run_cmd);                 
    MAX72xx_write(decode_mode_reg, 0x00);
    MAX72xx_write(scan_limit_reg, 0x07);
    MAX72xx_write(intensity_reg, 0x04);
    MAX72xx_write(display_test_reg, test_cmd);
    delay_ms(10);     
    MAX72xx_write(display_test_reg, no_test_cmd);  
}


void MAX72xx_write(unsigned char address, unsigned char value)
{
    while(SPI_GetFlagStatus(SPI_FLAG_BSY));
	GPIO_WriteLow(CS_port, CS_pin);
	
	SPI_SendData(address);
	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
	
	SPI_SendData(value);
	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
	
	GPIO_WriteHigh(CS_port, CS_pin);
}