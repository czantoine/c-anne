#include <SoftwareSerial.h>

SoftwareSerial moduleBluetooth(5, 6); // RX, TX

void setup() {
  Serial.begin(9600);
  pinMode(9,OUTPUT); digitalWrite(9,HIGH);
  Serial.println("Enter AT commands:");
  moduleBluetooth.begin(38400);
}

void loop()
{
  if (moduleBluetooth.available())  
  Serial.write(moduleBluetooth.read());
  
  if (Serial.available())  
  moduleBluetooth.write(Serial.read());
}