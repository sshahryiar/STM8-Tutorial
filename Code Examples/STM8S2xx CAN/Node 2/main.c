#include "STM8S.h"
#include "SSD1306.h"
#include "DHT11.h"


unsigned char buffer[buffer_size];
unsigned char values[5]; 


unsigned long ID = 0;
unsigned char tx_buffer[0x03] = { 0x00, 0x00, 0x00};
unsigned char rx_buffer[0x08] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};


void setup(void);
void setup_clock(void);
void setup_GPIO(void);
void setup_CAN(void);
void send_data_to_CAN_bus(void);
void receive_data_from_CAN_bus(void);


void main(void)
{
	bool toggle = FALSE;
	
	setup();
	
	OLED_print_string(0, 0, "CAN Node 2");
	OLED_print_string(0, 1, "Node 2 ID       4660");
	OLED_print_string(0, 2, "DS18B20 T/ 'C: ");
	OLED_print_string(0, 3, "DHT11     T/'C :");
	OLED_print_string(0, 4, "DHT11  RH/% :");
	OLED_print_string(0, 5, "RX Node ID");
	OLED_print_string(0, 6, "RX Data");
	
	while(1)
	{
		get_data();
      
		tx_buffer[0] = values[0];	
		tx_buffer[1] = values[2];	
		
		switch(toggle)
		{
			case TRUE:
			{
				tx_buffer[2] = 0x66;
				break;
			}
			case FALSE:
			{
				tx_buffer[2] = 0x99;
				break;
			}
		}
		
		if(rx_buffer[1] == 0x55)
		{
			GPIO_WriteHigh(GPIOE, GPIO_PIN_0);
		}
		else if(rx_buffer[1] == 0xAA)
		{
			GPIO_WriteLow(GPIOE, GPIO_PIN_0);
		}
		else
		{
			GPIO_WriteReverse(GPIOE, GPIO_PIN_0);
			delay_ms(100);
		}
		
		send_data_to_CAN_bus();
		receive_data_from_CAN_bus();
		
		OLED_print_chr(103, 2, rx_buffer[0]);
		OLED_print_chr(103, 3, tx_buffer[1]);
		OLED_print_chr(103, 4, tx_buffer[0]);
		OLED_print_int(85, 5, ID);
		
		OLED_print_chr(53, 6, rx_buffer[0]);
		OLED_print_chr(77, 6, rx_buffer[1]);
		OLED_print_chr(101, 6, rx_buffer[2]);
		OLED_print_chr(0, 7, rx_buffer[3]);
		OLED_print_chr(25, 7, rx_buffer[4]);
		OLED_print_chr(49, 7, rx_buffer[5]);
		OLED_print_chr(73, 7, rx_buffer[6]);
		OLED_print_chr(97, 7, rx_buffer[7]);
		
		toggle ^= 1;
	};
}


void setup(void)
{
	setup_clock();
	setup_GPIO();
	setup_CAN();
	DHT11_init();
	OLED_init();
}


void setup_clock(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
											 CLK_SOURCE_HSI, 
											 DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_CAN, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void setup_GPIO(void)
{
	GPIO_DeInit(GPIOA);
	GPIO_Init(GPIOA, ((GPIO_Pin_TypeDef)(GPIO_PIN_3 | GPIO_PIN_6)), GPIO_MODE_OUT_PP_LOW_FAST);
		
	GPIO_DeInit(GPIOE);
	GPIO_Init(GPIOE, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
}


void setup_CAN(void)
{
	CAN_DeInit();
	
	 CAN_Init(CAN_MasterCtrl_AllDisabled,
					  CAN_Mode_Normal,
                      CAN_SynJumpWidth_1TimeQuantum,
                      CAN_BitSeg1_14TimeQuantum,
                      CAN_BitSeg2_6TimeQuantum,
                      1);
					  
	CAN_FilterInit(CAN_FilterNumber_0,
							 ENABLE,
							 CAN_FilterMode_IdList,
							 CAN_FilterScale_32Bit,
					     	 0x00,  
							 0x08,
							 0x09,
							 0x2C,
							 0x00,
							 0x08,
							 0x09,
							 0x2C);			//Check messages from ID: 0x1234  // Check Filter Register Table
							 
	CAN_ITConfig(CAN_IT_FMP,ENABLE);
}


void send_data_to_CAN_bus(void)
{
	GPIO_WriteLow(GPIOA, GPIO_PIN_3);
    CAN_Transmit(0x1234,  CAN_Id_Extended, CAN_RTR_Data, 3, tx_buffer);
	GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
    delay_ms(600);
	
	GPIO_WriteLow(GPIOA, GPIO_PIN_3);
    CAN_Transmit(0x1234, CAN_Id_Extended, CAN_RTR_Remote, 0, tx_buffer);
	GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
    delay_ms(1600);
}


void receive_data_from_CAN_bus(void)
{
    CAN_Id_TypeDef IDE;
    CAN_RTR_TypeDef RTR;
	
	unsigned char i = 0x00;
	unsigned char DLC = 0x00;
    
	CAN_Receive();
    
    ID = CAN_GetReceivedId();
    IDE = CAN_GetReceivedIDE();
    RTR = CAN_GetReceivedRTR();
	DLC = CAN_GetReceivedDLC();
    
    for(i = 0x00; i < DLC; i++)
    {
        rx_buffer[i] = CAN_GetReceivedData(i);
    }
    
    if((IDE == CAN_Id_Extended) && (RTR ==CAN_RTR_Data))
    {
		GPIO_WriteLow(GPIOA, GPIO_PIN_6);
		GPIO_WriteHigh(GPIOA, GPIO_PIN_6);
		delay_ms(600);
	}
    
    if((IDE == CAN_Id_Extended) && (RTR == CAN_RTR_Remote))
    {
		GPIO_WriteLow(GPIOA, GPIO_PIN_6);
		GPIO_WriteHigh(GPIOA, GPIO_PIN_6);
		delay_ms(1600);
    }
}
