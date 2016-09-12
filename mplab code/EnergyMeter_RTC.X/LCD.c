#include "Includes.h"


void ToggleEpinOfLCD(void)
{
	LCD_E = 1;                // Give a pulse on E pin
	__delay_us(E_Delay);      // so that LCD can latch the
	LCD_E = 0;                // data from data bus
	__delay_us(E_Delay); 	
}


void lcdCmd(unsigned char cmdout)  
{
	LCD_RS = 0;				  // It is a command
	LCD_Data_Bus=cmdout;
	ToggleEpinOfLCD();		  // Give pulse on E pin
}


void lcdData(char dataout)  
{
	LCD_RS = 1;				  // It is data
	LCD_Data_Bus=dataout;
	ToggleEpinOfLCD();
}


void InitLCD(void)
{ 
    LCD_E   	     = 0;      // E = 0
	LCD_RS    	     = 0;      // D = 0
	LCD_Data_Bus     = 0;      // CLK = 0
	LCD_E_Dir        = 0;      // Make Output
	LCD_RS_Dir       = 0;      // Make Output
	LCD_Data_Bus_Dir = 0;      // Make Output
	
	lcdCmd(0x30);		//function set 8 bit line 1, 5x7dots
	lcdCmd(0x38);		//function set 8 bit line 2, 5x7dots
	lcdCmd(0x0C);		//Display ON cursor OFF
	lcdCmd(0x01);		//Clear display and DDRAM content
	lcdCmd(0x06);		//Entry Mode
	lcdCmd(0x80);		//Set Cursor to beginning of first line

}


void lcdString(unsigned char d[])
{
	int i;
	for(i=0;d[i]!='\0';i++)
		{		
			lcdData(d[i]);   // print string on LCD
		}
}


void lcdClr(void)       // Clear the Screen and return cursor to zero position
{
	lcdCmd(0x01);    // Clear the screen
	__delay_ms(2);              // Delay for cursor to return at zero position
}




char* DisplayTimeToLCD( unsigned char* pTimeArray )   // Displays time in HH:MM:SS AM/PM format
{
	//ClearLCDScreen();      // Move cursor to zero location and clear screen
    char timeArr[7];
    char * timeArrPtr = &timeArr;
    lcdCmd(0xC0);
	// Display Hour
    timeArr[0]=(pTimeArray[2]/10)+0x30;
    timeArr[1]=(pTimeArray[2]%10)+0x30;
    
	lcdData( (pTimeArray[2]/10)+0x30 );
	lcdData( (pTimeArray[2]%10)+0x30 );

	//Display ':'
	lcdData(':');

	//Display Minutes
    timeArr[2]=(pTimeArray[1]/10)+0x30;
    timeArr[3]=(pTimeArray[1]%10)+0x30;
    
	lcdData( (pTimeArray[1]/10)+0x30 );
	lcdData( (pTimeArray[1]%10)+0x30 );

	//Display ':'
	lcdData(':');

	//Display Seconds
    timeArr[4]=(pTimeArray[0]/10)+0x30;
    timeArr[5]=(pTimeArray[0]%10)+0x30;
    timeArr[6]='\0';
	lcdData( (pTimeArray[0]/10)+0x30 );
	lcdData( (pTimeArray[0]%10)+0x30 );

	//Display Space
	lcdData(' ');

	// Display mode
	switch(pTimeArray[3])
	{
	case AM_Time:	lcdString("AM");	break;
	case PM_Time:	lcdString("PM");	break;

	//default: lcdData('H');	break;
    
    }
    
    return timeArrPtr;
	
}




void DisplayDateOnLCD( unsigned char* pDateArray )   // Displays Date in DD:MM:YY @ Day format
{
	//lcdCmd(0xC0);   // Move cursor to second line
    lcdCmd(0x94);      

	// Display Date
	lcdData( (pDateArray[1]/10)+0x30 );
	lcdData( (pDateArray[1]%10)+0x30 );

	//Display '/'
	lcdData('/');

	//Display Month
	lcdData( (pDateArray[2]/10)+0x30 );
	lcdData( (pDateArray[2]%10)+0x30 );

	//Display '/'
	lcdData('/');

	//Display Year
	lcdData( (pDateArray[3]/10)+0x30 );
	lcdData( (pDateArray[3]%10)+0x30 );

	//Display Space
	lcdData(' ');

	// Display Day
	switch(pDateArray[0])
	{
	case Monday:	lcdString("MON");	break;
	case Tuesday:	lcdString("TUE");	break;
	case Wednesday:	lcdString("WED");	break;
	case Thursday:	lcdString("THU");	break;
	case Friday:	lcdString("FRI");	break;
	case Saturday:	lcdString("SAT");	break;
	case Sunday:	lcdString("SUN");	break;

	default: lcdString("???");	break;
	}
}