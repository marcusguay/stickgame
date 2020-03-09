class blocks extends FBox{


  
  blocks(float  x,int  y, float Bsize){
   
    super(Bsize,y);
   bsize= Bsize;
      this.setFill(0, 0, 0);
      this.setPosition(x,100);
      this.setStatic(true);
      lives=1;
   world.add(this);
 }
    
    void act(){
      if(lives==0){
       
        
        replacement=new FBox(bsize, y);
     replacement.setPosition(this.getX(), this.getY());
     replacement.setDensity(100);
    replacement.setStatic(true);
  
  
   world.remove(this);
      }
      

    }
    
    void show(){
      
      
    }
  
}
