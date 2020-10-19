#include <dht.h>
#include <Servo.h>

Servo myservo;

int val;

dht DHT;

#define DHT11_PIN 7
#define temperatura 28


void setup(){
  Serial.begin(9600);
  pinMode(5, OUTPUT);
  myservo.attach(9);
}

void loop() {
  // put your main code here, to run repeatedly:
int chk = DHT.read11(DHT11_PIN);
Serial.println(DHT.temperature);


  if(DHT.temperature>=temperatura) {
    digitalWrite(5, true);
    myservo.write(180);
  }
  if(DHT.temperature<temperatura) {
    digitalWrite(5, false);
    myservo.write(0);
  }
  delay(1000);
}
