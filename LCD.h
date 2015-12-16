// Function Declarations for Generic Functions.c

#ifndef __LCD
#define __LCD

// Define Pins

#define LCD_RS 		 RC1
#define LCD_E 		 RC2
#define LCD_Data_Bus 	 PORTD
#define LCD_E_Dir 	 TRISC2
#define LCD_RS_Dir   	 TRISC1
#define LCD_Data_Bus_Dir TRISD


// Constants
#define E_Delay       50  


// Function Declarations
void ToggleEpinOfLCD(void);
void lcdCmd(unsigned char);
void lcdData(unsigned char);
void lcdClr(void);
void InitLCD(void);
void lcdString(unsigned char d[]);
char* DisplayTimeToLCD( unsigned char* pTimeArray );
void DisplayDateOnLCD( unsigned char* pDateArray );


#endif
