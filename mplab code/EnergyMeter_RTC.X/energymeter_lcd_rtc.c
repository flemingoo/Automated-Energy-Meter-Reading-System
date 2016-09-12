#define sw RB1
#define RELAY RB2

#define _XTAL_FREQ 20000000

#include<htc.h>
#include<pic.h>
#include <string.h>
#include "Includes.h"
#include "uart.h"

int trsh;
int i=0,cp=1,n1=0,count=0;
char count_ch=0;

char a[]="-<* METER SYSTEM *>-",b[]="PULSE:", d[]="CLOCK      DATE",e[]="UNIT:";
char pr[]="PRIVOUS UNIT:", cu[]="CURRENT UNIT:",f[]="OFF", n[]="ON",alarm[7]="101900";

unsigned char msg1[] = "AT+CMGS=\"+919723001470\"";
unsigned char msg2[] = "AT+CMGS=\"+919737319086\"";

void interrupt isr(void)
{
    if(RBIF==1 && RB4==1)
        count++;
    trsh=PORTB;
    RBIF=0;
}

void main()
{	
	   	

    TRISB=255;
    unsigned char* pTimeArray;
	InitLCD();
    InitI2C();
    lcdClr();
    RBIE=1;
    RBIF=0;
    GIE=1;

	lcdString(a);	
    
	lcdCmd(0xD4);		//Put cursor on 3rd line of LCD
	for(i=0;i<6;i++)
		lcdData(b[i]);
														 
	//lcdCmd(0xD4);		//Put cursor on 4th line of LCD
	//lcdString(e);
	
 				
	while(1)
	{
        //pDateArray=Get_DS1307_RTC_Date();
        pTimeArray = DisplayTimeToLCD(Get_DS1307_RTC_Time());
        DisplayDateOnLCD(Get_DS1307_RTC_Date());
        
        count_ch=(char)(count+48);
        lcdCmd(0xDA);
        lcdData(count_ch);
        
        if(count==5)//&&(n1==0)) //sends msg for every 5 count(or units)
        {
            count=0;
            UART_Init(9600);
            UART_Write_Text("AT+CMGS=\"+918428099468\"");
            UART_Write(0x0D);		
            UART_Write(0x0A);
            __delay_ms(1000);
            
            UART_Write_Text("CUSTOMERID 9400557497 COUNT ");
            UART_Write(count_ch);
            UART_Write(0x1A); 
            __delay_ms(1000);
            while(!TRMT);  
        }	
	}    
}


