#include<htc.h>
#include<pic.h>
#include<string.h>


#define _XTAL_FREQ 20000000
#include "uart.h"



#define sw RB1
#define RELAY RB2

#define LCD_RS RC1
#define LCD_E RC2
#define LCD_Data_Bus PORTD
#define LCD_E_Dir     	    TRISC2
#define LCD_RS_Dir   	 	TRISC1
#define LCD_Data_Bus_Dir 	TRISD
#define E_Delay       50



unsigned char msgr[50];
int msg_ok = 0;

unsigned char d0,d1,d2,d3,g2,q=0,a1,b1,k=0,n1=0,x=0,y=0,cl[9],g1=0,g2=0,i4=0,i5=0,i=0,i6,cp,sec,min,hr,date,mon,yr,day,j=0,c=0,t=16,p=0;
unsigned char a[]="-<* METER SYSTEM *>-",b[]="PULSE:0000",
	                   d[]="CLOCK      DATE",e[]="UNIT: 00.00",
	                   pr[]="PRIVOUS UNIT:",
				    cu[]="CURRENT UNIT:",f[]="OFF",
				    n[]="ON",alarm[9]="00:00:00";

unsigned char msg1[] = "AT+CMGS=\"+919723001470\"";//geb
unsigned char msg2[] = "AT+CMGS=\"+919737319086\"";//user


//LCD functions starts from here


void ToggleEpinOfLCD(void)
{
	LCD_E = 1;                // Give a pulse on E pin
    __delay_ms(E_Delay);     	 // so that LCD can latch the
	LCD_E = 0;                // data from data bus
	__delay_ms(E_Delay);
}

void lcdcmd(unsigned char cmdout)
{
	LCD_RS=0;
	LCD_Data_Bus=cmdout;
	ToggleEpinOfLCD();
}

void lcddata(unsigned char dataout)
{
	LCD_RS=1;
	LCD_Data_Bus=dataout;
	ToggleEpinOfLCD();
}

void lcd_clr(void)
{
   	lcdcmd(0x01);		// Clear Display and DDRAM
   	__delay_ms(40);
}





void WriteStringToLCD(unsigned char d[])
{
	int i;
	for(i=0;d[i]!='\0';i++)
		{		
			lcddata(d[i]);   // print string on LCD
		}
}




void lcd_init()
{
    LCD_E   	     = 0;      // E = 0
	LCD_RS    	     = 0;      // D = 0
	LCD_Data_Bus     = 0;      // CLK = 0
	LCD_E_Dir        = 0;      // Make Output
	LCD_RS_Dir       = 0;      // Make Output
	LCD_Data_Bus_Dir = 0;      // Make Output
	
	
	
	lcdcmd(0x30);		//function set 8 bit line 1, 5x7dots
	

	lcdcmd(0x38);		//function set 8 bit line 2, 5x7dots
	lcdcmd(0x0C);		//Display ON cursor OFF
	lcdcmd(0x01);		//Clear display and DDRAM content
	lcdcmd(0x06);		//Entry Mode
	lcdcmd(0x80);		//Set Cursor to beginning of first line

}


//LCD functions end here


void main()
{	
	   	
	RELAY=1;
	sw=1;

	lcd_init();


	for(i=0;a[i]!='\0';i++)
		lcddata(a[i]);	
	
	lcdcmd(0xc0);		//Put cursor on 2nd line of LCD
	
	for(i=0;d[i]!='\0';i++)
		lcddata(d[i]);												 
	
	lcdcmd(0x94);		//Put cursor on 3rd line of LCD

	for(i=0;b[i]!='\0';i++)
		lcddata(b[i]);																		 
														 
	lcdcmd(0xD4);		//Put cursor on 4th line of LCD
		                           
	for(i=0;e[i]!='\0';i++)
		lcddata(e[i]);
	
	
	
	lcdcmd(0xDA);     //on the 4th line of LCD at 0xDA position
  	
				
  	lcdcmd(0xE1);
  	

							
	while(1)
	{

		cp=strcmp(alarm,cl);
		if((cp==0)&&(n1==0))
        {
            UART_Init(9600);

            UART_Write_Text("AT+CMGS=\"+918428099468\"");


            UART_Write(0x0D);		//Enter

            UART_Write(0x0A);		//new line
            __delay_ms(500);

            for(i4=0;pr[i4]!='\0';i4++)
                   UART_Write(pr[i4]);
            UART_Write((p/1000)+48);
            UART_Write(((p/100)%10)+48);
            UART_Write('.');
            UART_Write(((p/10)%10)+48);
            UART_Write(((p%10))+48);
            UART_Write(' ');
            UART_Write(' ');

            for(i4=0;cu[i4]!='\0';i4++)
                UART_Write(cu[i4]);

            UART_Write((j/1000)+48);
            UART_Write(((j/100)%10)+48);
            UART_Write('.');
            UART_Write(((j/10)%10)+48);
            UART_Write(((j%10))+48);
            UART_Write(0x1A);
            while(TRMT);

        }	
	}    
}