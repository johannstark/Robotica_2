class Wall{
  float cordx,cordy,alto,ancho;
  color filler=#FFFFFF;
  Wall(float a,float b,float c,float d){
    cordx=a;
    cordy=b;
    alto=c;
    ancho=d;
  }
  
  void display(){
    fill(filler);
    rectMode(CENTER);
    rect(cordx,cordy,ancho,alto);
  }
 
  boolean hit_ball(Ball a){
    //este metodo devuelve el valor de true cuando una bola choca con un objeto de esta
    //clase
    if(a.cordx+a.radius/2>cordx-ancho/2 && a.cordx-a.radius/2<cordx+ancho/2){
      if(a.cordy+a.radius/2>cordy-alto/2 &&  a.cordy-a.radius/2<cordy+alto/2){
        return true;
      }
      else
        return false;  
    }
    else
      return false;
  }
}