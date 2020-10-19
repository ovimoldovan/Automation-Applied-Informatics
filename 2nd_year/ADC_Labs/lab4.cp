#line 1 "D:/CAN/30321/Ovi si Munte/lab4.c"
const short freq = 4;
int ms=0;
short m=0,s=0;
 void init_timer(){
 TCCR0 = 0b00000011;
 TCNT0 = 0;
}
void display(char p, char c){
PORTA&=0b11110000;
PORTC&=0b00000000;
switch(c){
 case 0: PORTC|=0b00111111;break;
 case 1: PORTC|=0b00000110;break;
 case 2: PORTC|=0b01011011;break;
 case 3: PORTC|=0b01001111;break;
 case 4: PORTC|=0b01100110;break;
 case 5: PORTC|=0b01101101;break;
 case 6: PORTC|=0b01111101;break;
 case 7: PORTC|=0b00000111;break;
 case 8: PORTC|=0b01111111;break;
 case 9: PORTC|=0b01101111;break;
}
#line 27 "D:/CAN/30321/Ovi si Munte/lab4.c"
switch(p){
case 1: PORTA|=0b00001000;break;
case 2: PORTA|=0b00000100;break;
case 3: PORTA|=0b00000010;break;
case 4: PORTA|=0b00000001;break;
}
}

void main() {
 DDRA = 0b00001111;
 DDRC = 0b11111111;
 DDRB &= 0b11111110;
 DDRD &= 0b10000000;
 init_timer();
 for(;;){
 if(PINB==(1<<0)){
 ms = 0; s = 0; m = 0;}
 if(PIND==(1<<7)){
 if(s>9) s = s / 10 * 10;
 else s=0;
 }
 if(TCNT0>=125)
 {
 TCNT0 = 0;
 ms++;
 if(ms>=1000){
 ms=0;
 s++;
 }
 if(s>=60){
 s = 0;
 m++;
 }
 }
 display(4,s%10);
 display(3,s/10%10);
 display(2,m%10);
 display(1,m/10%10);
 }
}
