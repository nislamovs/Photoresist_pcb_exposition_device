#include <pic.h>
#include <htc.h>
#include "lcd.h"

//__CONFIG(INTIO & WDTDIS & PWRTEN & MCLRDIS & UNPROTECT \
//  & UNPROTECT & BORDIS & IESODIS & FCMDIS);

#define _XTAL_FREQ	4000000
#define DelayS(T) {for(int z=0;z<T*10;z++) __delay_ms(100);}

int n=0, x=0, y=0, p, j, q;

unsigned char mas[6], mas2[6], mas3[6], flag=0, t1=0, t2=0, t3=0, t4=0;
//bit zju=0; proverka na zaderzku
Sbros(){

flag=0;
RB6=0;
RB7=0;

buzz2();
buzz2();
buzz2();

TRISA=0b11101111;
RB4=0;
PORTA=0b00010000;
}

Increment(){
for(;;){

TRISA=0b11101111;
RB4=0;
PORTA=0b00010000;

if (RA3==1){			//#   Start/pauza
n=0;
while (RA3==1){
if (n==100)
{
resume:;
buzz1();
buzz1();
if (flag==2){ 
flag=1;					//resume
RB6=1;
RB7=1;
goto otschet;
}

if (flag==1){ 
flag=2;					//pauza
RB6=0;
RB7=0;
LCDWrite(1, 0);
LCDWrite(' ', 1);
LCDWrite(' ', 1);
for(j=1;j<6;j++){
n=mas2[j];
LCDWrite(n, 1);
}
LCDWrite(192, 0);
LCDWrite('>', 1);
LCDWrite(' ', 1);
for(j=1;j<6;j++){
n=mas3[j]+48;
LCDWrite(n, 1);
}

for(;;){
__delay_ms(5);
if (RA3==1){			//vozobnovitj
n=0;
while (RA3==1){
if (n==100)
{
goto resume;
}
__delay_ms(2);
n++;
}}


TRISA=0b11111011;
RB4=0;
PORTA=0b00000100;

__delay_ms(5);

if (RA3==1){			//sbros
n=0;
while (RA3==1){
if (n==100)
{
// Sbros();
goto end;
}
__delay_ms(2);
n++;
}}

TRISA=0b11101111;
RB4=0;
PORTA=0b00010000;

}
}
}
__delay_ms(2);
n++;
}}
/////////////////////////////////////////////////////////////////////////////////

otschet:;
LCDWrite(1, 0);
Message2();
if ((mas3[1]||mas3[2]||mas3[4]||mas3[5])==0){goto end;}

t4=mas3[5];
if(t4>0)
{
t4--;
mas3[5]=t4;
}
else{
t4=9;
mas3[5]=t4;
t3=mas3[4];
if(t3>0){
t3--;
mas3[4]=t3;
}
else{
t3=5;
mas3[4]=t3;
t2=mas3[2];
if(t2>0){
t2--;
mas3[2]=t2;
}
else{
t2=9;
mas3[2]=t2;
t1=mas3[1];
if(t1>0){
t1--;
mas3[1]=t1;
}}}}

t1=mas3[1]+48;
LCDWrite(t1, 1);
t1=mas3[2]+48;
LCDWrite(t1, 1);
LCDWrite('-', 1);
t1=mas3[4]+48;
LCDWrite(t1, 1);
t1=mas3[5]+48;
LCDWrite(t1, 1);

__delay_ms(150);
__delay_ms(150);
__delay_ms(150);
__delay_ms(150);
__delay_ms(150);
__delay_ms(150);
__delay_ms(92);

//proverka na zaderzku
//zju=~zju;
//RB6=zju;
}


end:;

}


Message1(){
LCDWrite('T', 1);
LCDWrite('i', 1);
LCDWrite('m', 1);
LCDWrite('e', 1);
LCDWrite(':', 1);
LCDWrite(192, 0);
}

Message2(){
LCDWrite('R', 1);
LCDWrite('e', 1);
LCDWrite('m', 1);
LCDWrite('a', 1);
LCDWrite('i', 1);
LCDWrite('n', 1);
LCDWrite(':', 1);
LCDWrite(192, 0);
}

buzz1(){
for(q=0;q<100;q++){
RB5=1;
__delay_us(150);
__delay_us(150);
__delay_us(150);
__delay_us(50);
RB5=0;
__delay_us(150);
__delay_us(150);
__delay_us(150);
__delay_us(50);
}
__delay_ms(100);
}

buzz2(){
for(q=0;q<300;q++){
RB5=1;
__delay_ms(1);
RB5=0;
__delay_ms(1);
}
__delay_ms(197);
}


