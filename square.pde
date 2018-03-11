class square{
  int x, y, sWidth, sHeight, offset;
  int symbolOffset = 20;
  public int picked = 0;
  square(int i){
    sWidth =  rectSize/3;
    sHeight = rectSize/3;
    x = (i % 3) * sWidth;
    y = (i / 3) * sHeight;
    offset = width/2 - rectSize/2;
  }
  
  void Draw(){
    if(collides()){
      if(mousePressed && picked == 0 && turn == PLAYER_VAL){
        picked = turn;
        switchTurn();
      }
      fill(255, 200, 200);
    }else{
      fill(220, 200, 200);
    }
    if(picked != 0){
      fill(150, 100, 100);
    }
    rect(x+ offset, y + offset, sWidth, sHeight);
    if(picked == PLAYER_VAL){
      fill(255, 240, 240);
      rect(x + offset + symbolOffset, y + offset + symbolOffset*2, sWidth- symbolOffset*2, sHeight- symbolOffset*4);
      rect(x + offset + symbolOffset*2, y + offset + symbolOffset, sWidth- symbolOffset*4, sHeight- symbolOffset*2);
    }
    if(picked == AI_VAL){
      fill(255, 240, 240);
      ellipse(x + offset + symbolOffset*2.5, y + offset + symbolOffset*2.5, sWidth - symbolOffset*2, sHeight- symbolOffset*2);
    }
  }
  
  public void pick(int who){
    picked = who;
    switchTurn();
  }
  
  boolean collides(){
    if(mouseX > x + offset && mouseX < x + offset + sWidth){
      if(mouseY > y + offset && mouseY < y + offset + sHeight){
          return true;
      }
    }
    return false;
  }
}