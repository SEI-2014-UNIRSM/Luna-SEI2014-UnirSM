// Drawing tool for movie poster and opening credits
// © Luna Valentini for the course SEI2014 @ UnirSM  
// Didactic purpose, MIT License, March 2014, San Marino



int xp = 0; //if I write =Null I declare the box but it's empty
int yp = 0;

color col = color(360, 100, 100);  // color variable

void setup() {
  size(1280, 720);
  frameRate(30);
  colorMode(HSB, 360, 100, 100); //change color mode
  background(360, 0, 0);
  //strokeWeight(5); 
  stroke(col);
  noFill();
  
}

void draw() {
  if (mousePressed) {
    // with mouse pressed it draws a shape
  
    color col = color(random(240, 300), 100, 100); // random color between a selected range
    stroke(col);  //every ellipse has a different stroke color
    
    beginShape();
    vertex(mouseX, mouseY); // this create the trail
    vertex(xp*2, yp*2);
    vertex(xp+10, yp+10);
    vertex(xp, yp);
    endShape(CLOSE);

    
  }
  
  xp = mouseX;
  yp = mouseY;
  
 
  //save frame for animation
  //println(frameCount);
  //saveFrame("Animation01/anim-####.png");
}

// delete what I drew and recall background
void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(0);
}
