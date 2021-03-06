// Drawing tool for movie poster and opening credits
// © Luna Valentini for the course SEI2014 @ UnirSM  
// Didactic purpose, MIT License, April 2014, San Marino


import processing.pdf.*;
import java.util.Calendar;
import controlP5.*;


ControlP5 interfaccia;
boolean recordPDF = false;
float xp = 0; //if I write =Null I declare the box but it's empty
int yp = 0;
color col = color(360, 100, 100);  // color variable
float TrgMinSize = 50;

void setup() {

  size(1280, 720, OPENGL);
  frameRate(30);
  colorMode(HSB, 360, 100, 100); //change color mode
  background(360, 0, 0);
  //strokeWeight(5); 
  stroke(col);
  noFill();
  translate(640, 360); //move the origin of axis in the center of screen

  interfaccia = new ControlP5(this);
  
  // create a group for all the gui element called ADMIN
  Group ADMIN = interfaccia.addGroup("ADMIN")
    .setPosition(10, 20)
    .setWidth(300)
    .setBackgroundHeight(40)
    .setBackgroundColor(color(#FF40E0))
    ;
    
    // create a slider for the TriangleMinSize parameter
  // name, minValue, maxValue, defaultValue, x, y, width, height
  interfaccia.addSlider("TrgMinSize", 20, 500, 50, 10, 10, 100, 14)
  .setGroup(ADMIN)
   ;
}


void draw() {

  if (mousePressed) {
    // it draws a line from current to previous position of the mouse
    line(mouseX, mouseY, pmouseX, pmouseY); 

    color col = color(random(240, 300), 100, 100); // random color between a selected range
    stroke(col);  //every triangle (below) has a different stroke color

    //draws a triangle
    beginShape();
    vertex(mouseX, mouseY); // this is the vertex
    vertex(xp+TrgMinSize, mouseY-10); 
    vertex(xp+TrgMinSize, mouseY-5);
    endShape(CLOSE);
  }

  xp = mouseX;
  yp = mouseY;

  //save frame for animation
  if (key =='s' || key =='S') {
    saveFrame("vstheworld/anim-####.tga");
    println(frameCount);
  }
}


void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(0); 
  // delete what I drew and recall background


  // ------ pdf export ------
  // press 'r' to start pdf recording and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!

  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "####.pdf");
      println("recording started");
      recordPDF = true;
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
    }
  }
}
