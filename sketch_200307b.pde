import fisica.*;
FWorld world;
int x, y;
  float bsize;
  boolean check;
    boolean done;
    int lives=0;
float adjustplayer1;
int wait;
float camera;
float PlatformX;
boolean qkey;
color black=#000000;
int size=50;
int i=0;
int oldplatformsize;
Platform Platform;
boolean pressed=true;
int platformsize;
PImage map;
FCircle player1;
FBox startplatform ;
boolean can;
int platform;
blocks blocks;
ArrayList<blocks> Blocks;

ArrayList<Platform> FPlatform;
void setup() {
  size(950, 800);
  Fisica.init(this);
  world = new FWorld(-1000, -1000, 1000, 1000);
 check=false;
  platform=0;
  done=false;
  can=true;
  platformsize=0;
  wait=0;
  pressed=false;
  Blocks=new ArrayList<blocks>();
  player1= new FCircle(50);
  map=loadImage("map.png");
  i=0;
  FPlatform = new ArrayList<Platform>();

  player1.setFill(#FF1717);
  player1.setPosition(0, -100);
  player1.setDensity(100);

 
  world.add(player1);

  startplatform=new FBox(200, 200);
  startplatform.setPosition(0, 100);
  startplatform.setDensity(100);
  startplatform.setStatic(true);
 camera=-player1.getX() - 450 + width/2;
  world.add( startplatform);
}








void draw() {
  pushMatrix();
  background(255);

  translate(-player1.getX() - 450 + width/2, 600);
  
  if (can==true) {


    if (qkey==true) {
      player1.setStatic(false);
      player1.resetForces();
       player1.setVelocity(0,0);
      platformsize++;
      rect(player1.getX()+50, player1.getY()+25, 5, -platformsize);
      PlatformX=(player1.getX()+50);
      pressed=true;

      //println("lol");
    } 

    if (qkey==false) {
      if (pressed==true) {
        //println("NOW");
        oldplatformsize=platformsize;
        FPlatform.add(new Platform(player1.getX()+50, player1.getY(), platformsize));
           
        can=false;

        pressed=false;

        platformsize=0;
      }
    }
  }
  world.step();
  world.draw();
  popMatrix();


 
 
  while (i<1) {
    Blocks.add(new blocks(player1.getX()+random(300, 500), 200, random(50, 100)));

    i++;
  }
  println(adjustplayer1);
  if(done==false && wait>100){
 while (adjustplayer1>0) {
            player1.addImpulse(10,0);
           adjustplayer1--;
           
           
            
  } 
  
  }
  
  
  int h=0;
  while (h < FPlatform.size()) {
    Platform e =FPlatform.get(h);
    e.show();
    e.act();

    h++;
  }



  int b=0;
  while (b < Blocks.size()) {
    blocks e = Blocks.get(b);
    e.show();
    e.act();

    b++;
  }
}

public void keyPressed() {

  if (key=='q'|| key=='Q') qkey = true;
}


public void keyReleased() {

  if (key=='q'|| key=='Q') qkey = false;
}

void mouseReleased(){
  println(mouseX,mouseY);
 
  
  
}
