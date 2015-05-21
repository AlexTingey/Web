//Car myCar;
//Car myCar2;
Car[] myCars = new Car[500];
void setup(){
  frameRate(60);
  size(500,500);
  background(255);
  //myCar uses constructor 1
  //myCar = new Car(random(width),random(height));
  //myCar uses constructor 2
  //myCar2 = new Car(random(width), random(height), int(random(100)), color(random(255),random(255),random(255)), random(10));
  for(int i = 0; i < myCars.length;i++){
    myCars[i] = new Car(random(width), random(height), int(random(100)), color(random(255),random(255),random(255)), random(10));
  }
}
void draw(){
  background(255);
  //myCar.display();
  //myCar.drive();
  //myCar2.display();
  //myCar2.drive();
  for(int i = 0; i < myCars.length;i++){
     Car iCarly = myCars[i];
     iCarly.display();
     iCarly.drive(); 
  }
  
}

