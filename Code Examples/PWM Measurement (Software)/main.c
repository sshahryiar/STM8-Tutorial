#include "STM8S.h"
#include "lcd.h"


unsigned char data_value;

unsigned long duty_cycle = 0;
unsigned long start_time = 0;
unsigned long end_time = 0;


void clock_setup(void);
void GPIO_setup(void);
void TIM1_setup(void);
void TIM2_setup(void);
void print_I(unsigned char x_pos, unsigned char y_pos, signed long value);


void main()
{	
    unsigned long time_period = 0;
	
	clock_setup();
	GPIO_setup();
	TIM1_setup();
	TIM2_setup();
	LCD_init();  
	
	LCD_clear_home(); 
	LCD_goto(0, 0);
	LCD_putstr("PWM Capture Test");
	LCD_goto(0, 1);
	LCD_putstr("T/ms:");
	delay_ms(10);
	
	while(TRUE)
	{
		print_I(13, 1, duty_cycle);
		delay_ms(900);
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
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{	
	GPIO_DeInit(GPIOC);
	GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);
	
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);
}


void TIM1_setup(void)
{
	TIM1_DeInit();
	TIM1_TimeBaseInit(2000, TIM1_COUNTERMODE_UP, 55535, 1);
	TIM1_CCxCmd(TIM1_CHANNEL_1, ENABLE);
	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, 1, 1);
	TIM1_ITConfig(TIM1_IT_CC1, ENABLE);	
	TIM1_Cmd(ENABLE);
	enableInterrupts();
}


void TIM2_setup(void)
{
	TIM2_DeInit();
	TIM2_TimeBaseInit(TIM2_PRESCALER_32, 1250);
	TIM2_OC1Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_LOW);
	TIM2_SetCompare1(1125);
	TIM2_Cmd(ENABLE);
}


void print_I(unsigned char x_pos, unsigned char y_pos, signed long value)
{
    unsigned char ch = 0x00;

    if(value < 0)
    {
        LCD_goto(x_pos, y_pos);
		LCD_putchar(0x2D);
        value = -value;
    }
    else
    {
        LCD_goto(x_pos, y_pos);
		LCD_putchar(0x20);
    }

    if(value > 9999)
    {
		ch = ((value / 10000) + 0x30);
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
		
        ch = (((value % 10000)/ 1000) + 0x30);
		LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);
		
        ch = (((value % 1000) / 100) + 0x30);
		LCD_goto((x_pos + 3), y_pos);
		LCD_putchar(ch);
		
        ch = (((value % 100) / 10) + 0x30);
        LCD_goto((x_pos + 4), y_pos);
		LCD_putchar(ch);
		
		ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 5), y_pos);
		LCD_putchar(ch);
    }

    else if((value > 999) && (value <= 9999))
    {
        ch = (((value % 10000)/ 1000) + 0x30);
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
		
        ch = (((value % 1000) / 100) + 0x30);
		LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);
		
        ch = (((value % 100) / 10) + 0x30);
		LCD_goto((x_pos + 3), y_pos);
		LCD_putchar(ch);
		
        ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 4), y_pos);
		LCD_putchar(ch);
		
        LCD_goto((x_pos + 5), y_pos);
		LCD_putchar(0x20);
    }
    else if((value > 99) && (value <= 999))
    {
        ch = (((value % 1000) / 100) + 0x30);
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
		
        ch = (((value % 100) / 10) + 0x30);
		LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);
		
        ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 3), y_pos);
		LCD_putchar(ch);
		
        LCD_goto((x_pos + 4), y_pos);
		LCD_putchar(0x20);
		
		LCD_goto((x_pos + 5), y_pos);
		LCD_putchar(0x20);
    }
    else if((value > 9) && (value <= 99))
    {
        ch = (((value % 100) / 10) + 0x30);
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
		
        ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);
		
        LCD_goto((x_pos + 3), y_pos);
		LCD_putchar(0x20);
		
		LCD_goto((x_pos + 4), y_pos);
		LCD_putchar(0x20);
		
		LCD_goto((x_pos + 5), y_pos);
		LCD_putchar(0x20);
    }
    else
    {
        ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
		
		LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(0x20);
       
	    LCD_goto((x_pos + 3), y_pos);
		LCD_putchar(0x20);
		
		LCD_goto((x_pos + 4), y_pos);
		LCD_putchar(0x20);
		
		LCD_goto((x_pos + 5), y_pos);
		LCD_putchar(0x20);
    }
}
