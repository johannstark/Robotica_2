/*
Esta plantilla contiene las 3 clases que se utilizaron en clase y adicionalmente incluye una llamada Food,
esta sera la encargada de manipular la comida que aparecera en pantalla.

Se diseño una version del juego Agario para un solo jugador.
*/
import processing.serial.*;

float dato=0,map_dato=0;
Serial puerto;
ArrayList <Ball> balls=new ArrayList<Ball>(); 
ArrayList <Food> foods=new ArrayList<Food>();
int counter=0,re_fill=0;
int num_balls=8;
Ball player;
boolean start=false;
int score=0;

void setup(){
  size(1000,500);
  puerto = new Serial(this, Serial.list()[2], 9600);
  puerto.bufferUntil('\n');
  for(int i=0;i<num_balls;i++){
   Ball ball=new Ball(random((i*width/num_balls),((i+1)*width/num_balls)),random(height),100/num_balls,#FFFF00);
   ball.set_vel(random(-5,5),random(-4,4));
   balls.add(ball);
  }
  for(int i=0;i<(num_balls);i++){
    Food food=new Food(random((i*width/num_balls),((i+1)*width/num_balls)),random(height),10,true);
    Food food2=new Food(random((i*width/num_balls),((i+1)*width/num_balls)),random(height),10,true);
    foods.add(food);
    foods.add(food2);
  }

}

void draw(){
  background(0,0,0);
  if(start==false){
    fill(255,0,0);
    text("score",800,50);
    text(score,900,50);
    for(Ball ball : balls){
       ball.display();
     }
    for(Food food : foods){
      food.display();
    }    
  }
  else{
    for(Food food : foods){
      food.display();
    }
    if(counter>=120){
     counter=0;
     for(Ball ball : balls){
       ball.set_vel(random(-3,3),random(-2,2));
     }
    }
    
    for(Ball ball : balls){
     ball.display();
     ball.mover();
     ball.bordes();
    }
    for(Food food : foods){
      for(Ball ball : balls){
        if(food.is_alive()){
          if(food.eaten(ball)){
          food.life=false;
          ball.radius+=3;
          break;
          }
        }
      }
    } 
    counter++;
    for(Food food : foods){
      if(!food.is_alive()){
        re_fill+=1;
      }
    }
    if (re_fill==foods.size()){
      foods.clear();
      for(int i=0;i<(num_balls);i++){
        Food food=new Food(random((i*width/num_balls),((i+1)*width/num_balls)),random(height),10,true);
        Food food2=new Food(random((i*width/num_balls),((i+1)*width/num_balls)),random(height),10,true);
        foods.add(food);
        foods.add(food2);
      }
      re_fill=0;
    }
    else
      re_fill=0;
    player.display(); 
    player.move_serial(dato);
    for(Food food : foods){
      if(food.is_alive()){
        if(food.eaten(player)){
          food.life=false;
          player.radius+=1;
          break;
        }
      }
    }
    for(Ball ball : balls){
      if(ball.hit_ball(player)){
        if(ball.radius>player.radius){
          start=false;
        }
        else{
          player.radius-=2;
        }
      }
    }
    fill(255,0,0);
    text("score",800,50);
    text(score,900,50);
    score+=1;
  }
}

void serialEvent(Serial datos){
  String entrada=datos.readStringUntil('\n');
  if (entrada!=null){
      dato=float(entrada);
  }
  println(dato);  
}

void mouseClicked() {
  start=true;
  player=new Ball(mouseX,mouseY,100/num_balls,#0000FF);
  score=0;
}