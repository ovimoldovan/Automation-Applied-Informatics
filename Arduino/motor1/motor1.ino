void setup() {
  // put your setup code here, to run once:
   pinMode( 9, OUTPUT );
   pinMode( 10, OUTPUT );
}

void stanga(){
    digitalWrite( 9, HIGH);
  digitalWrite(10, LOW);
}


void dreapta(){
    digitalWrite( 9, LOW);
  digitalWrite(10, HIGH);
}
void loop() {
  // put your main code here, to run repeatedly:
  stanga();delay(1000);
  dreapta();delay(1000);
}
