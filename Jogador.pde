class Jogador {
  PVector posição, velocidade;
  PImage base;
  int largura, altura;
  
  Jogador() {
    largura = 70;
    altura = 10;
    
    base = loadImage("base.png");    
    if(nivel%2==0){
    base = loadImage("base2.png");} //Carrega a imagem base do player pré-construída.
    
    posição = new PVector(width/2, height - 50); //Sua posição inicial será centralizada horizontalmente
    velocidade = new PVector(3, 0); 
   // Sua velocidade em x será 3, e em y será 0, então só pode se mover lateralmente
  }
  
   //Método para mover para os lados
  void mover() {
   //Se alguma tecla for pressionada, o que está dentro vai acontecer
    if(keyPressed) {
       //Se a tecla ESQUERDA for pressionada, a base se moverá para a esquerda
      if(keyCode == LEFT) {
        posição.x -= velocidade.x;
        if(nivel>7){ posição.x -= velocidade.x*4
      ;}      
    
  } 
      //Se a tecla DIREITA for pressionada, a base se moverá para a direita
      else if(keyCode == RIGHT) {
        posição.x += velocidade.x;
      }   if(nivel>7){ posição.x += velocidade.x*2;} 
    }
    
  
    /*Cria uma restrição para a posição em x.
    Só pode ter valores entre comprimento/2 e largura - comprimento/2
    assim você não sairá da tela */
    posição.x = constrain(posição.x, largura/2, width - largura/2);
  }
  

//Desenha a base do jogador
  void mostrar() {
    imageMode(CENTER);
    image(base, posição.x, posição.y);
  }
  
  PVector getposição() {
    return posição;
  }
  
  int getlargura() {
    return largura;
  }
  
  int getaltura() {
    return altura;
  }
}
