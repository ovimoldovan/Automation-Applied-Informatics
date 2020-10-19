#line 1 "D:/CAN/30321/Ovi si Munte/lab2.c"
#line 15 "D:/CAN/30321/Ovi si Munte/lab2.c"
 int i,k=0;
void main(){
 DDRA |= (1<<5);
 DDRD &= ~(1<<7);
 DDRD &= ~(1<<5);
 DDRB = 0b11111111;

 for(;;){
 if(PIND & (1<<7)) {
 for(i=0;i<10;i++){
 PORTA |= (1<<5);
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
