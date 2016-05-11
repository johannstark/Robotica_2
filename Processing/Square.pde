class Square{
  float cordx,cordy,alto,ancho,velx,vely;
  color filler;
  
  Square(float a, float b,float c,color d,color e){
    //contructor de la clase Ball, recibe los paremetros:cordx,cordy,radio de la bola y
    //un color de llenado
    cordx=a;
    cordy=b;
    alto=c;
    ancho=d;
    filler=e;
  }
  
  void display(){
    //metodo utilizado para mostrar los objetos de esta clase en pantalla
    fill(filler);
    rectMode(CENTER);
    rect(cordx,cordy,ancho,alto);
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
    if(cordx+ancho/2>width || cordx-ancho/2<0)
      velx*=-1;
    if(cordy+alto/2>height || cordy-alto/2<0)
      vely*=-1;
  }

}