#line 1 "D:/CAN/30321/Ovi si Munte/lab_convertoranalogdigital.c"
void init_adc(){
 ADMUX=0b01000111;
 ADCSRA = 0b10101111;
 SFIOR = 0b01000000;

}

int l,h;
int poz = 0,ms = 0,adv, value;
float vin,tmp;

void adc(char ch){
ADMUX&=0b11100000;
ADMUX |=ch;
#line 21 "D:/CAN/30321/Ovi si Munte/lab_convertoranalogdigital.c"
}
void adc_isr() iv IVT_ADDR_ADC ics ICS_AUTO {
 l = ADCL;
 h = ADCH;
 adv = h<<8|l;
}

 void init_INT0(){
 GICR=0b01000000;
 MCUCR=0b00000011;
 }
 void ISR_INT0() iv IVT_ADDR_INT0 ics ICS_AUTO {

}


 void init_timer0(){
 TCCR0 = 0b00001011;
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
 }
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
