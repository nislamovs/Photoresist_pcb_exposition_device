#define _XTAL_FREQ	4000000

void LCDWrite(int LCDData, int RSValue)
{

    PORTC = (LCDData >> 4) & 0x0F;  //  Get High 4 Bits for Output
    RC5 = RSValue;
    RC4 = 1;  RC4 = 0;              //  Toggle the High 4 Bits Out

    PORTC = LCDData & 0x0F;     //  Get Low 4 Bits for Output
    RC5 = RSValue;
    RC4 = 1;  RC4 = 0;              //  Toggle the Low 4 Bits Out

    if ((0 == (LCDData & 0xFC)) && (0 == RSValue))
  __delay_ms(5);
    else
  __delay_us(200);

  }

void LCDInit(){
  __delay_ms(50); //  Wait for LCD to Power Up
    PORTC = 3;                  //  Start Initialization Process
    RC4 = 1;  RC4 = 0;              //  Send Reset Command
__delay_ms(5);
    RC4 = 1; RC4 = 0;              //  Repeat Reset Command
__delay_us(200);
    RC4 = 1;  RC4 = 0;              //  Repeat Reset Command Third Time
__delay_us(200);
    PORTC = 2;                  //  Initialize LCD 4 Bit Mode
    RC4 = 1;  RC4 = 0;
__delay_us(200);
    LCDWrite(0b00101000, 0);    //  LCD is 4 Bit I/F, 2 Line
    LCDWrite(0b00000001, 0);    //  Clear LCD 
    LCDWrite(0b00000110, 0);    //  Move Cursor After Each Character
    LCDWrite(0b00001110, 0);    //  Turn On LCD and Enable Cursor


}


