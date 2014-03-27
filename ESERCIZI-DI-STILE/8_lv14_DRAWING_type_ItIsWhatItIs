/* 
 Basato su: P_2_3_3_01 — Segue licenza originale.
 Algoritmo modificato per esercizio durante il corso SEI 2014 @ UnirSM — Più info http://goo.gl/59obuO 
 */

// P_2_3_3_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * draw tool. shows how to draw with dynamic elements. 
 * 
 * MOUSE
 * drag                : draw with text
 * 
 * KEYS
 * 1                   : cambia colore
 
 * del, backspace      : clear screen
 * arrow up            : angle distortion +
 * arrow down          : angle distortion -
 * s                   : save png
 * r                   : start pdf recording
 * e                   : stop pdf recording
 */




// volevo aggiungere un file musicale ma non ho trovato il modo, credo si debbano installare librerie apposite

import processing.pdf.*;
import java.util.Calendar;

PImage img; // dichiaro variabile immagine

boolean recordPDF = false;

color col = color(0, 100, 100);  //dichiaro variabile colore

float x = 0, y = 0;
float stepSize = 5.0; 

// modifico testo: estratto da "It is what it is" by Elisa Toffoli
PFont font;
String letters = "I was afraid of too many things but dying to prove I was strong enough - to make my own way - to make it myself - to keep my head up be the one who helps - but it's got me crying , it's got me crawling - I'm so grateful 'cause it's got me knowing, it beats with my heart, the love that we made, shines through my eyes it's out of the maze........";
int fontSizeMin = 5; //cambio da 3 a 5 perchè era troppo piccolo
float angleDistortion = 0.0; // distorce ogni lettera

int counter = 0;


void setup() {
  // use full screen size 
  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100); // cambio modalità colore
  color col = color(280, 100, 100);  //dichiaro variabile colore

  //background(255);
  img = loadImage ("sky.jpg"); //carico l'immagine
  smooth();
  cursor(CROSS);

  image(img, 0, 0); // visualizza l'immagine

  x = mouseX;
  y = mouseY;



  font = createFont("Zapfino", 10);  // ho cambiato il font
  //font = createFont("ArnhemFineTT-Normal",10);
  textFont(font, fontSizeMin);
  textAlign(LEFT);
  fill(col);//


  // load an image in background
  //PImage img = loadImage(selectInput("select a background image"));
  // image(img, 0, 0, width, height);
}


void draw() {

  if (mousePressed) {
    float d = dist(x, y, mouseX, mouseY);
    textFont(font, fontSizeMin+d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x); 

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize;
    }
  }
}


void mousePressed() {
  x = mouseX;
  y = mouseY;
}

void keyPressed() {
  // angleDistortion ctrls arrowkeys up/down 
  if (keyCode == UP) angleDistortion += 0.1;
  if (keyCode == DOWN) angleDistortion -= 0.1; 
  // cambiamenti colore
  if (key == '1')  fill (270, 100, 100); //cambio colore se schiaccio 1
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == DELETE || key == BACKSPACE) background(img); // sparisce il testo ma resti l'immagine
  if (key == '1') fill (260, 100,100);  // cambio colore se rilascio 1

  // ------ pdf export ------
  // press 'r' to start pdf recordPDF and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, timestamp()+".pdf");
      println("recording started");
      recordPDF = true;
      textAlign(LEFT);
      fill(0);
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(255);
    }
  }
}



// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
















