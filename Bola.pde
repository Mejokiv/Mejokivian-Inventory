 
class Bola {
  PVector posição, velocidade;
  int tamanho; 
 int pontos;
  
//Nosso construtor terá como parâmetro a posição da base do player
  Bola(PVector posição_) {
   
    tamanho = 60; //Tamaño de la pelota
   pontos = 0; //pontos del jugador
    
    
  
   
   
 
   
   
    
 //A posição da bola será logo acima da base do jogador
    posição = new PVector(posição_.x, posição_.y - tamanho);
    
    //Sua velocidade e direção serão valores aleatórios em X e Y
    velocidade = new PVector(random(4, 4), random(-6, -6));
   
  
   }
  
  
  //Método para reposicionar a bola na base do jogador, caso o jogador a tenha perdido
  void setposição(PVector posiçãoJogador) {
    posição = new PVector(posiçãoJogador.x, posiçãoJogador.y - tamanho); 
   
   
    velocidade = new PVector(random(4, 4), random(-6, -6));  
   if(nivel>7)
   
   {
    
     velocidade = new PVector(random(5, 7), random(-8, -6)
 );}
 
 }

  
// Desenha a bola na tela
  void mostrar() {
    
    fill(#535EBF);
    noStroke();
    if (nivel>7){
    fill(#F0E90C);
    }
    ellipse(posição.x, posição.y, tamanho, tamanho);
  }
  
  
  //Metodo para mover a bola
  void mover() {
  //O vetor velocidade é adicionado à posição
    posição.add(velocidade);
  }
  
//Método para quicar a bola
  void rebotar(PVector posiçãoJogador, int larguraJogador, int alturaJogador) {
  //Valor máximo no eixo x que a base do jogador ocupa
    float max = posiçãoJogador.x + larguraJogador/2; 
    
   //Valor mínimo no eixo x que a base do jogador ocupa
    float min = posiçãoJogador.x - larguraJogador/2;
    
     //Se a posição da bola estiver dentro da área delimitada por essas condicionais (a base do jogador)
     //significa que a bola está tocando a base do jogador, portanto ela irá quicar
        if(posição.y > posiçãoJogador.y - alturaJogador/2 
          && posição.y < posiçãoJogador.y + alturaJogador/2
          && posição.x < max && posição.x > min) {
           
      velocidade.y *= -1; //O valor da velocidade é invertido em y, fazendo a bola quicar
     
  }
  }
  
    //Método para rebater nas paredes, exceto na parede inferior
  void validarBordas() {
    //Se a bola tocar a parede esquerda ou direita, ela irá quicar na direção oposta
    if(posição.x < 3 || posição.x >= width - 3) {
      velocidade.x *= -1;
     //A velocidade é invertida, ou seja, a direção é invertida
    } 
     //Se a bola tocar a parede superior, ela irá quicar na direção oposta
    else if(posição.y < 10
    ) {
      velocidade.y *= -1;
      
  } if(posição.y  <-5){
  start=false;
  posição.y = 15;
  }
  }
  
  
    //Método para validar se o jogador perdeu a bola (se a bola passou pela parede inferior)
  boolean validarMorte() {
   //Se a bola caiu no chão, então a bola foi perdida
    if(posição.y > height) {
      delay(100);
     
 
     
    
      
      return true;
    } 
    //Se não, então nada aconteceu 
    else { 
      return false;
    }
  }
  

  
  void eliminarBlock(ArrayList<PVector> blocks, ArrayList<Integer> cores,int largura, int altura) {
    
   
     //Cada bloco será avaliado
    for(int i = 0; i < blocks.size(); i++) {
      PVector block = blocks.get(i); //Pega o bloco na posição i
      
   
      /*Se a posição da bola estiver dentro da área delimitada por esta condição (a área do bloco),
      então será avaliado de que lado do bloco a bola bateu */
      if(posição.x >= block.x - tamanho/2 && posição.x <=  block.x + largura + tamanho/2 && posição.y > block.y - tamanho/2 && posição.y < block.y + altura + tamanho/2) {
        
     //Se a bola bater no lado esquerdo do bloco, ela irá quicar na direção oposta
        if(posição.y <= block.y + altura && posição.y >= block.y 
            && posição.x >= block.x) {
          velocidade.x *= -1;    
        
        } 
     //Se a bola bater no lado direito do bloco, ela vai quicar na direção oposta
        else if(posição.y <= block.y +altura && posição.y >= block.y
            && posição.x <= block.x + largura) {
          velocidade.x *= -1;      
        
        } 
     //Se a bola atingir o lado inferior do bloco, ela irá quicar na direção oposta
        else if(posição.x <= block.x + largura + tamanho && posição.x >= block.x - tamanho
            && posição.y <= block.y + altura + tamanho) {
          velocidade.y *= -1; 
        
        
      } 
        
     //Se a bola atingir o lado superior do bloco, ela irá quicar na direção oposta
        else if(posição.x <= block.x + largura + tamanho && posição.x >= block.x - tamanho
            && posição.y >= block.y - tamanho) {
          velocidade.y *= -1;
        }
        
     //O bloco com o qual a bola colidiu é eliminado
        blocks.remove(i);
         //E sua cor correspondente é removida
        cores.remove(i);
       //A pontuação do jogador aumenta, mais 100 pontos
        
       
       
      pontos += 100;
        if(!soundfile4.isPlaying()){
      
      soundfile4.play();
    
   
    
  }    
       
     //Aumento bônus de pontuação e vida.  
      
      if(posição.y<50 && posição.y>=35){
      pontos += 30;
      soundfile5.play();}
      
      if(posição.y<30){
      pontos += 30;
      soundfile7.play();
      soundfile5.play();
      vidas++;
    }
    }
     
    
  
    }
      
      
  
    
  }
  
  int getpontos() {
    
    return pontos;
  } 
}
