// Drawing tool for movie poster and opening credits
// © Luna Valentini for the course SEI2014 @ UnirSM  
// Didactic purpose, MIT License, March 2014, San Marino

// I'm trying to figure it out how to use classes for my drawing tool
// Now it's only a mess! 
// Totally a WORK IN PROGRESS!
// The main file for this class il called "ScottPilgrim_2" (look for it)


class Trg {
  //Global variables
  float x=0;
  float y=0;
  float speedX = 4;
  float speedY = 3;


  //Constructor - operates just once
  Trg(float _x, float _y) {

    x= _x;
    y= _y;
  }

  //Functions
  void run() {
    display();
    move();
    bounce();
    //gravity();
  }
  
  /*
  void gravity(){
    speedY += 0.2;
  }
  */
  
  void bounce(){
    if (x>width || x<0 ){
      speedX = speedX*-1;
    }
    
    if (y>height || y<0 ){
      speedY = speedY*-1;
    }
    
  }

  void move() {
    x += speedX;
    y += speedY;
  }

  void display() {
    triangle(x, y, 30, 30, 50, 50);
  }
}