main()
{

    ANSEL = 0;                  //  Turn off ADC
    TRISC = 0b00000000;                  //  All of PORTC are Outputs
 	PORTC = 0b00000000;                  //  Start with Everything Low
  
	LCDInit();

	Message1();

TRISB=0b00000000;
PORTB=0b00000000;		//buzzer molchit, rele otklucheno, diod ne gorit
						//RB5 - buzer
						//RB6 - rele
						//RB7 - diod
start:;
x=0; 
y=0;	
Sbros();						
for(;;){

__delay_ms(5);

TRISA=0b11111110;
TRISB=0b00000000;
PORTA=0b00000001;

__delay_ms(5);
if (RA1==1){			//2	
n=0;
while (RA1==1){
if (n==100)
{
if (x<5){
LCDWrite(50, 1);
x++;
mas[x]=50;		
}
else goto end;
}
__delay_ms(2);
n++;
}}

if (RA3==1){			//0	
n=0;
while (RA3==1){
if (n==100)
{
if (x<5){
LCDWrite(48, 1);
x++;
mas[x]=48;		
}
else goto end;
}
__delay_ms(2);
n++;
}}

if (RA5==1){			//8	
n=0;
while (RA5==1){
if (n==100)
{
if (x==3) goto end;
if (x==0) goto end;
if (x<5){
LCDWrite(56, 1);
x++;
mas[x]=56;		
}
else goto end;
}
__delay_ms(2);
n++;
}}

__delay_ms(5);

TRISA=0b11101111;
TRISB=0b00000000;
PORTA=0b00010000;

__delay_ms(5);

if (RA1==1){			//3	
n=0;
while (RA1==1){
if (n==100)
{
if (x<5){
LCDWrite(51, 1);
x++;
mas[x]=51;		
}
else goto end;
}
__delay_ms(2);
n++;
}}

if (RA5==1){			//9	
n=0;
while (RA5==1){
if (n==100)
{
if (x==3) goto end;
if (x==0) goto end;
if (x<5){
LCDWrite(57, 1);
x++;
mas[x]=57;		
}
else goto end;
}
__delay_ms(2);
n++;
}}

if (RA3==1){			//#   Start/pauza
n=0;
while (RA3==1){
if (n==100)
{
if (x>4){
for(j=0;j<6;j++) mas2[j]=mas[j];
buzz1();
buzz1();
flag=1;
RB6=1;
RB7=1;
for(j=0;j<6;j++){
q=mas2[j]-48;
mas3[j]=q;
}
Increment();
LCDWrite(1,0);
Message1();
goto start;
}
}
__delay_ms(2);
n++;
}}

if(RA3==1) {

}

__delay_ms(5);

TRISA=0b11111011;
TRISB=0b00000000;		//bilo 1
PORTA=0b00000100;

__delay_ms(5);

if (RA1==1){			//1	
n=0;
while (RA1==1){
if (n==100)
{
if (x<5){
LCDWrite(49, 1);
x++;
mas[x]=49;		
}
else goto end;
}
__delay_ms(2);
n++;
}}

if (RA3==1){			//clear symbol
n=0;
while (RA3==1){
if (n==100)
{
if (x==3){
x=x-1;
}
if (x>0){
x--;
LCDWrite(1, 0);
Message1();
y=1;
loop:;
if(y<x+1){
p=mas[y];
LCDWrite(p, 1);
y++;
goto loop;
}}
else goto end;
}
__delay_ms(2);
n++;
}}

if (RA5==1){			//7	
n=0;
while (RA5==1){
if (n==100)
{
if (x==3) goto end;
if (x==0) goto end;
if (x<5){
LCDWrite(55, 1);
x++;
mas[x]=55;		
}
else goto end;
}
__delay_ms(2);
n++;
}}

__delay_ms(5);

TRISA=0b11111111;
TRISB=0b00000000;
RB4=1;

__delay_ms(5);

if (RA0==1){			//5	
n=0;
while (RA0==1){
if (n==100)
{
if (x<5){
LCDWrite(53, 1);
x++;
mas[x]=53;		
}
else goto end;
}
__delay_ms(2);
n++;
}}

if (RA4==1){			//6	
n=0;
while (RA4==1){
if (n==100)
{
if (x==3) goto end;
if (x==0) goto end;
if (x<5){
LCDWrite(54, 1);
x++;
mas[x]=54;		
}
else goto end;
}
__delay_ms(2);
n++;
}}

if (RA2==1){			//4	
n=0;
while (RA2==1){
if (n==100)
{
if (x<5){
LCDWrite(52, 1);
x++;
mas[x]=52;		
}
else goto end;
}
__delay_ms(2);
n++;
}}


if (RA1==1) {
//Dial();
}
//if (x>0){
//x--;
//__delay_ms(100);	//clear symbol   (sejchazz eto knopka "zvonitj")
//LCDWrite(0b00000001, 0);
//y=1;
//loop:;
//if(y<x+1){
//p=mas[y];
//LCDWrite(p, 1);
//y++;
//goto loop;
//}

//}
//else goto end;


end :;
if (x==2){
LCDWrite('-', 1);
x++;
mas[x]='-';	
}
__delay_ms(5);
RB4=0;



} //end of cycle for

 






}


  //  End cLCD
