// define Z-axis input at A0
const int rawZ = A0;
int minZ, maxZ, currentZ;
String string3Spaces = "   ";
unsigned long tm;

void setup() {
  Serial.begin(9600);
  pinMode(Zin, INPUT);
  minZ = analogRead(rawZ);
  maxZ = analogRead(rawZ);
}

void loop() {
  readAndSetZ();
  printZ("minZ", minZ);
  printZ("currentZ", currentZ);
  printZ("maxZ", maxZ);
  printTime();
}

void readAndSetZ() {
  currentZ = analogRead(rawZ);
  if (currentZ < minZ) {
    minZ = currentZ;
  }
  if (currentZ > maxZ) {
    maxZ = currentZ;
  }
}

void printZ (String strZ, int numZ) {
  strZ += ": ";
  strZ += numZ;
  strZ += string3Spaces;
  Serial.print(strZ);
}

void printTime() {
  Serial.print("Time: ");
  tm = millis();
  Serial.println(tm);
  // Delay is every 2 milliseconds since this runs on a 500Hz cycle
  delay(2);
}
