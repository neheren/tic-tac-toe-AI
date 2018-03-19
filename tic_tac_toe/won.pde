boolean won(boolean highlight, boolean check){
  // check for column wins:
  for(int i = 0; i < 3; i++){
    int numbersInRow = 0;
    for(int j = 0; j < 3; j++){
      if(squares[i*3 + j].picked == turn) {
        if(highlight)
          squares[i*3 + j].highlight = true;
        numbersInRow ++;
        if(numbersInRow > 2){
          if(!highlight && !check){
            println("three in row at row " + i +  " by player: " + turn);  
            annouchWinner();
            won(true, false);
            return true;
          }
          if(check)
            return true;
        }
      }
    }
  }
  
  
  // check for row wins:
  for(int i = 0; i < 3; i++){
    int numbersInRow = 0;
    for(int j = 0; j < 3; j++){
      if(squares[j*3 + i].picked == turn) {
        if(highlight)
          squares[j*3 + i].highlight = true;
          
        numbersInRow ++;
        if(numbersInRow > 2){
          if(!highlight && !check){
            annouchWinner();
            println("three in row at colomn " + i +  " by player: " + turn);  
            won(true, false);
            return true;
          }          
          if(check)
            return true;
        }
      }
    }
  }
  
  
  int[] crossIndexesLeft = {0, 4, 8};
  //check for cross wins from left:
  if(checkForCross(crossIndexesLeft, highlight, check)){
    return true;
  }
  
  int[] crossIndexesRight = {2, 4, 6};
  //check for cross wins from left:
  if(checkForCross(crossIndexesRight, highlight, check)){
    return true;
  }
  
  return false;
}


boolean checkForCross(int[] crossIndexes, boolean highlight, boolean check){
  int numbersInRow = 0;
  for(int i = 0; i < 3; i++){
    if(squares[crossIndexes[i]].picked == turn) {
      if(highlight){
        squares[crossIndexes[i]].highlight = true;
      }
      numbersInRow ++;
      if(numbersInRow > 2){
        if(!highlight && !check){
          annouchWinner();
          println("three in row at cross " + crossIndexes[0] +  " by player: " + turn);  
          won(true, false);
          return true;
        }
        if(check)
          return true;
      }
    }
  }
  return false;
}