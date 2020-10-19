//display function; may be inverse
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

//lab2



/*
prob 2
Program care sa aprinda si sa stinga becul in functie de starea butonului.

void main() {
           DDRC |= (1<<7);
           DDRC&=~(1<<0);
           //PORTC |= (1<<0);
           for(;;){
                   PORTC |=(1<<7);
                   Delay_ms(500);
                   PORTC&=~(1<<7);
                   Delay_ms(500);
           }
           
}           */
     int i,k=0;
	 
//La apasarea butonului PD7, LED-ul PA5 sa clipeasca de 10 ori.
//La apasarea butonului PD5, sa se incrementeze un contor si sa se afiseze valoarea lui in binar pe ledurile PB0-PB7.

void main(){
     DDRA |= (1<<5);
     DDRD &= ~(1<<7);
     DDRD &= ~(1<<5);
     DDRB = 0b11111111;

     for(;;){
             if(PIND & (1<<7)) {
                     for(i=0;i<10;i++){
                             PORTA |= (1<<5); //aprinde ledu
                             Delay_ms(200);
                             PORTA &= ~(1<<5); //stinge ledu
                             Delay_ms(200);
                             }
             }
             if(PIND & (1<<5)) {
                    k++;
                    Delay_ms(300);
                    PORTB = k;
             }
     }
}



//lab3 - display 
//incrementare la buton

void display_V(){
     int copie = val;
     int i = 1;
     while(copie){
     display(i,copie%10);
     copie=copie/10;
     i++;
     }
}


void main(){
     DDRA|=0b00001111;
     DDRC|=0b11111111;
     DDRB|=0b10101111;
     /*  for(;;){
       PORTA=(1<<0);
       PORTC=0b00000111;
       Delay_ms(2);
       PORTA=(1<<1);
       PORTC=0b00000110;
       Delay_ms(2);
       PORTA=(1<<2);
       PORTC=0b00111111;
       Delay_ms(2);
       PORTA=(1<<3);
       PORTC=0b01011011;
       Delay_ms(2);
       } */
       for(;;){

       if(PINB&(1<<4)){
       display_p();
       //Delay_ms(100);
       }
       else{
       /*

       display(1,7);
       display(2,1);
       display(3,0);
       display(4,2);
        */
       if(!(PINB&(1<<6))){
       k =0;
       }
       if(PINB&(1<<6)&& k==0){
       if(PINA&(1<<6)){val--;
       }
       else
       val++;
       k=1;
       }

       display_V();
       }
       }
}



//lab4 - ceas cu timer
//lab4 prof

//#include <avr/io.h>

int s=0,ms=0,m=0;

void display(char p, char c)
{
 PORTA &= 0b11110000;
 PORTC &= 0b00000000;

  switch(c){
     case 0: PORTC|=0b00111111; break;
     case 1: PORTC|=0b00000110; break;
     case 2: PORTC|=~0b10100100; break;
     case 3: PORTC|=~0b10110000; break;
     case 4: PORTC|=~0b10011001; break;
     case 5: PORTC|=~0b10010010; break;
     case 6: PORTC|=~0b10000010; break;
     case 7: PORTC|=~0b11111000; break;
     case 8: PORTC|=~0b10000000; break;
     case 9: PORTC|=~0b10010000; break;
  }
  switch(p){
      case 1: PORTA|=0b00001000; break;
      case 2: PORTA|=0b00000100; break;
      case 3: PORTA|=0b00000010; break;
      case 4: PORTA|=0b00000001; break;
  }
  // Delay_ms(1); // #include <util/delay.h>
}

void init_timer()
{
        TCCR0 = 0b00000011; //prescaler 64
        TCNT0 = 0; //init timer la 9
}

void main()
{
  DDRA = 0b00001111;
  DDRC = 0b11111111;
  init_timer();
        for(;;){
                if(TCNT0>=125) //implinirea unei milisecunde
                {
                TCNT0=0;       //resetarea timerului
                ms++;
                        if(ms==1000)  //implinirea unei secunde
                        {
                        ms=0;
                        s++
                        }
			if(ms==1000)  //implinirea unui minut
                        {
                        s=0;
                        m++
                        }
                        
                }
                //afisarea minutelor si a secundelor
                display(1,s%10);
                display(2,(s/10)%10);
                display(3,m%10);
                display(4,(m/10)%10);
        }
}


//lab5 - ceas cu intrerupere
//prof - timer0 ceas si timer1 ocr
void init_timer()
{
        TCCR0 = 0b00001011; //CTC-3,6, Prescaler-0,1,2
        TCNT0 = 0;
        OCR0 = 125;
        TIMSK |= 0b00000010;//set interrupt OCM
}


