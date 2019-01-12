ArrayList<Blob> blobs;
ArrayList<Food> allFood;
int foodVal=200;
int frames;
int sizeTotal, maxSize, minSize, oldest;
float foodFreq=30;
Slider slider;
int oldestEver;
void setup() {
  frames=0;
  size(600, 600);
  blobs=new ArrayList<Blob>();
  for (int x=0; x<100; x++) {
    blobs.add(new Blob());
  }
  allFood=new ArrayList<Food>();
  //slider=new Slider(width/2, 20, 80, 30, "food freq");
  oldestEver=0;
}

void draw() {
  background(255);
  //foodFreq=slider.update();
  //slider.display();
  frames++;


  if (frames%foodFreq==0) {
    allFood.add(new Food());
  }

  for (Food f : allFood) {
    f.update();
  }

  ArrayList<Blob> removeBlobs=new ArrayList<Blob>();
  ArrayList<Blob> addBlobs=new ArrayList<Blob>();
  oldest=0;
  textSize(10);
  for (Blob b : blobs) {
    if (b.age>oldest) {
      oldest=b.age;
    }
    if (b.age==oldest) {
      float fill=map(b.health, 0, 1000, 0, 255);
      fill(255, 0, 0, fill);
    } else {
      float fill=map(b.health, 0, 1000, 0, 255);
      fill(0, fill);
    }



    int val=b.update();
    if (val==-1) {
      removeBlobs.add(b);
    } else if (val==1) {
      addBlobs.add((new Blob(b.size)));
      addBlobs.add((new Blob(b.size)));
      //println("A BABY WAS BORN");
    }
  }

  blobs.addAll(addBlobs);

  for (Blob b : removeBlobs) {
    blobs.remove(b);
  }

  checkCollision();
  textAlign(LEFT);
  textSize(10);
  fill(0, 0, 255);
  text("generation: "+frames/1250, 20, 20);
  text("frames until next gen: "+(1250-(frames%1250)), 20, 32);

  //if (frames%1250==0) {
  sizeTotal=0;
  minSize=300;
  maxSize=0;
  for (Blob b : blobs) {
    sizeTotal+=b.size;
    if (b.size<minSize) {
      minSize=b.size;
    }
    if (b.size>maxSize) {
      maxSize=b.size;
    }
  }
  sizeTotal/=blobs.size();
if(oldest>oldestEver){
  oldestEver=oldest;
}
  text("average size: "+sizeTotal, 20, 44);
  text("min size: "+minSize, 20, 56);
  text("max size: "+maxSize, 20, 68);
  text("oldest: "+oldest,20,80);
  text("record oldest: "+oldestEver,20,92);
}

void checkCollision() {
  ArrayList<Food> removeFoods=new ArrayList<Food>();
  //ArrayList<Blob> removeBlobs=new ArrayList<Blob>();
  for (Blob b : blobs) {
    for (Food f : allFood) {
      if (dist(b.x, b.y, f.x, f.y)<(b.size/2+f.w/2)) { // collision!
        removeFoods.add(f);
        b.health+=foodVal;
      }
    }
  }

  for (Food f : removeFoods) {
    allFood.remove(f);
  }
}
