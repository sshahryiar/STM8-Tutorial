#include "STM8S.h"
#include "stm8_tsl_conf.h"
#include "STM8_TSL_API.h"


void setup_clock(void);
void setup_GPIO(void);
void setup_capacitive_touch(void);


void main(void)
{
	bool state1 = FALSE;
	bool state2 = FALSE;
	bool state3 = FALSE;
	
	setup_clock();
	setup_GPIO();
	setup_capacitive_touch();
	
	while(TRUE)
	{
		TSL_Action();
		
		if((TSL_GlobalSetting.b.CHANGED == TRUE) && (TSLState == TSL_IDLE_STATE)) 
		{		   
			TSL_GlobalSetting.b.CHANGED = FALSE;
			
			if(sSCKeyInfo[0].Setting.b.DETECTED) 
			{
				if(state1 == FALSE)
				{
					GPIO_WriteHigh(GPIOD, GPIO_PIN_0);
					state1 = TRUE;
				}
				else
				{
					GPIO_WriteLow(GPIOD, GPIO_PIN_0);
					state1 = FALSE;
				}
			}
		   
			if(sSCKeyInfo[1].Setting.b.DETECTED) 
			{			
				if(state2 == FALSE)
				{
					GPIO_WriteHigh(GPIOD, GPIO_PIN_2);
					state2 = TRUE;
				}
				else
				{
					GPIO_WriteLow(GPIOD, GPIO_PIN_2);
					state2 = FALSE;
				}
			}
			
			if(sSCKeyInfo[2].Setting.b.DETECTED) 
			{
				if(state3 == FALSE)
				{
					GPIO_WriteHigh(GPIOD, GPIO_PIN_3);
					state3 = TRUE;
				}
				else
				{
					GPIO_WriteLow(GPIOD, GPIO_PIN_3);
					state3 = FALSE;
				}
			}
		}
	}
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
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
}


void setup_GPIO(void)
{
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, ((GPIO_Pin_TypeDef)(GPIO_PIN_0 | GPIO_PIN_2 | GPIO_PIN_3)), GPIO_MODE_OUT_PP_LOW_FAST);
}


void setup_capacitive_touch(void)
{
	unsigned char i = 0;
	
	TSL_Init();

	for (i = 0; i < 3; i++)
	{
		sSCKeyInfo[i].Setting.b.IMPLEMENTED = 1;
		sSCKeyInfo[i].Setting.b.ENABLED = 1;
	}   
	
	enableInterrupts();
}