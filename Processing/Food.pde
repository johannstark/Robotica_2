class Food{
  float cordx,cordy,radius;
  boolean life=true;
  Food(float _a,float _b,float _c,boolean _life){
    cordx=_a;
    cordy=_b;
    radius=_c;
    life=_life;
  }
  
  void display(){    
    fill(255);
    if (life)
      ellipse(cordx,cordy,radius*2,radius*2);    
  }
  
  boolean eaten(Ball a){
    float dist=0;
    dist= sqrt(((a.cordx-cordx)*(a.cordx-cordx))+((a.cordy-cordy)*(a.cordy-cordy)));
    if (dist < (a.radius+radius)){
      return true;
    }
    else
      return false;
  }
  
  boolean is_alive(){
    if (life)
      return true;
    else
      return false;
  }
}