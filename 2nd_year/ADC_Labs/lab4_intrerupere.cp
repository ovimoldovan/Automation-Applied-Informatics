#line 1 "D:/CAN/30321/Ovi si Munte/lab4_intrerupere.c"
const short freq = 4;
int ms=0,ms2=0;
int poz=0;
short m=0,s=0;
 void init_timer0(){
 TCCR0 = 0b00001011;
 TCNT0 = 0;
 OCR0 = 124;
 TIMSK|= 0b00000010;
 SREG|=1<<7;
}

void init_timer1(){
 TCCR1A=0b00000000;
 TCCR1B=0b00001100;
 TCNT1H=0;
 TCNT1L=0;
 OCR1AH=31250>>8;
 OCR1AL=31250;
 TIMSK|=0b00010000;;
 SREG|=1<<7;
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
#line 43 "D:/CAN/30321/Ovi si Munte/lab4_intrerupere.c"
switch(p){
case 1: PORTA|=0b00001000;break;
case 2: PORTA|=0b00000100;break;
case 3: PORTA|=0b00000010;break;
case 4: PORTA|=0b00000001;break;
}
}

void ISR_TIM0() iv IVT_ADDR_TIMER0_COMP ics ICS_AUTO {
 if(ms == 3){
 poz++;
 switch(poz){
 case 1:display(4,s%10);break;
 case 2:display(3,(s/10)%10);break;
 case 3:display(2,m%10);break;
 case 4:display(1,(m/10)%10);poz=0;break;
 }
 ms=0 ;
 }
 else ms++;

 if(ms2==999){
 s++;
 ms2=0;
 }
 else ms2++;
 if(s==60){
 m++;
 s=0;
 }
}

void ISR_TIM1() iv IVT_ADDR_TIMER1_COMPA ics ICS_AUTO {

 s++;
 if(s=60){
 s=0;
 m++;
 }
}



void main() {
 DDRA = 0b00001111;
 DDRC = 0b11111111;
 DDRB &= 0b11111110;
 DDRD &= 0b10000000;


 init_timer0();
 init_timer1();
 for(;;){

 }


}