void Timer0_ISR() iv IVT_ADDR_TIMER0_COMP{
digit++;
        switch(digit)
        {       case 1: display(4,s%10);break;
                case 2: display(3,(s/10)%10);break;
                case 3: display(2,(m%10);break;
                case 4: display(1,(m/10)%10); digit=0;break;
                }
		if (ms==1000){
               	 	s++;
			if(s==60)
			{
				s=0; 
				m++;
			}
			ms=0;
        	}
        	else ms++;

		

}

void main()
{
  DDRA = 0b00001111;  //seteaza pinii de iesire
  DDRC = 0b11111111;

  init_timer();
  SREG_I_bit=1;        //Set Enable Interrupt

        for(;;){

        }
}


//noi

 void init_timer0(){
      TCCR0 = 0b00001011; //CTC-3,6,Prescaler 0,1,2
      TCNT0 = 0;
      OCR0 = 125;
      TIMSK |= 0b00000010; //output compare interrupt enable (timer0)
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

void Timer0_ISR() iv IVT_ADDR_TIMER0_COMP{
if( ms == 500){
    value = rpm;
    ms = 0;
}
else ms++;
{poz++;
switch(poz)
{ case 1: display(1,value%10); break;
  case 2: display(2,value/10%10); break;
  case 3: display(3,value/100%10); break;
  case 4: display(4,value/1000%10);poz=0;break;
}
}
}


void main() {
     DDRA = 0b00001111;
     DDRC = 0b11111111;
     DDRD &=~(1<<6); //PD6 input
     //sei();
     SREG|=1<<7;
     init_timer0();
     Init_Input_Capture();
     for(;;){

     }
     //cli();
     //SREG&=~(1<<7);
}

//lab6 - prof - external interrupt cooler

//lab7 adc / can - lm35 temperatura (prof cu interrupt/fara)
//noi
void init_adc(){
     ADMUX=0b01000111;   //channel ADC7
     ADCSRA = 0b10101111;//IE = ADC bit 3 Auto trigger bit 5
     SFIOR = 0b01000000; //External interrupt request 0
     
}

int l,h;
int poz = 0,ms = 0,adv, value;
float vin,tmp;

void adc(char ch){
ADMUX&=0b11100000;
ADMUX |=ch;
//ADCSRA |= (1<<6);
/*while(ADCSRA&(1<<6));
l = ADCL;
h = ADCH;
*/
//return h<<8|l;
}
void adc_isr() iv IVT_ADDR_ADC ics ICS_AUTO {
      l = ADCL;
      h = ADCH;
      adv = h<<8|l;
}

 void init_INT0(){
      GICR=0b01000000;      //IE INT 0
      MCUCR=0b00000011;   //rising edge
 }
 void ISR_INT0() iv IVT_ADDR_INT0 ics ICS_AUTO {
 
}


 void init_timer0(){
      TCCR0 = 0b00001011; //CTC-3,6,Prescaler 0,1,2
      TCNT0 = 0;
      OCR0 = 125;
      TIMSK |= 0b00000010;
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
     if(ms==100)
     {
      //value = adc(7);
      //adc(7);
      vin = ((float)adv*5)/1024;
      tmp = vin*1000/10;
      value = (int)(tmp*10);
      ms = 0;
     }
     else ms++;
}

void main() {
     DDRA = 0b00001111;
     DDRC = 0b11111111;
     init_timer0();
     init_INT0();
     init_adc();
     SREG |= (1<<7);
     for(;;){

     }
     
     
     
}

//lab8 - pwm
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









//analog digital converter - lab9
int adc(char ch){
ADMUX&=0b11100000;
ADMUX |=ch;
ADCSRA |= (1<<6);
while(ADCSRA&(1<<6));
l = ADCL;
h = ADCH;
return h<<8|l;
}

//lab 9 adc interrupt
void adc_isr() iv IVT_ADDR_ADC ics ICS_AUTO {
      l = ADCL;
      h = ADCH;
      adv = h<<8|l;
}

//lab 9 timer
void init_timer0(){
      TCCR0 = 0b00001011; //CTC-3,6,Prescaler 0,1,2
      TCNT0 = 0;
      OCR0 = 125;
      TIMSK |= 0b00000010;
}
//lab 9 interrupt timer

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
 /*      adv = adc(6);
     freq = (fMax-fMin)/ADCmax*adv+fMin;
     icr = 10000000/freq-1;
     ICR1H = icr>>8;
     ICR1L = icr;
     OCR1BH = (icr/2)>>8;
     OCR1BL = icr/2;
     value = freq/10;*/
     
     if(ms>=20){       //O perioada are 20 elemente => T = 20*50 = 1Hz
      OCR2 = sinus[i++];
           if(i==20)
                    i=0;
           ms=0;
     }
     else ms++;
}

//lab 9 buzzer

void init_Buzzer()
{
   TCCR1A =0b00100010;
   TCCR1B =0b00011010;
}

//lab 9 pwm
void init_PWM(){
     TCCR2=0b01101001;
     OCR2 = 63;
}
//lab 9 main

void main() {
     DDRA = 0b00001111;
     DDRC = 0b11111111;



     DDRD |=1<<7;
     DDRD |=1<<4;
     //init_Buzzer();
     init_timer0();
     init_PWM();
      init_adc();
     SREG |= (1<<7);
     for(;;){

     }



}
