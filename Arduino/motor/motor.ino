int motor1Pin = 6;
int motor2Pin = 3;
int v5 = 8;

int trigPin = 4;
int echoPin = 2;
 
void setup() 
{ 
  pinMode(motor1Pin, OUTPUT);
  pinMode(motor2Pin, OUTPUT);
  pinMode(v5, OUTPUT);
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
pinMode(echoPin, INPUT); // Sets the echoPin as an Input
  Serial.begin(9600);
  
} 

 long duration;
int distance;
int k = 0;
 
void loop() 
{ 
  //digitalWrite(v5, 1);
  

 digitalWrite(trigPin, LOW);
delayMicroseconds(2);
// Sets the trigPin on HIGH state for 10 micro seconds
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
// Reads the echoPin, returns the sound wave travel time in microseconds
duration = pulseIn(echoPin, HIGH);
// Calculating the distance
distance= duration*0.034/2;
// Prints the distance on the Serial Monitor
Serial.print("Distance: ");
Serial.println(distance);
delay(100);
if(distance>=30){
    analogWrite(motor1Pin, 250);
  analogWrite(motor2Pin, 230);
  }
  else
  if(distance<30 && distance >=15){
           analogWrite(motor1Pin, 250);
  analogWrite(motor2Pin, 0);
  }
  else
  {
    analogWrite(motor1Pin, 0);
  analogWrite(motor2Pin, 0);
  //k++;
  }
}


