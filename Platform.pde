class Platform extends FBox {
  float rotation;
  int checktimer;

  Platform(float x, float y, int size) {

    super(5, platformsize);
   done=false;
    this.setPosition(x, y-platformsize/2);
    checktimer=0;

    world.add(this);
  }

  void act() {
    if (this.getRotation() > 1.57 && this.getRotation() < 1.571 ) {
      this.setVelocity(0, 0);
      this.setAngularVelocity(0);
    } else {   
      this.setVelocity(100, 150);
      this.setAngularVelocity(1);
    }


    for (int i =0; i<Blocks.size(); i++) {
      FBox b=Blocks.get(i);
      //println(bsize);
     // println(dist(PlatformX-(bsize/2), 0, b.getX(), 0), oldplatformsize, dist((PlatformX+(bsize/2)), 0, b.getX(), 0)) ;

      if (dist(this.getX(), this.getY(), b.getX(), b.getY()) < 250) {
        //println(this.getX(),this.getY());

        if (oldplatformsize<dist((PlatformX-(bsize/2)), 0, b.getX(), 0) && oldplatformsize>dist((PlatformX+(bsize/2)), 0, b.getX(), 0)) {

          checktimer++;

          if (checktimer>100) {
           lives=0;
            this.setStatic(true);
            //println(camera);
            if(done==false){
              wait++;
            adjustplayer1=dist(player1.getX(), 0, b.getX(), 0);
            }
           
          if(player1.getX() > b.getX()){
            
          done=true;
          player1.setStatic(true);
         
          Blocks.add(new blocks(player1.getX()+random(300, 500), 200, random(50, 100)));
       
           }
    if(done==true){
            
               FPlatform.remove(this);
              world.remove(this);
              //camera=-player1.getX() - 450 + width/2;
              println(true);}
                 can=true;
            }
          }
        }
      }
    
  }

  void show() {
  }
}
