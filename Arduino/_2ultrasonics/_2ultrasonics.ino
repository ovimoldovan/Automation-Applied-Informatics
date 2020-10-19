int trigPin = 13;
int echoPin = 12;
int trigPin2 = 10;
int echoPin2 = 11;


void setup() {
  Serial.begin (9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(trigPin2, OUTPUT);
  pinMode(echoPin2, INPUT);
}

void sensor(int trigPin, int echoPin){
    long duration, distance;
  digitalWrite(trigPin, LOW);  // Added this line
  delayMicroseconds(2); // Added this line
  digitalWrite(trigPin, HIGH);
//  delayMicroseconds(1000); - Removed this line
  delayMicroseconds(10); // Added this line
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance = (duration/2) / 29.1;
      Serial.print(distance);
    Serial.println(" cm");
  
}

void loop() {
  Serial.print("Sensor 1 ");
  sensor(trigPin, echoPin);
  Serial.print("Sensor 2 ");
  sensor(trigPin2, echoPin2);
  delay(1000);
}
