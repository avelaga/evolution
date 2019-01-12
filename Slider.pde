class Slider {

  int x, y, currW, fullW;
  int h; // default for now
  int c;
  int rectCorner=5;
  String name;
  int bufferLeftSide;
  int bufferRightSize;
  //Slider(int x, int y, int w, int c, String name) {
  //  this.x=x;
  //  this.y=y;
  //  this.fullW=w;
  //  this.currW=w;
  //  bufferLeftSide=x-20;
  //  bufferRightSize=x+fullW+20;
  //  this.name=name;
  //  this.c=c;
  //}

  Slider(int x, int y, int w,int h, String name) {
    this.x=x;
    this.y=y;
    this.fullW=w;
    this.h=h;
    this.currW=w;
     bufferLeftSide=x-5;
    bufferRightSize=x+fullW+5;
    this.name=name;
    c=150; // default is white
  }

  float update() {
    if (mouseX>bufferLeftSide && mouseX<bufferRightSize &&mouseY>y-5 &&mouseY<y+h+5) { // if clicking this box
      if (mousePressed) {
        this.currW=mouseX-x;
        if(mouseX<x){
         currW=0; 
        }else if(mouseX>x+fullW){
         currW=fullW; 
        }
      }
    }
    return float(currW)/(fullW); // percentage of slider
  }

  void display() {
    textSize(h-4);
    textAlign(RIGHT);
    noStroke();
    fill(c-70); // bigger rect
    rect(x, y, fullW, h, rectCorner);
    fill(c);
    rect(x, y, currW, h, rectCorner); // smaller,more opaque rect
    stroke(2);
    text(name, (x-textWidth(name)/2)-4, y); // centers text left of box
  }
}
