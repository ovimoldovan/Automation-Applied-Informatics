const short freq = 4;
int ms=0,ms2=0;
int poz=0;
short  m=0,s=0;
 void init_timer0(){
      TCCR0 = 0b00000010; //CTC-3,6,Prescaler 0,1,2
      TCNT0 = 0;
      OCR0 = 124;
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
/*PORTA|=(1<<(p-1));
Delay_ms(freq);
*/

switch(p){
case 1: PORTA|=0b00001000;break;
case 2: PORTA|=0b00000100;break;
case 3: PORTA|=0b00000010;break;
case 4: PORTA|=0b00000001;break;
}
}

void Init_Input_Capture(){
     TCCR1A=0b00000000;
     TCCR1B=0b01000010; //bit6 rising edge, bit0-2 Pre = 8
     TIMSK |= 1<<5;     //input capture interrupt enable
     TIMSK |= 1<<2;    //overflow interrupt enable
}
long trot = 0;
void IC_ISR() iv IVT_ADDR_TIMER1_CAPT ics ICS_AUTO{
     TCNT1H=0;
     TCNT1L=0;
     icr_l = ICR1L;
     icr_h = ICR1H;
     trot = (((icr_h << 8) | icr_l) + 65536*cycle)*1*2; //long //microsec
     rpm = 60000000/trot;
     cycle = 0;
}

void COMP_ISR() iv IVT_ADDR_TIMER1_OVF ics ICS_AUTO{
     cycle++;
}

void ISR_tim0() iv IVT_ADDR_TIMER0_COMP ics ICS_AUTO
{poz++;
switch(poz)
{ case 1: display(1,value%10); break;
  case 2: display(2,(value/10)%10); break;
  case 3: display(3,(value/100)%10); break;
  case 4: display(4,(value/1000)%10);poz=0;break;
}
}





void main() {
     DDRA = 0b00001111;
     DDRC = 0b11111111;
     DDRD &=~(1<<6); //PD6 input
     //sei();
     //SREG|=1<<7;
     init_timer0();
     Init_Input_Capture();
     for(;;){

     }
     //cli();
     //SREG&=~(1<<7);
}