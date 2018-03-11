int rectSize = 300;
square squares[] = new square[9];
int board[] = new int[9];
int turn = 1;

int PLAYER_VAL = 1;
int AI_VAL = 2;
int NO_VAL = 0;

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

void switchTurn(){
  if(won()){
    if(turn == PLAYER_VAL){
      print("PLAYER WON!");
    }
    if(turn == AI_VAL){
      print("AI WON");
    }
  }
  if(turn == PLAYER_VAL){
    turn = AI_VAL;
  }else if(turn == AI_VAL){
    turn = PLAYER_VAL;
  }
  
  if(turn == AI_VAL){
    Move chosenAIMove = pickBestChoice(2);
    squares[chosenAIMove.pos].pick(AI_VAL);
  }
}

boolean won(){
  int numbersInRow = 0;
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      if(squares[i*3 + j].picked == turn){
        numbersInRow ++;
      }
      println(numbersInRow);
    }
  }
  return false;
}


Move pickBestChoice(int movesAhead){
  ArrayList<Move> possibleMoves = new ArrayList<Move>();
  for(int i = 0; i < 9; i++) {
    if(squares[i].picked == 0) {
      possibleMoves.add(new Move(i, AI_VAL, i));
      
      //possibleMoves.add(pickBestChoice(movesAhead-1));
    }
  }
  return moveWithMostPoints(possibleMoves);
}

Move moveWithMostPoints(ArrayList<Move> moves){
  Move chosenMove = new Move(10, 3, -200); //psoudo move with low points
  for(int i = 0; i < moves.size(); i++){
    
    if(moves.get(i).points > chosenMove.points){
      chosenMove = moves.get(i);
    }
  }
  println(chosenMove.points);
  return chosenMove;
}