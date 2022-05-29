#include "STM8S.h"
#include "MAX72XX.h"


void clock_setup(void);
void GPIO_setup(void);
void SPI_setup(void);


void main()
{
	unsigned char i = 0x00;
    unsigned char j = 0x00;

    volatile unsigned char temp[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
    
    const unsigned char text[96] =
    {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   
		0x00, 0x7E, 0x04, 0x08, 0x08, 0x04, 0x7E, 0x00,        //M
        0x00, 0x42, 0x42, 0x7E, 0x7E, 0x42, 0x42, 0x00,       //I
        0x00, 0x3C, 0x42, 0x42, 0x42, 0x42, 0x24, 0x00,      //C
        0x00, 0x7E, 0x1A, 0x1A, 0x1A, 0x2A, 0x44, 0x00,      //R
        0x00, 0x3C, 0x42, 0x42, 0x42, 0x42, 0x3C, 0x00,      //O
        0x00, 0x7C, 0x12, 0x12, 0x12, 0x12, 0x7C, 0x00,         //A
        0x00, 0x7E, 0x1A, 0x1A, 0x1A, 0x2A, 0x44, 0x00,      //R
        0x00, 0x7E, 0x7E, 0x4A, 0x4A, 0x4A, 0x42, 0x00,     //E
        0x00, 0x7E, 0x04, 0x08, 0x10, 0x20, 0x7E, 0x00,        //N
        0x00, 0x7C, 0x12, 0x12, 0x12, 0x12, 0x7C, 0x00,         //A
	    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   
    };
    
	
	clock_setup();
	GPIO_setup();
	SPI_setup();
	MAX72xx_init();
	
	while(TRUE)
	{
		for(i = 0; i < sizeof(temp); i++)
		{
			temp[i] = 0x00;
		}
		
		for(i = 0; i < sizeof(text); i++)
         {
            for(j = 0; j < sizeof(temp); j++)
            {
                 temp[j] = text[(i + j)];
                 MAX72xx_write((1 + j), temp[j]);
                 delay_ms(9);
            }
         }
	};
}


void clock_setup(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
	GPIO_DeInit(GPIOC);
	GPIO_Init(GPIOC, ((GPIO_Pin_TypeDef)GPIO_PIN_5 | GPIO_PIN_6), GPIO_MODE_OUT_PP_HIGH_FAST);
}


void SPI_setup(void)
{
	SPI_DeInit();
	SPI_Init(SPI_FIRSTBIT_MSB, 
				  SPI_BAUDRATEPRESCALER_2, 
				  SPI_MODE_MASTER, 
				  SPI_CLOCKPOLARITY_HIGH, 
				  SPI_CLOCKPHASE_1EDGE, 
				  SPI_DATADIRECTION_1LINE_TX, 
				  SPI_NSS_SOFT, 
				  0x00);
	SPI_Cmd(ENABLE);
}