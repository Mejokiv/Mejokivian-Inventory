

import processing.sound.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;





Minim minim;
Jogador j;
Cenário e;
Bola p;

AudioPlayer soundfile;
AudioPlayer soundfile2;
AudioPlayer soundfile3;
SoundFile soundfile4;
SoundFile soundfile5;
AudioPlayer soundfile6;
SoundFile soundfile7;
AudioPlayer soundfile8;
AudioPlayer soundfile9;
AudioPlayer soundfile10;
SoundFile soundfile11;

PImage fondo;
PImage fundo2;
PImage vida;
PImage SonicGameOver;
PImage esmeralda;
PImage TodasEsmeraldas;
PImage Vilão;
PImage SuperSonic;
PImage creditos;
PImage VilãoDerrotado;
PImage Regraseinstruções;

int vidas, nivel, pontos2, esmeraldaV;
boolean start; //Isso nos ajudará a iniciar o movimento da bola

void setup() {
  size(500, 700);
 minim = new Minim(this);
  vida = loadImage("SonicVida.jpg");
  fondo = loadImage("background.jpg");
  fundo2 = loadImage("background2.jpg"); //Imagens utilizadas
  SonicGameOver = loadImage("Sonic Sprite.png");
  esmeralda = loadImage("Esmeralda.png");
  TodasEsmeraldas = loadImage("Todasesmeraldas.png");
  Vilão = loadImage("Vilão.png");
  SuperSonic = loadImage("SuperSonic.png");
  creditos = loadImage("creditos.png");
  VilãoDerrotado= loadImage("VilãoDerrotado.png");
  Regraseinstruções =loadImage("Regras e instruções.png");      
  
  vidas = 10; 
  nivel = 1;
//Iniciamos o jogo.
  
  
  soundfile = minim.loadFile("08 - Bonus Zone.mp3");
  soundfile2 = minim.loadFile("Sonic the Hedgehog - Game Over.mp3");
  soundfile4 = new SoundFile(this, "bloco.mp3");
  soundfile5 = new SoundFile (this,"ping.mp3");
  soundfile6 = minim.loadFile ("16 - Marble Zone (unused).mp3");
  soundfile7 =new SoundFile (this, "Ring.mp3");
  soundfile8= minim.loadFile("15 - Ending.mp3");
  soundfile9= minim.loadFile("jump.mp3");
  soundfile10= minim.loadFile("2.27 Ending.mp3"); 
  soundfile11 = new SoundFile(this, "jump.mp3"); 

 
 

  start = false;
  
 
 
 
 
  
  
  
  j = new Jogador();
  e = new Cenário(nivel);
  p = new Bola(j.getposição());
 
  
 
  

  
 if(nivel>7){
  
soundfile6=soundfile8;}

 
  if(!soundfile6.isPlaying()){
    
   soundfile6.loop();
 
 }
    

 
 
 
 
 
    
  
  e.criarCenário();
}


