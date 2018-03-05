class square{
  int x, y, sWidth, sHeight, offset;
  boolean playerPicked, computerPicked = false;
  int symbolOffset = 20;
  square(int i){
    sWidth =  rectSize/3;
    sHeight = rectSize/3;
    x = (i % 3) * sWidth;
    y = (i / 3) * sHeight;
    offset = width/2 - rectSize/2;
  }
  
  void Draw(){
    if(collides()){
      if(mousePressed){
        playersTurn = false;
        playerPicked = true;
      }
      fill(255, 200, 200);
    }else{
      fill(220, 200, 200);
    }
    if(playerPicked || computerPicked){
      fill(150, 100, 100);
    }
    rect(x+ offset, y + offset, sWidth, sHeight);
    if(playerPicked){
      fill(255, 240, 240);
      pushMatrix();
      rect(x + offset + symbolOffset, y + offset + symbolOffset*2, sWidth- symbolOffset*2, sHeight- symbolOffset*4);
      rect(x + offset + symbolOffset*2, y + offset + symbolOffset, sWidth- symbolOffset*4, sHeight- symbolOffset*2);
      popMatrix();
    }
    if(computerPicked){
      fill(255, 240, 240);
      ellipse(x + offset + symbolOffset*2.5, y + offset + symbolOffset*2.5, sWidth - symbolOffset*2, sHeight- symbolOffset*2);
    }
  }
  
  void pick(){
    computerPicked = true;
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