class Food{
  int x,y;
  int w=5;
 Food(){
   x=int(random(width));
   y=int(random(height));
 }
 
 void update(){
  rectMode(CENTER);
  fill(255,0,0);
  rect(x,y,w,w);
 }
}
