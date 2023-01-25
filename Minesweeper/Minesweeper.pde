//used as size references, all mines and tiles will be the same size as these references
Tile tile = new Tile(100, 100);
Mine mine = new Mine(100, 100, true);

//declare game objects
GUI main = new GUI();
Board game = new Board(0);
Tile[][] t1 = new Tile[game.boardSize[0]][game.boardSize[1]];

Mine[][] gameMines = new Mine[game.boardSize[0]][game.boardSize[1]];

void setup() {
  //runs once at the beginning of the program, the size will change instantly
  size(400, 400);
  surface.setTitle("Minesweeper!");
  pixelDensity(displayDensity());
  frameRate(60);
  
  PFont font;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = createFont("Avenir-Heavy", 128);
  textFont(font);
  
  game.fillBoard();
  game.fillTileArray();
  game.fillMineArray();
  game.fillTiles();
  game.fillProximityNumber();
  game.tilesLeft = game.boardSize[0]*game.boardSize[1];
}

void draw() {
  //runs every frame
  background(150);
  fill(255);
  triangle(0, height, 0, height-main.lineThickness, main.lineThickness, height-main.lineThickness);
  triangle(width, 0, width-main.lineThickness, 0, width-main.lineThickness, main.lineThickness);
  rect(0, 0, width-main.lineThickness, height-main.lineThickness);
  
  //ajusts the size of the window based on the board size
  surface.setSize(main.lineThickness*6+tile.tileWidth*game.boardSize[0], main.lineThickness*7+main.topBarHeight+tile.tileWidth*game.boardSize[1]);
  
  //draw the GUI
  main.drawGUI();
  
  
  if(game.gamePhase == 0 || game.gamePhase == 2){
    //draw the numbers
    game.drawProximityNumber(game.proximityNumber);
    
    //draw the mines
    game.drawMines();
    
    //draw the tiles over the mines
    game.drawTileArray(t1);
  }
  
  if(game.gamePhase == 1){
    //draw the numbers
    game.drawProximityNumber(game.proximityNumber);
    
    //draw the tiles
    game.drawTileArray(t1);
    
    //draw the mines over the tiles
    game.drawMines();
  }
}

void mouseClicked() {
  //runs only when the mouse is clicked
  if(main.smileyHover()){
    game.fillTiles();
    game.fillBoard();
    game.fillMineArray();
    game.gamePhase = 0;
    game.fillProximityNumber();
    game.tilesLeft = game.boardSize[0]*game.boardSize[1];
  }
  
  if(game.gamePhase == 0){
    game.tileClicked();
  }
}
