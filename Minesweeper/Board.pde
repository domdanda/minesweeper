class Board extends GUI{
  int boardType;
  int mineTotal;
  int mines[][];
  int[] boardSize = new int[2];
  String boardName;
  int[] boardDimensions = new int[2];
  int gamePhase = 0;
  int[][] proximityNumber;
  int tilesLeft = 0;
  
  /*
    game phase 0 is an active game
    game phase 1 is a lost game
  */
  
  Board(int bs){
    boardType = bs;
    if(boardType == 0){
      boardSize[0] = 9;
      boardSize[1] = 9;
      boardName = "Beginner";
      mineTotal = 10;
    }
    else if(boardType == 1){
      boardSize[0] = 16;
      boardSize[1] = 16;
      boardName = "Intermediate";
      mineTotal = 40;
    }
    else if(boardType == 2){
      boardSize[0] = 30;
      boardSize[1] = 16;
      boardName = "Expert";
      mineTotal = 99;
    }
    else{
      boardSize[0] = 9;
      boardSize[1] = 9;
      boardName = "Beginner";
      mineTotal = 10;
    }
    
    mines = new int[boardSize[0]][boardSize[1]];
    proximityNumber = new int[boardSize[0]][boardSize[1]];
  }
  
  //calculates the proximity numbers of all the tiles on the board unless they are a mine
  void fillProximityNumber(){
    int counter = 0;
    for(int i = 0; i < boardSize[0]; i++){
      for(int j = 0; j< boardSize[1]; j++){
        if(i != 0){
          if(j != 0){
            if(mines[i-1][j-1]==1){counter++;}
          }
          if(mines[i-1][j]==1){counter++;}
          if(j != boardSize[1]-1){
            if(mines[i-1][j+1]==1){counter++;}
          }
        }
      
        if(j != 0){
          if(mines[i][j-1]==1){counter++;}
        }
        if(j != boardSize[1]-1){
          if(mines[i][j+1]==1){counter++;}
        }
      
        if(i != boardSize[0]-1){
          if(j != 0){
            if(mines[i+1][j-1]==1){counter++;}
          }
          if(mines[i+1][j]==1){counter++;}
          if(j != boardSize[1]-1){
            if(mines[i+1][j+1]==1){counter++;}
          }
        }
        
        if(mines[i][j] != 1){
          proximityNumber[i][j] = counter;
        }else{
          proximityNumber[i][j] = -1;
        }
        counter = 0;
      }
    }
  }
  
  void drawProximityNumber(int[][] a){
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    for(int i = 0; i < boardSize[0]; i++){
      for(int j = 0; j < boardSize[1]; j++){
        if(a[i][j] >= 1){
          if(a[i][j] == 1){
            fill(0, 200, 0);
          }else if(a[i][j] == 2){
            fill(0, 100, 200);
          }else if(a[i][j] == 3){
            fill(200, 0, 200);
          }else if(a[i][j] == 4){
            fill(200, 50, 200);
          }else if(a[i][j] == 5){
            fill(125, 0, 20);
          }else if(a[i][j] == 6){
            fill(0, 200, 200);
          }else if(a[i][j] == 7){
            fill(0, 0, 0);
          }else if(a[i][j] == 8){
            fill(50, 50, 50);
          }
          text(a[i][j], lineThickness*3+tile.tileWidth*i+tile.tileWidth/2, lineThickness*4+tile.tileWidth*j+topBarHeight+tile.tileWidth/2);
        }
      }
    }
  }

  
  //draws the tiles using the activity of tiles in the tile array
  void drawTileArray(Tile[][] temp){
    for(int i = 0; i < boardSize[0]; i++){
      for(int j = 0; j < boardSize[1]; j++){
          temp[i][j].drawTile();
      }
    }
  }
  
  //stop displaying the tile if it was clicked
  void tileClicked(){
    //check if the mouse is currently within the bounds of the board
    if(mouseX>lineThickness*3 && mouseX<lineThickness*3+boardSize[0]*tile.tileWidth && mouseY > lineThickness*4+topBarHeight 
    && mouseY < lineThickness*4+topBarHeight + boardSize[1]*tile.tileWidth){
      
      //the tile clicked will be the position of the mouse in the board (adjusted) divided by the width of a tile
      int tileClickedX = (mouseX-lineThickness*3)/tile.tileWidth;
      int tileClickedY = ((mouseY-lineThickness*4)-topBarHeight)/tile.tileWidth;
      
      //clear the tile in the array that was determined to be clicked
      t1[tileClickedX][tileClickedY].isActive = false;
      
      if(gameMines[tileClickedX][tileClickedY].isActive){
        gamePhase = 1;
      }else{
        tilesLeft--;
      }
      
      if(tilesLeft == mineTotal){
        gamePhase = 2;
      }
    }
  }
  
  //display the mine icon if the mine is active
  void drawMines(){
    for(int i = 0; i < boardSize[0]; i++){
      for(int j = 0; j < boardSize[1]; j++){
          if(gameMines[i][j].isActive){
            gameMines[i][j].drawMine();
        }
      }
    }
  }
  
  //fills the tile array with new tile objects
  void fillTileArray(){
    for(int i = 0; i < boardSize[0]; i++){
      for(int j = 0; j < boardSize[1]; j++){
        t1[i][j] = new Tile(lineThickness*3+tile.tileWidth*i, lineThickness*4+tile.tileWidth*j+topBarHeight);
      }
    }
  }
  
  //fills the mines with active or inactive mines based on if the random mine array says so
  void fillMineArray(){
    for(int i = 0; i < boardSize[0]; i++){
      for(int j = 0; j < boardSize[1]; j++){
        if(game.mines[i][j] == 1){
          gameMines[i][j] = new Mine(lineThickness*3+tile.tileWidth*i+tile.tileWidth/2, lineThickness*4+tile.tileWidth*j+topBarHeight+tile.tileWidth/2, true);
        }
        else{
          gameMines[i][j] = new Mine(lineThickness*3+tile.tileWidth*i+tile.tileWidth/2, lineThickness*4+tile.tileWidth*j+topBarHeight+tile.tileWidth/2, false);
        }
      }
    }
  }
  
  //makes all tiles active
  void fillTiles(){
    for(int i = 0; i < boardSize[0]; i++){
      for(int j = 0; j < boardSize[1]; j++){
        t1[i][j].isActive = true;
      }
    }
  }
  
  //an assistive class for the fill board class
  void clearBoard(){
    for(int i = 0; i < boardSize[0]; i++){
      for(int j = 0; j < boardSize[1]; j++){
        mines[i][j] = 0;
      }
    }
  }
  
  //fill the random mine array
  void fillBoard(){
    int counter = mineTotal;
    
    clearBoard();
    
    while(counter > 0){
      int x = (int)(Math.random()*boardSize[0]);
      int y = (int)(Math.random()*boardSize[1]);
      
      if(mines[x][y] != 1){
        mines[x][y] = 1;
        counter--;
      }
    }
  }
}
