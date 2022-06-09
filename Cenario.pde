class Cenário {
  ArrayList<PVector> blocks = new ArrayList<PVector>();
  ArrayList<Integer> colorBlock = new ArrayList<Integer>();
  
  int largura, altura, col, fil, dif;
  color[] cores = new color[5];
  
  //Nosso construtor terá como parâmetro o nível atual do jogo
  Cenário(int nivel) {
  //Dessa forma o grau de dificuldade aumenta
    col = 2 * nivel; //O número de colunas será multiplicado pelo nível atual
    fil = 2 * nivel; //O número de linhas será multiplicado pelo nível atual
    
         
    dif = 50; //O espaçamento entre os blocos e as paredes
    
    largura = (width - dif * 2)/col; //comprimento de cada bloco
    altura = 20; //altura de cada bloco
    
    cores[0] = color(#FF0D0D); //Cor vermelha
    cores[1] = color(#FAFF0D); //Cor amarelo
    cores[2] = color(#0DA0FF); //Cor azul
    cores[3] = color(#FFFFFF); //Cor branca
    cores[4] = color(#0DFF3B); //Cor verde
  }
  
   //Método para criar blocos
  void criarCenário() {
    
   //Os blocos serão colocados por linhas
    for(int i = 0; i < fil; i++) {
      for(int j = dif; j <= width - dif - largura; j+= largura) {
        blocks.add(new PVector(j, (altura*i) + dif));
      }
    }
    // O método para atribuir as cores é executado
    PreencherCor();
  }

  //Método para preencher cada bloco.
  void PreencherCor() {
    int aux = 0; //Variable auxiliar
    for(int i = 0; i < fil; i++) {
      for(int j = 0; j < col; j++) {
        // Cada linha receberá uma cor
        colorBlock.add(cores[aux]);
      
    }
      aux++;   //A cor muda para a próxima linha
      
     /*Porque existem apenas 4 cores e pode haver mais de 4
      linhas, cada vez que a última cor for alcançada, ela ficará
      para começar com a primeira cor, tendo assim um padrão repetitivo */
      
      if(aux > 4) {
        aux = 0;
      }
    }
  }
  
   //Método para desenhar os blocos na tela
  void mostrar() {
    stroke(0);
    strokeWeight(2);
    for(int i = 0; i < blocks.size(); i++) {
      PVector block = blocks.get(i);
      int colorBlock = this.colorBlock.get(i);
      
      fill(colorBlock); // Cada bloco recebe sua cor correspondente
      rect(block.x, block.y, largura, altura);
    }
  }
  
  int getlargura() {
    return largura;
  }
  
  int getaltura() {
    return altura;
  }
  
  ArrayList<PVector> getBlocks() {
    return blocks;
  }
  
  ArrayList<Integer> getcores() {
    return colorBlock;
  }
  
  int getNumBlocks() {
    return blocks.size();
  } 
} 
