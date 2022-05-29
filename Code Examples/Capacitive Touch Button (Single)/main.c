#include "STM8S.h"
#include "stm8_tsl_conf.h"
#include "STM8_TSL_API.h"


void setup_clock(void);
void setup_GPIO(void);
void setup_capacitive_touch(void);


void main(void)
{
	bool state;
	
	setup_clock();
	setup_GPIO();
	setup_capacitive_touch();
	
	while(1)
	{
		TSL_Action();
		
		if ((TSL_GlobalSetting.b.CHANGED) && (TSLState == TSL_IDLE_STATE)) 
		{
			TSL_GlobalSetting.b.CHANGED = 0;
			
			if (sSCKeyInfo[0].Setting.b.DETECTED) 
			{
				state ^= 1;
			}
		}
		
		switch(state)
		{
			case 1:
			{
				delay_ms(60);
				break;
			}
			
			default:
			{
				delay_ms(120);
				break;	
			}
		}
		
		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
		
	};	
}


void setup_clock(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(ENABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSERDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
}


void setup_GPIO(void)
{
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_SLOW);
}


void setup_capacitive_touch(void)
{
	TSL_Init();
	
	sSCKeyInfo[0].Setting.b.IMPLEMENTED = 1; 
	sSCKeyInfo[0].Setting.b.ENABLED = 1;  

	enableInterrupts();
}