void draw() {
  //Se o jogador ainda não perdeu a bola e ainda há blocos para remover, o jogo continua
  if(!p.validarMorte() && e.getNumBlocks() != 0) {
    

     background(fondo);
         if(nivel%2 == 0
         ){
    background(fundo2);}
      //Se coloca el fondo
   
    
    e.mostrar(); //Os blocos são mostrados
    
 
    
     if (keyCode == CONTROL) {
    start=false;
    background(creditos);
    delay(1000);
   
    
  }
  
  if(keyCode == SHIFT){
  start=false;
  background(Regraseinstruções);
  delay(1000);
}
   //Se uma tecla for pressionada, start muda para true
    if(keyPressed) {
   
    
    
       
   
    
    
         
      start = true;
      
  } 
  
   
    
  
  

//Método para criar o próximo nível

 
               
    
    j.mover();
    j.mostrar();
  
    p.mostrar();
    
    //Se start for true, a bola começará a se mover
    if(start) {
      p.mover();
      p.validarBordas();
      p.rebotar(j.getposição(), j.getlargura(), j.getaltura());
      p.eliminarBlock(e.getBlocks(), e.getcores(),e.getlargura(), e.getaltura());
    
  }
    
    fill(255);   
    textAlign(CENTER);
    textSize(30);
    
 
       
    
    //A pontuação do jogador e suas vidas são exibidas na tela
    text( "Pontuação: " + p.getpontos() + " Vidas:" + vidas,   width/2, 35);
   if(nivel==1){
      fill(0);  
    text( " Durante o jogo: ",   width/2, 140);
    text( "QUALQUER TECLA PARA COMEÇAR ",   width/2, 180);
    text( " SHIFT PARA REGRAS E INSTRUÇÕES ",   width/2, 210);
    text( "CONTROL PARA CRÉDITOS",   width/2, 250);
    
     
   }
    
    
  } 
//Se não houver mais blocos para remover, o próximo nível é iniciado

  
  else if(e.getNumBlocks() == 0)  {
    
  
     
  
     
    background(0);
    fill(255);
    
    textAlign(CENTER);
    
   
   
  
    if(nivel<8){
    image(esmeralda,250,175);
    text("Você ganhou uma esmeralda.", width/2, height/2 - 100);       
    esmeraldaV=nivel;
    text(" Número de coletadas: " + esmeraldaV  , width/1.9, height/1.9 - 50);   
    
     
    
   
    
  
  }
//Mostra ao usuário o nível que ele acabou de completar
      
     if(nivel==7){ text("Você pegou todas esmeraldas!", width/2, height/2 - 5);
      text("Super Sonic ativado", width/2, height/2 + 30);
      image(TodasEsmeraldas,250,175);  
       
      }//
    

    
      
      
    text("NIVEL " + nivel, width/2, height/8);
    if (nivel==11){
      text("Essa foi a última fase possível ", width/2, height/8 + 200);
      text( "Pontuação: " + p.getpontos() +  " ,Vidas:" + vidas,   width/2, + 250);
      
  if(keyPressed){
  System.exit(0);}
    
  }
    
    text("COMPLETO", width/2, height/8 + 50);
    text("Você ganhou uma vida.", width/2, height/2 + 200);
    image(vida,250,460);
    

   if(!soundfile.isPlaying()){
   soundfile.loop();
   soundfile6.pause();}
   

 
  //Se o usuário pressionar uma tecla, inicia o próximo nível
    if(keyPressed) {
      
      nivel++; //Aumenta o nível
      reset(); //Inicia o jogo com o nível correspondente
         
  
} 
     
  } 
  //Si el jugador ya no tiene vidas, el juego termina
  else if(vidas == 0) { {
  
 
   
    
    background(0);
    fill(255);
    textAlign(CENTER);
    
    //Se muestra al usuario el puntaje que alcanzó a lo largo del juego
    text("GAME OVER", width/2, height/2);
    
    text("Pontuação: " + p.getpontos(), width/2, height/2 + 30);
    
    
    
   
   if(nivel<8){ 
  image(SonicGameOver,250,470);
  image(Vilão,250,175);
  text("Tente coletar todas as esmeraldas", width/2, height - 130);
  text("Aperte Enter para uma nova tentativa", width/2, height - 100);
}  
    if(nivel>7 && nivel<14){
    image(SuperSonic,250,480);
    soundfile2=soundfile10;
    image(VilãoDerrotado,250,175);  
    text("Você coletou todas esmeraldas!", width/2, height - 100);  
    text("Parabéns!", width/2, height - 60);  
} 



    
    if(!soundfile2.isPlaying()){
    
    soundfile6.pause();
    soundfile2.play();
  
   } }
   
 //Se o usuário pressionar a tecla ENTER, o jogo começa do 0
    if(keyCode == ENTER) {
     
      soundfile2.pause();
      setup();
    }
  }
 /*Se nenhuma das condições acima for atendida,
  significa que o jogador acabou de perder a bola, então
  ele recebe uma nova bola em sua posição atual*/
  else {
    p.setposição(j.getposição()); //A bola é posicionada em sua base
    start = false;
    vidas--; //Quando você perde a bola, você perde uma vida.
  }
}


//Método para criar o próximo nível
void reset() {
  e = new Cenário(nivel);
  e.criarCenário();
  j = new Jogador();
  p.setposição(j.getposição());
  vidas ++;
  
 if(!soundfile6.isPlaying()){
  
     if(nivel>7){
soundfile6=soundfile8;}
    soundfile6.loop();
   soundfile.pause();}
}
  
