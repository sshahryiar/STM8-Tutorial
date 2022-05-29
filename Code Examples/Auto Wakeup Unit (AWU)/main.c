#include "STM8S.h"


void clock_setup(void);
void GPIO_setup(void);
void AWU_setup(void);


void main(void)
{
	unsigned char s = 0x00;
	
	clock_setup();
	GPIO_setup();
	AWU_setup();
	
	while(TRUE)
	{
		for(s = 0x00; s < 0x04; s++)
		{
			GPIO_WriteLow(GPIOD, GPIO_PIN_0);
			delay_ms(60);
			GPIO_WriteHigh(GPIOD, GPIO_PIN_0);
			delay_ms(60);
		}
		
		halt();				
	};
}


void clock_setup(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	
	CLK_LSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == FALSE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, ENABLE);	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{		
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_FAST);
}


void AWU_setup(void)
{
	AWU_IdleModeEnable();	
	AWU_DeInit();
	AWU_LSICalibrationConfig(128000);
	AWU_Init(AWU_TIMEBASE_2S);
	AWU_Cmd(ENABLE);
	enableInterrupts(); 
}