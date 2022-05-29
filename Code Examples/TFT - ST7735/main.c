#include "STM8S.h"
#include "ST7735.h"


unsigned int width;
unsigned int length;


void setup_clock(void);
void setup_GPIOs(void);


void main(void)
{
	 float f = -0.09;
     signed int i = -9;
     signed char c = 127;
     
     setup_clock();
	 setup_GPIOs();
	 ST7735_init();

     ST7735_Set_Rotation(0x01);

     TFT_fill(Swap_Colour(GREEN));
     Draw_Circle(79, 63, 20, YES, Swap_Colour(RED));
     delay_ms(4000);
     
     TFT_fill(Swap_Colour(WHITE));

     Draw_Circle(6, 6, 4, YES, RED);
     Draw_Circle(153, 6, 4, YES, RED);
     Draw_Circle(6, 121, 4, YES, RED);
     Draw_Circle(153, 121, 4, YES, RED);

     delay_ms(1000);

     Draw_Line(14, 0, 14, 127, CYAN);
     Draw_Line(145, 0, 145, 127, CYAN);
     Draw_Line(0, 14, 159, 14, CYAN);
     Draw_Line(0, 113, 159, 113, CYAN);

     delay_ms(1000);

     Draw_Rectangle(17, 17, 142, 110, YES, ROUND, BLUE, WHITE);
     delay_ms(1000);

     print_str(22, 58, 2, YELLOW, BLUE, "MicroArena");
     delay_ms(4000);

     TFT_fill(BLACK);
     print_str(20, 90, 1, YELLOW, BLACK, "www.fb.com/MicroArena");

     while(1)
     {
             print_F(60, 20, 1, BLUE, BLACK, f, 2);
             print_C(60, 40, 1, RED, BLACK, c);
             print_I(60, 60, 1, GREEN, BLACK, i);
             f += 0.01;
             c -= 1;
             i += 1;
             if(c < -128)
             {
                 c = 127;
             }
             delay_ms(60);
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
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void setup_GPIOs(void)
{
	GPIO_DeInit(SPI_PORT);
	GPIO_DeInit(CTL_PORT);
}