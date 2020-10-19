/*
prob 2
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
                             PORTA &= ~(1<<5);
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
