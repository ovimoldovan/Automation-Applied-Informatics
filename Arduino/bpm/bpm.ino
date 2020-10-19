#include <Wire.h>teams
#include <heltec.h>

int myBPM = 0;

void setup() {
    Heltec.begin(true /*DisplayEnable Enable*/, false /*LoRa Enable*/, true /*Serial Enable*/);
    Heltec.display->clear();
    Serial.begin(9600);
    Wire.begin(9);
    Wire.onReceive(receiveEvent);
}

void receiveEvent(int bytes){
  myBPM = Wire.read();
}


void loop() {

}


void displayBPM(int bytes){
  Heltec.display -> clear();
  Heltec.display -> drawString(0,0, "BPM: ");
  Heltec.display -> drawString(0, 50, String(myBPM));
  Heltec.display -> display();
}
