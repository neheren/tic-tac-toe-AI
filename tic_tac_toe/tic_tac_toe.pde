int rectSize = 300;
square squares[] = new square[9];
int board[] = new int[9];
int turn = 1;
boolean keepAnnouncingWinner = false;
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
  
  if(keepAnnouncingWinner){
    annouchWinner();
  }
}

void annouchWinner(){
  if(!keepAnnouncingWinner) keepAnnouncingWinner = true;
  fill(0);
  
  textAlign(CENTER);
  text((turn == AI_VAL) ? "AI" : "Player" + " won!", 300, 100);
}

void switchTurn(){
  if(won(false, false)){
    if(turn == PLAYER_VAL){
      println("PLAYER WON!");
    }
    if(turn == AI_VAL){
      println("AI WON");
    }
  }else{
    if(turn == PLAYER_VAL){
      turn = AI_VAL;
    }else if(turn == AI_VAL){
      turn = PLAYER_VAL;
    }
    
    if(turn == AI_VAL){
      Move chosenAIMove = pickBestChoice(1, AI_VAL);
      squares[chosenAIMove.pos].pick(AI_VAL);
    }
  }
}



Move pickBestChoice(int movesAhead, int player){
  ArrayList<Move> possibleMoves = new ArrayList<Move>();
  if(won(false, true)){
    if(player == AI_VAL){
      println("win predicted for AI");
      return new Move(0, player, 100);
    }else{
      println("win predicted for player");
      return new Move(0, player, -100);
    }
  }
  
  for(int i = 0; i < 9; i++) {
    if(squares[i].picked == 0) {
      if(movesAhead >= 0){
        Move move = new Move(i, player, 0);
        squares[i].picked = player;
        if(player == AI_VAL){
          move.points = pickBestChoice(movesAhead-1, PLAYER_VAL).points;
          println(move.points);
        }else{
          move.points = pickBestChoice(movesAhead-1, AI_VAL).points;
        }
        possibleMoves.add(move);
        squares[i].picked = 0;
      }
    }
  }
  if(movesAhead >= 0)
    return moveWithMostPoints(possibleMoves, player);
  else return new Move(0, player, 0);
}





Move moveWithMostPoints(ArrayList<Move> moves, int player){
  Move chosenMove; //psoudo move with low points
  if(player == AI_VAL){
    chosenMove = new Move(10, 3, -1000);
    for(int i = 0; i < moves.size(); i++){
      if(moves.get(i).points > chosenMove.points){
        chosenMove = moves.get(i);
      }
    }
    return chosenMove;
  }
  else{
    chosenMove = new Move(10, 3, 1000);
    for(int i = 0; i < moves.size(); i++){
      if(moves.get(i).points < chosenMove.points){
        chosenMove = moves.get(i);
      }
    }
  }
  return chosenMove;
}