void init_adc(){
     ADMUX=0b01000111;   //channel ADC7
     ADCSRA = 0b10101111;//IE = ADC bit 3 Auto trigger bit 5
     SFIOR = 0b01000000;

}

int l,h;
int poz = 0,ms = 0,adv;
long value;
float vin,tmp;

int freq, fMin = 20, fMax = 20000, icr, ADCmax = 1023;

int adc(char ch){
ADMUX&=0b11100000;
ADMUX |=ch;
ADCSRA |= (1<<6);
while(ADCSRA&(1<<6));
l = ADCL;
h = ADCH;
return h<<8|l;

}
void adc_isr() iv IVT_ADDR_ADC ics ICS_AUTO {
      l = ADCL;
      h = ADCH;
      adv = h<<8|l;
}

void init_timer0(){
      TCCR0 = 0b00001011; //CTC-3,6,Prescaler 0,1,2
      TCNT0 = 0;
      OCR0 = 125;
      TIMSK |= 0b00000010;
}

void display(int p , int c)
{
    PORTA&=0b11110000;
    PORTC&=0b00000000;
    switch(c){
             case 0: PORTC|=0b00111111;
                     break;
             case 1: PORTC|=0b00000110;
                     break;
             case 2: PORTC|=0b01011011;
                     break;
             case 3: PORTC|=0b01001111;
                     break;
             case 4: PORTC|=0b01100110;
                     break;
             case 5: PORTC|=0b01101101;
                     break;
             case 6: PORTC|=0b01111101;
                     break;
             case 7: PORTC|=0b00000111;
                     break;
             case 8: PORTC|=0b01111111;
                     break;
             case 9: PORTC|=0b01101111;
             }
  switch(p){
         case 1: PORTA|=0b00000001;
                 break;
         case 2: PORTA|=0b00000010;
                 break;
         case 3: PORTA|=0b00000100;
                 break;
         case 4:PORTA|= 0b00001000;
                 break;
         }//Delay_ms(4);
}

void Timer0_ISR() iv IVT_ADDR_TIMER0_COMP ics ICS_AUTO {
     poz++;
     switch(poz)
     {
      case 1: display(1, value%10); break;
      case 2: display(2, (value/10)%10); break;
      case 3: display(3, (value/100)%10); break;
      case 4: display(4, (value/1000)%10); poz=0; break;
     }
/*  value = adc(6);
  OCR2 = value; */
  
  //b
       adv = adc(6);
     freq = (fMax-fMin)/ADCmax*adv+fMin;
     icr = 10000000/freq-1;
     ICR1H = icr>>8;
     ICR1L = icr;
     OCR1BH = (icr/2)>>8;
     OCR1BL = icr/2;
     value = freq/10;
}

void init_Buzzer()
{
   TCCR1A =0b00100010;
   TCCR1B =0b00011010;
}


void init_PWM(){
     TCCR2=0b01101001;
     OCR2 = 63;
}

int func(int x){
int a = (20000-20)/1023;
int b = 20;
return a*x+b;
}


void main() {
     DDRA = 0b00001111;
     DDRC = 0b11111111;

     

     DDRD |=1<<7;
     DDRD |=1<<4;
     init_Buzzer();
     init_timer0();
     init_PWM();
      init_adc();
     SREG |= (1<<7);
     for(;;){

     }



}