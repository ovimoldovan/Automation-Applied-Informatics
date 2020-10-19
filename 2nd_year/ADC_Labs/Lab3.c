int val = 1000;
char k;
const char freq = 2;
void display_p(){
     //PORTA&=0b11110000;
     //PORTC&=0b00000000;
     //for(;;){
             PORTA|=(1<<0);
             PORTC=0b01111100;
             Delay_ms(2);
             PORTA|=(1<<1);
             PORTC=0b00110000;
             Delay_ms(2);
             PORTA|=(1<<2);
             PORTC=0b01011100;
             Delay_ms(2);
             PORTA|=(1<<3);
             PORTC=0b01011000;
             Delay_ms(2);
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
PORTA|=(1<<(p-1));
Delay_ms(freq);
}

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