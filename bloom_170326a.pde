int i = 0;
int stalkWidth = 10;
int step = 0;

int stalkHeightStep0 = 0;
int stalkHeightStep1 = 200;
int stalkHeightStep2 = 400;
int stalkHeightStep3 = 600;

int stalkHeightLimit = 0;

Plant p0,p1,p2,p3,p4,p5;

void setup() {
  background(255,247,239);
  fullScreen();
  frameRate(30);
  colorMode(RGB,256);
  p0 = new Plant(-5,255,127,191);
  p1 = new Plant(width/5-5,255,163,163);
  p2 = new Plant(width/5*2-5,163,255,163);
  p3 = new Plant(width/5*3-5,255,100,255);
  p4 = new Plant(width/5*4-5,255, 191, 127);
  p5 = new Plant(width-5,191,127,255);
}

void draw() {
  noStroke();
  background(255,247,239);
  stroke(0, 255, 255);
  //drawStalk(191,255,127,500,height,i);
  p0.showStalk();
  p1.showStalk();
  p2.showStalk();
  p3.showStalk();
  p4.showStalk();
  p5.showStalk();
  
  switch(step) { 
  case 0:
    stalkHeightLimit = stalkHeightStep0;
    break;
  case 1: 
    stalkHeightLimit = stalkHeightStep1;
    break;
  case 2: 
    stalkHeightLimit = stalkHeightStep2;
    break;
  default:
    stalkHeightLimit = stalkHeightStep3;
    break;
  } 
  
  if(i > -stalkHeightLimit){
    i -= 5;
  }
  if(i <= - stalkHeightStep2){
    //drawLeaf(500,height - stalkHeightStep2,30);
    p0.showLeftLeaf(height - stalkHeightStep2);
    p1.showRightLeaf(height - stalkHeightStep2);
    p2.showLeftLeaf(height - stalkHeightStep2);
    p3.showRightLeaf(height - stalkHeightStep2);
    p4.showLeftLeaf(height - stalkHeightStep2);
    p5.showRightLeaf(height - stalkHeightStep2);
  }
  if(i <= - stalkHeightStep1){
    //drawLeaf(510,height - stalkHeightStep1,150);
    p0.showRightLeaf(height - stalkHeightStep1);
    p1.showLeftLeaf(height - stalkHeightStep1);
    p2.showRightLeaf(height - stalkHeightStep1);
    p3.showLeftLeaf(height - stalkHeightStep1);
    p4.showRightLeaf(height - stalkHeightStep1);
    p5.showLeftLeaf(height - stalkHeightStep1);
  }
  if(i <= -stalkHeightStep3){
    //drawFlower(255,163,163,505,height - stalkHeightStep3);
    p0.showFlower();
    p1.showFlower();
    p2.showFlower();
    p3.showFlower();
    p4.showFlower();
    p5.showFlower();
  }
}

void drawLeaf(int originX,int originY,int rotate){
  drawDrop(191,255,127,originX,originY,rotate,100,5);
}

void drawFlower(int red,int green,int blue,int originX,int originY){
  drawDrop(red,green,blue,originX,originY,30,130,4);
  drawDrop(red,green,blue,originX,originY,90,130,4);
  drawDrop(red,green,blue,originX,originY,150,130,4);
  drawDrop(red,green,blue,originX,originY,210,130,4);
  drawDrop(red,green,blue,originX,originY,270,130,4);
  drawDrop(red,green,blue,originX,originY,330,130,4);
}

void drawDrop(int red,int green,int blue,int originX,int originY,int rotate, int dropLength,int dropWidth){
  float r;
  int R = dropLength;
  int A = dropWidth;
  
  stroke(red,green,blue);
  fill(red,green,blue);
  pushMatrix();
  translate(originX,originY);
  rotate(radians(rotate));
  
  beginShape();
  for (float t = 0; t < TWO_PI; t += 0.05) {
    r = 1 / (A * sin(t/2)+1);
    vertex( R * r * cos(t)-R, R * r * sin(t));
  }
  endShape(CLOSE);
  popMatrix();
}

void drawStalk(int red,int green,int blue,int originX,int originY,int stalkHeight){
  noStroke();
  fill(red,green,blue);
  rect(originX,originY,stalkWidth,stalkHeight);
}

void mousePressed() {
  step += 1;
}

class Plant {
  int originX,red,green,blue;
  
  Plant(int _originX,int _red,int _green,int _blue){
    originX = _originX;
    red = _red;
    green = _green;
    blue = _blue;
  }
  
  void showLeftLeaf(int originY){
    drawLeaf(originX,originY,30);
  }
  
  void showRightLeaf(int originY){
    drawLeaf(originX,originY,150);
  }
  
  void showFlower(){
    drawFlower(red,blue,green,originX + 5,height - stalkHeightStep3);
  }
  
  void showStalk(){
    drawStalk(191,255,127,originX,height,i);
  }
}