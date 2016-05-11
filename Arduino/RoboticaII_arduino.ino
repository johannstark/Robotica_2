/*
  Los pines digitales en los cuales se encuentra conectado el joystick son
  A1 para el eje x y A0 para el eje y.
*/

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println(leer_ejex());
  delay(10);
  Serial.println(leer_ejey());
  delay(10);
}


int leer_ejex(void){
  return analogRead(A1);
}

int leer_ejey(void){
  return analogRead(A0)+2000;
}
