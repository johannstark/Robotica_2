class Ball{
  float cordx,cordy,radius,velx,vely;
  color filler;
  
  Ball(float a, float b,float c,color d){
    //contructor de la clase Ball, recibe los paremetros:cordx,cordy,radio de la bola y
    //un color de llenado
    cordx=a;
    cordy=b;
    radius=c;
    filler=d;
  }
  
  void display(){
    //metodo utilizado para mostrar los objetos de entra clase en pantalla
    fill(filler);
    ellipse(cordx,cordy,radius*2,radius*2);
  }
  
  void mover(){
    //metodo utilizado para mover los objetos de esta clase a una velocidad deteminada
    //velx para el eje x y vely para el eje y
    cordx+=velx;
    cordy+=vely;
  }
  
  void set_vel(float a,float b){
    //metodo utilizado para definir el valor de la velocidad en x y la velocidad en y
    velx=a;
    vely=b;
  }
  
  void bordes(){
    //metodo utilizado para evitar que los objetos de esta clase salgan de la pantalla
    //en consecuencia reboten hacia el interior de la misma
    if(cordx>width || cordx<0)
      velx*=-1;
    if(cordy>height || cordy<0)
      vely*=-1;
  }
  
  boolean hit_ball(Ball a){
    //este metodo devuelve true si dos objetos de la clase Ball se chocan
    float dist=0;
    dist= sqrt(((a.cordx-cordx)*(a.cordx-cordx))+((a.cordy-cordy)*(a.cordy-cordy)));
    if (dist < (a.radius+radius)){
      return true;
    }
    else
      return false;
  }
  
  void mover_mouse(){
    cordx=mouseX;
    cordy=mouseY;
  }
  
  void move_serial(float a){
    //metodo que actualiza la posicion de el objeto de esta clase segun los 
    //datos recibidos de manera serial.
    float map_value=0;
    if(a>=2000){
      map_value=map(a,2000,3023,-5,5);
      cordy+=map_value;
    }
    else{
      map_value=map(a,0,1023,-5,5);
      cordx+=map_value;
    }
  }
}