int rectSize = 300;
square squares[] = new square[9];
int board[] = new int[9];
boolean playersTurn = true;
void setup() {
  size(600, 600);
  for(int i = 0; i < squares.length; i++){
    squares[i] = new square(i);
  }
}

void draw(){
  background(230,230,230);
  noStroke();
  int rectSize = 300;
  fill(255);
  rect(width/2 - rectSize/2, width/2 - rectSize/2, rectSize, rectSize);
  for(int i = 0; i < squares.length; i++){
    squares[i].Draw();
  }
  
}
int pickBestChoice(int movesAhead){
  int[] scoresForEachMove = new int[9];
  for(int i = 0; i < 9; i++) {
    scoresForEachMove[i] = pickBestChoice(movesAhead-1);
  }
  
  return 1;
}