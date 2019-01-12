class Blob {
  int x, y, size, health,change,age;
  float dir;
  int maxsize=80;
  Blob() {
    x=int(random(width));
    y=int(random(height));
    size=int(random(2, maxsize-5));
    dir=(random(0,PI*2));
    change=0;
    health=1000;
    age=0;
  }
  
  Blob(int s) {
    x=int(random(width));
    y=int(random(height));
    size=s;
    dir=(random(0,PI*2));
    change=0;
    health=1000;
    age=0;
  }

  // return -1 if dead, 0 if alive, 1 if alive and reproducing
  int update() {
   age++;
    health--;
    change++;
    if(change%23==0){
      dir=(random(0,PI*2));
    }
    //float xspeed=map(noise(x), 0, 1, -1, 1);
    //float yspeed=map(noise(y), 0, 1, -1, 1);
    //println("xspeed: "+xspeed);
    //println("yspeed: "+yspeed);
    
    // get x and y speed based on chosen random direction
    float xspeed=cos(dir);
    float yspeed=sin(dir);
    
    yspeed*=(maxsize-size);
    xspeed*=(maxsize-size);
    
    xspeed/=5;
    yspeed/=5;
    x+=xspeed;
    y+=yspeed;
    
    //bounds
    if (x<0) {
      x=width;
    } else if (x>width) {
      x=0;
    }

    if (y<0) {
      y=height;
    } else if (y>height) {
      y=0;
    }
    
    //float fill=map(health,0,1000,255,0);
    //println(fill);
    //fill(fill);
    
    ellipse(x,y,size,size);
    fill(0,255,0);
    textAlign(CENTER,CENTER);
    text(age,x,y);
    if(health<=0){
      return -1;
    }
    
     if(age==1250){
      return 1;
    }
    
    return 0;
    
  }
}
